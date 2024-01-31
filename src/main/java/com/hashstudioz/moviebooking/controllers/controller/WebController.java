package com.hashstudioz.moviebooking.controllers.controller;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hashstudioz.moviebooking.dto.CreateInvoiceRequest;
import com.hashstudioz.moviebooking.entities.Invoice;
import com.hashstudioz.moviebooking.services.impl.CinemaService;

@Controller
@RequestMapping("/movie")
public class WebController {

	@Autowired
	private CinemaService cinemaService;
	
	@GetMapping("/logo1.png")
	public ResponseEntity<?> getLogo() {
		try {
			Resource resource = new ClassPathResource("static/images/logo1.png");
			return ResponseEntity.ok().contentType(MediaType.IMAGE_PNG).body(resource);
			
		}catch(Exception e) {
			return ResponseEntity.notFound().build();
		}
		
	}
	
	@GetMapping("/background1.png")
	public ResponseEntity<?> getBackGroundImage() {
		try {
			Resource resource = new ClassPathResource("static/images/background1.png");
			return ResponseEntity.ok().contentType(MediaType.IMAGE_PNG).body(resource);
			
		}catch(Exception e) {
			return ResponseEntity.notFound().build();
		}
		
	}

	@GetMapping("/home")
	public String homePage(Model model) {
		return "home";
	}

	@GetMapping("/loginpage")
	public String loginPage() {
		return "loginpage";
	}

	@GetMapping("/signuppage")
	public String signupPage() {
		return "signuppage";
	}
	
	@GetMapping("/movie")
	public String getMovieDetails() {
		return "show";
	}
	@GetMapping("/getseat")
	public String getSeats() {
		return "seat";
	}
	@GetMapping("/payment")
	public String getPaymentDetails() {
		return "payment";
	}
	
	@GetMapping("/getuserbookings")
	public String getUserBookings() {
		return "userbookings";
	}
	

	@GetMapping("/adminhome")
	public String adminHome() {
		return "adminhome";
	}

	@GetMapping("/users")
	public String getAllUsers() {
		return "users";
	}
	
	@GetMapping("/theaters")
	public String theater() {
		return "theaters";
	}
	
	@GetMapping("/theaterform")
	public String theaterForm() {
		return "create_theater_form";
	}
	
	@GetMapping("/shows")
	public String getShows() {
		return "shows";
	}

	@GetMapping("/createshow")
	public String createShowForm() {
		return "create_show_form";
	}

	@GetMapping("/bookings")
	public String getAllBookings() {
		return "bookings";
	}

	@GetMapping("/getinvoice")
	public Invoice getInvoice(@RequestBody CreateInvoiceRequest invoiceRequest, Authentication auth) {
		auth.getPrincipal();
		return cinemaService.createInvoice(invoiceRequest);
	}

}
