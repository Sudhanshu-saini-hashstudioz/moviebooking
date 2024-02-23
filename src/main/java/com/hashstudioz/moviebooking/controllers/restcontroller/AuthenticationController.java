package com.hashstudioz.moviebooking.controllers.restcontroller;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.font.Standard14Fonts;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.hashstudioz.moviebooking.dto.JwtAuthenticationResponse;
import com.hashstudioz.moviebooking.dto.RefreshTokenRequest;
import com.hashstudioz.moviebooking.dto.SignInRequest;
import com.hashstudioz.moviebooking.dto.SignUpRequest;
import com.hashstudioz.moviebooking.entities.Invoice;
import com.hashstudioz.moviebooking.entities.Show;
import com.hashstudioz.moviebooking.entities.Theatre;
import com.hashstudioz.moviebooking.entities.User;
import com.hashstudioz.moviebooking.repository.theater.InvoiceRepository;
import com.hashstudioz.moviebooking.repository.theater.ShowRepository;
import com.hashstudioz.moviebooking.repository.theater.TheatreRepository;
import com.hashstudioz.moviebooking.services.AuthenticationService;
import com.hashstudioz.moviebooking.services.impl.CinemaService;

@RestController
@RequestMapping("/api/v1/auth")
public class AuthenticationController {

	@Autowired
	private TheatreRepository theatreRepo;
	@Autowired
	private ShowRepository showRepo;
	@Autowired
	private CinemaService cinemaService;
	@Autowired
	private InvoiceRepository invoiceRepo;

	@Autowired
	private AuthenticationService authenticationService;

	@GetMapping("/getAlltheaters")
	public Page<Theatre> getAllTheaters(Pageable pageable) {
		return theatreRepo.findAll(pageable);
	}

	@GetMapping("/upcomingshows")
	public Page<Show> upcomingShows(Pageable pageable) {
		return showRepo.findAll(pageable);
	}

	@GetMapping("/upcomingshowsbyname")
	public Page<Show> upcomingShowsByName(@RequestParam String name, Pageable pageable) {
		return showRepo.findByUpcomingShows(name, pageable);
	}

	@GetMapping("/getshowbyid")
	public ResponseEntity<Show> getShowById(@RequestParam("id") long showId) {
		return ResponseEntity.ok(cinemaService.getShowById(showId));
	}

	@GetMapping("/getshowslist")
	public ResponseEntity<List<Show>> getDistinctShowsList() {
		return ResponseEntity.ok(cinemaService.getDistinctShowsList());
	}

	@GetMapping("/showtime")
	public ResponseEntity<List<Show>> getShowTimes(@RequestParam("name") String name) {
		return ResponseEntity.ok(cinemaService.findShowTime(name));
	}

	@GetMapping("/getshowsbyname")
	public ResponseEntity<List<Show>> getShowsByName(@RequestParam("name") String name) {
		return ResponseEntity.ok(cinemaService.findShowByName(name));
	}

	@GetMapping("/getshowsbynameandcity")
	public ResponseEntity<List<Show>> getShowsByNameAndCity(@RequestParam("name") String name) {
		return ResponseEntity.ok(cinemaService.findShowByNameAndCity(name));
	}

	@PostMapping("/signup")
	public ResponseEntity<User> signUp(@RequestBody SignUpRequest signUpRequest) {
		User user = authenticationService.signUp(signUpRequest);
		return ResponseEntity.ok(user);
	}

	@PostMapping("/signin")
	public ResponseEntity<JwtAuthenticationResponse> signIn(@RequestBody SignInRequest signInrequest) {
		return ResponseEntity.ok(authenticationService.signIn(signInrequest));

	}

	@PostMapping("/refresh")
	public ResponseEntity<JwtAuthenticationResponse> refresh(@RequestBody RefreshTokenRequest refreshTokenRequest) {
		return ResponseEntity.ok(authenticationService.refreshToken(refreshTokenRequest));
	}

	@GetMapping("/theatersbycity")
	public Page<Theatre> getTheatersByCity(@RequestParam String name, Pageable pageable) {
		return theatreRepo.findByCity(name, pageable);
	}

	@GetMapping("/userdetails")
	public String getUserDetails(Authentication authentication) {
		User principal = (User) authentication.getPrincipal();
		return principal.getRole().toString();
	}


