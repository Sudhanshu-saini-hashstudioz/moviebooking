package com.hashstudioz.moviebooking.controller;

import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.hashstudioz.moviebooking.dto.CreateInvoiceRequest;
import com.hashstudioz.moviebooking.entities.Invoice;
import com.hashstudioz.moviebooking.entities.Show;
import com.hashstudioz.moviebooking.entities.Ticket;
import com.hashstudioz.moviebooking.repository.theater.InvoiceRepository;
import com.hashstudioz.moviebooking.services.impl.CinemaService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/v1/user")
@RequiredArgsConstructor
public class UserController {

	@Autowired
	private CinemaService cinemaService;
	@Autowired
	private InvoiceRepository invoiceRepo;

	@GetMapping
	public ResponseEntity<String> sayHello() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		return ResponseEntity.ok(authentication.getName());
	}

	@GetMapping("/availableseats")
	public Set<String> getSeats(@RequestBody Show show) {
		return cinemaService.getAvailableSeats(show);
	}

	/*-------- before getInvoice you have to pay the payment 
		       for ticket if success then move for next step 
		       for generate tickets -------------------------------------------*/

	@GetMapping("/getinvoice")
	public Invoice getInvoice(@RequestBody CreateInvoiceRequest invoiceRequest, Authentication auth) {
		auth.getPrincipal();
		return cinemaService.createInvoice(invoiceRequest);
	}

	@GetMapping("/generateticket")
	public Ticket generateTicket(@RequestParam long invoiceId) {
		return cinemaService.getFinalTicket(invoiceId);

	}

	@DeleteMapping("/cancelticket")
	public void cancelTicket(@RequestParam long invoiceId) {
		invoiceRepo.deleteById(invoiceId);
	}

	@GetMapping("/photo")
	public ResponseEntity<FileSystemResource> getPhoto(@RequestParam String photoFileName) {

		String photoFolderPath = "C:/Users/HSTPL_LAP_157/Desktop/Pics/";

		String photoPath = photoFolderPath + photoFileName;

		return ResponseEntity.ok(new FileSystemResource(photoPath));
	}
}
