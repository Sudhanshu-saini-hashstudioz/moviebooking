package com.hashstudioz.moviebooking.services.impl;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import java.util.Date;
import java.util.HashMap;

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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.hashstudioz.moviebooking.dto.CreateInvoiceRequest;
import com.hashstudioz.moviebooking.dto.CreateShowRequest;
import com.hashstudioz.moviebooking.dto.CreateTheatreRequest;
import com.hashstudioz.moviebooking.entities.FileEntity;
import com.hashstudioz.moviebooking.entities.Invoice;
import com.hashstudioz.moviebooking.entities.Show;
import com.hashstudioz.moviebooking.entities.Theatre;
import com.hashstudioz.moviebooking.entities.User;
import com.hashstudioz.moviebooking.entities.classenum.Status;
import com.hashstudioz.moviebooking.repository.UserRepo;
import com.hashstudioz.moviebooking.repository.theater.InvoiceRepository;
import com.hashstudioz.moviebooking.repository.theater.ShowRepository;
import com.hashstudioz.moviebooking.repository.theater.TheatreRepository;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class CinemaService {

	@Autowired
	private TheatreRepository theatreRepo;
	@Autowired
	private ShowRepository showRepo;
	@Autowired
	private UserRepo userRepo;
	@Autowired
	private InvoiceRepository invoiceRepo;
//	@Autowired 
//	private EmailServiceImpl emailService;

	
/*-----------------------------------User---------------------------------------*/

//	public Page<User> getAllUsers(Pageable pageable) {
//		return userRepo.findAll(pageable);
//	}

	public List<User> getAllUsers() {
		return userRepo.findUsers();
	}

	public List<User> getUserByName(String name) {
		return userRepo.findByNameLike(name);
	}

	public User findUserByEmail(String email) {
		return userRepo.findByEmail(email).get();
	}

	public User updateUser(int id, String status) {
		User user = userRepo.findById(id).get();
		user.setStatus(Status.valueOf(status));
		user.setDeleted(false);
		user.setModifiedDate(LocalDate.now().toString());
		return user;
	}

	public String deleteUserByEmail(String email) {
		userRepo.deleteByEmail(email);
		return "User Deleted Sucessfully";
	}

	
/*-------------------------------- Theatre--------------------------------------*/

	public Theatre createTheatre(CreateTheatreRequest theatreRequest) {
		Theatre theatre = new Theatre();
		theatre.setTheatreName(theatreRequest.getTheatreName());
		theatre.setCity(theatreRequest.getCity());
		return theatreRepo.save(theatre);
	}

	public String deleteTheatreData(long theatreId) {
		theatreRepo.deleteTheatre(theatreId);

		List<Show> showsList = showRepo.findByTheatreTheatreId(theatreId);
		for (Show show : showsList) {
			invoiceRepo.deleteInvoiceByShowId(show.getShowId());
			showRepo.deleteShow(show.getShowId());
		}
		return "Theatre Data Deleted !!";
	}

	public List<Theatre> getAllTheatre() {
		return theatreRepo.findTheatre();
	}

	public List<Theatre> getTheatreByTheatreName(String theatreName) {
		return theatreRepo.findByTheatreName(theatreName);
	}

	public List<Theatre> findAllTheatres(String name) {
		return theatreRepo.findAllTheatreByName(name);
	}

	
/*---------------------------------Show------------------------------*/

	@SuppressWarnings("deprecation")
	public Show createShow(CreateShowRequest showRequest, List<MultipartFile> files)
			throws IllegalStateException, IOException, ParseException {

		Theatre theatre = theatreRepo.findById(showRequest.getTheatre().getTheatreId()).orElseThrow(
				() -> new RuntimeException("Theater not found with ID: " + showRequest.getTheatre().getTheatreId()));
		Show show = new Show();
		show.setUpcomingShows(showRequest.getUpcomingShows());
		show.setRunningTime(getTime(showRequest.getRunningTime()).toLocaleString());
		show.setTheatre(theatre);
		show.setScreenId(showRequest.getScreenId());
		show.setCapacity(showRequest.getCapacity());
		show.setDescription(showRequest.getDescription());
		show.setGenre(showRequest.getGenre());
		show.setRating(showRequest.getRating());
		show.setLanguage(showRequest.getLanguage());
		show.setCast(showRequest.getCast());

		for (MultipartFile file : files) {
			String filename = file.getOriginalFilename();
			byte[] data = file.getBytes();
			FileEntity fileEntity = new FileEntity();
			fileEntity.setFilename(filename);
			fileEntity.setImagedata(data);
			fileEntity.setShow(show);
			show.getFiles().add(fileEntity);
		}

		return showRepo.save(show);
	}

	public List<Show> getShows(long theaterId, int screenId) {
		return showRepo.findByTheatreTheatreIdAndScreenId(theaterId, screenId);
	}

	public Show getShowById(long showId) {
		return showRepo.findById(showId).get();
	}

	public List<Show> findShowByName(String name) {
		return showRepo.findByShowByNameLike(name);
	}

	public List<Show> getDistinctShowsList() {
		List<String> uniqueShow = showRepo.findDistinctShow();
		List<Show> uniqueShowList = new ArrayList<>();

		for (String name : uniqueShow) {
			Show show = showRepo.findByUpcomingShows(name).get(0);
			uniqueShowList.add(show);
		}
		return uniqueShowList;
	}

	public List<Show> findShows() {
		return showRepo.findShows();
	}

	public List<Show> findShowByNameAndCity(String name) {
		List<String> uniqueShow = showRepo.findByShowNameAndCity(name);
		List<Show> uniqueShowList = new ArrayList<>();

		for (String showname : uniqueShow) {
			Show show = showRepo.findByUpcomingShows(showname).get(0);
			uniqueShowList.add(show);
		}
		return uniqueShowList;
	}

	public Show updateShow(Show showRequest) {

		Show show = showRepo.findById(showRequest.getShowId()).get();
		show.setUpcomingShows(showRequest.getUpcomingShows());
		show.setTheatre(showRequest.getTheatre());
		show.setRunningTime(showRequest.getRunningTime());
		show.setScreenId(showRequest.getScreenId());
		show.setBookedSeat(null);
		return show;
	}

	public void deleteData(long showId) {
		invoiceRepo.deleteInvoiceByShowId(showId);
		showRepo.deleteShow(showId);
	}

	public List<Show> findShowTime(String name) {
		return showRepo.findByUpcomingShows(name);
	}

	

	/*----------------------------Final Ticket--------------------------*/

	public byte[] downloadTicket(long id) {

		try {
			byte[] pdfBytes = generateTicketPDF(invoiceRepo.findById(id).get());
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_PDF);
			headers.setContentDispositionFormData("download", "ticket.pdf");
			System.out.println("Return sucess function");
			return pdfBytes;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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

	public Object deleteTheaterById(long id) {

		return null;
	}

	public Date getTime(String inputDate) throws ParseException {
		SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm");
		Date parsedDate = inputFormat.parse(inputDate);
		return parsedDate;
	}

	public String deleteInvoiceById(String userId) {
		invoiceRepo.deleteByInvoiceId(userId);
		return "Deleted";
	}
}