	// get pdf ticket
	@GetMapping("/downloadTicket")
	public ResponseEntity<byte[]> downloadTicket(@RequestParam("id") long id) {
		try {

			byte[] pdfBytes = generateTicketPDF(invoiceRepo.findById(id).get());
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_PDF);
			headers.setContentDispositionFormData("download", "ticket.pdf");
			System.out.println("Return sucess function");
			return ResponseEntity.ok().headers(headers).body(pdfBytes);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(500).body(null);
		}
	}

	private byte[] generateTicketPDF(Invoice invoice) throws IOException, WriterException {
		PDDocument document = new PDDocument();
		PDPage page = new PDPage(new PDRectangle(400, 350));

		page.getCropBox();
		document.addPage(page);
		try (PDPageContentStream contentStream = new PDPageContentStream(document, page)) {
			contentStream.setFont(new PDType1Font(Standard14Fonts.FontName.HELVETICA_BOLD), 14);

			contentStream.drawImage(PDImageXObject.createFromByteArray(document,
					invoice.getShow().getFiles().get(0).getImagedata(), "image"), 20, 230, 70, 100);

			contentStream.beginText();
			contentStream.newLineAtOffset(120, 305);
			contentStream.showText(invoice.getShow().getUpcomingShows());
			contentStream.newLineAtOffset(0, -30);
			contentStream.setFont(new PDType1Font(Standard14Fonts.FontName.HELVETICA), 12);
			contentStream.showText(invoice.getShow().getRunningTime());
			contentStream.newLineAtOffset(0, -20);
			contentStream.showText(
					invoice.getShow().getTheatre().getTheatreName() + " , " + invoice.getShow().getTheatre().getCity());
			contentStream.newLineAtOffset(0, -20);
			contentStream.endText();

			// starting point and length of line
			float startX = 5;
			float startY = 200;
			float length = 395;
			float dotLength = 3;
			// Length of each dot
			float gapLength = 2;
			// Length of the gap between dots
			// Begin a new path
			contentStream.moveTo(startX, startY);
			// Draw the dotted line
			float currentX = startX;
			boolean drawDot = true;
			while (currentX < startX + length) {
				if (drawDot) {
					// Move to the end of the dot
					contentStream.lineTo(Math.min(currentX + dotLength, startX + length), startY);
				} else {
					// Move to the end of the gap
					contentStream.moveTo(Math.min(currentX + gapLength, startX + length), startY);

				}
				currentX += dotLength + gapLength;
				drawDot = !drawDot;
			}
			// Set the line style to dotted
			contentStream.setLineDashPattern(new float[] { dotLength, gapLength }, 0);
			// Set the stroke color and width
			contentStream.setStrokingColor(Color.BLACK);
			contentStream.setLineWidth(1);
			// Draw the line
			contentStream.stroke();

			// for qr code and content
			contentStream.beginText();
			contentStream.newLineAtOffset(120, 152);
			contentStream.setNonStrokingColor(Color.DARK_GRAY);
			contentStream.showText("" + invoice.getSeatNumber().size() + " Ticket(s)");
			contentStream.newLineAtOffset(0, -20);
			contentStream.setNonStrokingColor(Color.BLACK);
			contentStream.setFont(new PDType1Font(Standard14Fonts.FontName.HELVETICA), 16);
			contentStream.showText("SCREEN " + invoice.getShow().getScreenId() + " ONYX");
			contentStream.newLineAtOffset(0, -20);

			contentStream.setFont(new PDType1Font(Standard14Fonts.FontName.HELVETICA), 12);
			contentStream.setNonStrokingColor(Color.DARK_GRAY);
			contentStream.showText("" + invoice.getSeatNumber());
			contentStream.newLineAtOffset(0, -20);
			contentStream.endText();
			contentStream.setNonStrokingColor(Color.BLACK);
			String qrCodeContent = "http://localhost:1212/movie/home";
			BufferedImage bufferedImage = generateQRCode(qrCodeContent);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(bufferedImage, "png", baos);
			byte[] qrCodeBytes = baos.toByteArray();
			contentStream.drawImage(PDImageXObject.createFromByteArray(document, qrCodeBytes, "QR Code"), 10, 84, 100,
					100);

			startX = 5;
			startY = 70;
			length = 395;
			dotLength = 3;
			gapLength = 2;
			contentStream.moveTo(startX, startY);
			currentX = startX;
			drawDot = true;
			while (currentX < startX + length) {
				if (drawDot) {
					contentStream.lineTo(Math.min(currentX + dotLength, startX + length), startY);
				} else {
					contentStream.moveTo(Math.min(currentX + gapLength, startX + length), startY);
				}
				currentX += dotLength + gapLength;
				drawDot = !drawDot;
			}
			contentStream.setLineDashPattern(new float[] { dotLength, gapLength }, 0);
			contentStream.setStrokingColor(Color.BLACK);
			contentStream.setLineWidth(1);
			contentStream.stroke();

			// for payment
			contentStream.beginText();
			contentStream.newLineAtOffset(20, 37);
			contentStream.showText("Total Amount ");
			contentStream.newLineAtOffset(280, 0);
			contentStream.showText("Rs." + invoice.getTotalPrice());

			contentStream.setNonStrokingColor(Color.RED);
			contentStream.newLineAtOffset(0, -20);
			contentStream.showText("- Rs. " + 0.00);
			contentStream.newLineAtOffset(-280, 0);
			contentStream.showText("Discount ");

			contentStream.endText();

			contentStream.close();
			contentStream.closeAndFillAndStroke();
			contentStream.closeAndStroke();
		}

		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		document.save(baos);
		document.close();
		return baos.toByteArray();
	}

	// for Qr code
	private BufferedImage generateQRCode(String content) throws WriterException {
		int width = 200;
		int height = 200;

		Map<EncodeHintType, Object> hints = new HashMap<>();
		hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");

		BitMatrix bitMatrix = new QRCodeWriter().encode(content, BarcodeFormat.QR_CODE, width, height, hints);
		BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

		for (int x = 0; x < width; x++) {
			for (int y = 0; y < height; y++) {
				bufferedImage.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF);
			}
		}

		return bufferedImage;
	}

	@PostMapping("/setpendingseats")
	public void SetPendingSeats(@RequestParam("pendingSeats") List<Integer> pendingSeats,
			@RequestParam("id") long showId) {

		Show show = showRepo.findById(showId).get();
		List<Integer> seat = show.getPendingSeats();
		for(Integer seatNumber : pendingSeats) {
			seat.add(seatNumber);
		}
		show.setPendingSeats(seat);
	}
}
