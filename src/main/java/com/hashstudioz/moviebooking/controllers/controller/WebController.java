package com.hashstudioz.moviebooking.controllers.controller;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/movie")
public class WebController {

	@GetMapping("/logo1.png")
	public ResponseEntity<?> getLogo() {
		try {
			Resource resource = new ClassPathResource("static/images/logo1.png");
			return ResponseEntity.ok().contentType(MediaType.IMAGE_PNG).body(resource);
			
		}catch(Exception e) {
			return ResponseEntity.notFound().build();
		}	
	}
	
	@GetMapping("/bg.png")
	public ResponseEntity<?> getBackGroundImage() {
		try {
			Resource resource = new ClassPathResource("static/images/bg1.jpg");
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
	
	@GetMapping("/selectshow")
	public String selectShow() {
		return "selectshow";
	}
	
	@GetMapping("/getseat")
	public String getSeats() {
		return "seat";
	}
	@GetMapping("/payment")
	public String getPaymentDetails() {
		return "payment";
	}
	
	@GetMapping("/userbookings")
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
	
	@GetMapping("/theatres")
	public String theatre() {
		return "theatres";
	}
	
	@GetMapping("/theatreform")
	public String theatreForm() {
		return "create_theatre_form";
	}
	
	@GetMapping("/shows")
	public String getShows() {
		return "shows";
	}

	@GetMapping("/createshow")
	public String createShowForm() {
		return "create_show_form";
	}
	
	@GetMapping("/showform")
	public String showForm() {
		return "form";
	}

	@GetMapping("/bookings")
	public String getAllBookings() {
		return "bookings";
	}
	
	@GetMapping("/form")
	public String getForm() {
		return "form";
	}

}
