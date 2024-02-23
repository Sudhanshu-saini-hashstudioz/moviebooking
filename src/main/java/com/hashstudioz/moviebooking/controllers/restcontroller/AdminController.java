package com.hashstudioz.moviebooking.controllers.restcontroller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hashstudioz.moviebooking.dto.CreateShowRequest;
import com.hashstudioz.moviebooking.dto.CreateTheatreRequest;
import com.hashstudioz.moviebooking.entities.Invoice;
import com.hashstudioz.moviebooking.entities.Show;
import com.hashstudioz.moviebooking.entities.Theatre;
import com.hashstudioz.moviebooking.entities.User;
import com.hashstudioz.moviebooking.services.impl.CinemaService;
import com.hashstudioz.moviebooking.services.impl.InvoiceServiceImpl;
import com.razorpay.RazorpayException;

@RestController
@RequestMapping("/api/v1/admin")
public class AdminController {

	@Autowired
	private CinemaService cinemaService;
	@Autowired
	private ObjectMapper mapper;
	
	@Autowired
	private InvoiceServiceImpl invoiceService;

	
	
//	=========================   Users   =========================================================================
// ==============================================================================================================

	@GetMapping("/getusers")
	public ResponseEntity<List<User>> getAllUsers() {
		return ResponseEntity.ok(cinemaService.getAllUsers());
	}

	@GetMapping("/getuser")
	public User findUserByEmail(@RequestParam String email) {
		return cinemaService.findUserByEmail(email);
	}

	@GetMapping("/getuserbyname")
	public ResponseEntity<List<User>> getUserByName(@RequestParam("name") String name) {
		return ResponseEntity.ok(cinemaService.getUserByName(name));
	}

	@PutMapping("/updateuser")
	public User updateUser(@RequestParam("id") int id, @RequestParam("status") String status) {
		return cinemaService.updateUser(id, status);
	}

	@DeleteMapping("/deleteuser")
	public ResponseEntity<?> deleteUserByEmail(@RequestParam("email") String email) {
		
		return ResponseEntity.ok(cinemaService.deleteUserByEmail(email));
	}
	
	
	

//	=========================   Theaters ========================================================================
// ==============================================================================================================

	@PostMapping("/addtheatres")
	public ResponseEntity<Theatre> createTheatre(@RequestBody CreateTheatreRequest theatreRequest) {
		return new ResponseEntity<>(cinemaService.createTheatre(theatreRequest), HttpStatus.OK);
	}

	@GetMapping("/gettheatres")
	public ResponseEntity<List<Theatre>> getTheatres() {
		return ResponseEntity.ok(cinemaService.getAllTheatre());
	}

	@GetMapping("/gettheatrebyname")
	public ResponseEntity<List<Theatre>> getTheatre(@RequestParam("name") String theatreName) {
		return ResponseEntity.ok(cinemaService.getTheatreByTheatreName(theatreName));
	}

	@GetMapping("/getalltheatre")
	public ResponseEntity<List<Theatre>> getAllTheatresByName(@RequestParam("name") String name) {
		return ResponseEntity.ok(cinemaService.findAllTheatres(name));
	}

	@DeleteMapping("/deletetheatre")
	public ResponseEntity<?> deleteTheatreById(@RequestParam("id") long id) {
		return ResponseEntity.ok(cinemaService.deleteTheatreData(id));
	}
	
	
	
	

//	=========================   Shows ===========================================================================
// ==============================================================================================================

	@PostMapping("/addshows")
	public ResponseEntity<?> createShows(@RequestParam("showData") String showData,
			@RequestParam("files") List<MultipartFile> files)
			throws IllegalStateException, IOException, ParseException {
		CreateShowRequest showRequest = this.mapper.readValue(showData, CreateShowRequest.class);
		return new ResponseEntity<>(cinemaService.createShow(showRequest, files), HttpStatus.OK);
	}

	@GetMapping("/getshowslist")
	public ResponseEntity<List<Show>> getShowsList() {
		return ResponseEntity.ok(cinemaService.findShows());
	}

	@GetMapping("/getshow")
	public List<Show> shows(@RequestParam long theatreId, @RequestParam int screenId) {
		List<Show> showsList = cinemaService.getShows(theatreId, screenId);
		return showsList;
	}

	@PutMapping("/updateshow")
	public ResponseEntity<Show> updateShow(@RequestBody Show showRequest) {
		return new ResponseEntity<>(cinemaService.updateShow(showRequest), HttpStatus.OK);
	}

	@DeleteMapping("/deleteshow")
	public String deleteShow(@RequestParam("id") long showId) {
		cinemaService.deleteData(showId);
		return "Show Deleted Successfully";
	}
	
	
	
	

//=========================   Invoices =========================================================================
//==============================================================================================================	

	@GetMapping("/getallinvoice")
	public ResponseEntity<List<Invoice>> getAllInvoices() {
		return ResponseEntity.ok(invoiceService.getAllInvoices());
	}

	@GetMapping("/getallinvoicebyemail")
	public ResponseEntity<List<Invoice>> getAllInvoicesByEmail(@RequestParam("email") String email) throws RazorpayException {
		return ResponseEntity.ok(invoiceService.getAllInvoicesByEmail(email));
	}

	@GetMapping("/getUserInvoices")
	public ResponseEntity<List<Invoice>> getUserInvoices(@RequestParam("email") String email) {
		return ResponseEntity.ok(invoiceService.getUserInvoices(email));
	}

	@DeleteMapping("/deleteInvoiceById")
	public ResponseEntity<?> deleteInvoiceById(@RequestParam("userId") String userId) {
		return ResponseEntity.ok(cinemaService.deleteInvoiceById(userId));
	}
}
