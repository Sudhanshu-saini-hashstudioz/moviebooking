package com.hashstudioz.moviebooking.controllers.restcontroller;

import java.io.IOException;
import java.text.ParseException;
import java.util.Arrays;
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
import com.hashstudioz.moviebooking.dto.CreateTheaterRequest;
import com.hashstudioz.moviebooking.entities.Invoice;
import com.hashstudioz.moviebooking.entities.Show;
import com.hashstudioz.moviebooking.entities.Theater;
import com.hashstudioz.moviebooking.entities.User;
import com.hashstudioz.moviebooking.repository.theater.ShowRepository;
import com.hashstudioz.moviebooking.services.impl.CinemaService;

@RestController
@RequestMapping("/api/v1/admin")
public class AdminController {

	@Autowired
	private CinemaService cinemaService;
	@Autowired
	private ObjectMapper mapper;
	
	@Autowired
	private ShowRepository showRepo;

	@GetMapping("/getusers")
	public ResponseEntity<List<User>> getAllUsers() {
		List<User> usersList = cinemaService.getAllUsers();
		return ResponseEntity.ok(usersList);
	}

	@GetMapping("/getuser")
	public User findUserByEmail(@RequestParam String email) {
		return cinemaService.findUserByEmail(email);
	}
	
	@GetMapping("/getuserbyname")
	public ResponseEntity<List<User>> getUserByName(@RequestParam("name") String name){
		 return ResponseEntity.ok(cinemaService.getUserByName(name));
	}

	@GetMapping("/gettheaters")
	public ResponseEntity<List<Theater>> getAllTheaters() {
		List<Theater> theatersList = cinemaService.getAllTheater();
		return ResponseEntity.ok(theatersList);
	}
	
	@GetMapping("/gettheaterbyname")
	public ResponseEntity<List<Theater>> getTheater(@RequestParam("name") String theaterName) {
		return ResponseEntity.ok(cinemaService.getTheaterByTheaterName(theaterName));
	}
	
	@GetMapping("/getshowslist")
	public ResponseEntity<List<Show>> getShowsList(){
		List<Show> list = showRepo.findAll();
		return ResponseEntity.ok(list);
	}

	@GetMapping("/getshow")
	public List<Show> shows( @RequestParam long theaterId,@RequestParam int screenId) {
		List<Show> showsList = cinemaService.getShows(theaterId,screenId);
		return showsList;
	}

	@GetMapping("/getallinvoice")
	public ResponseEntity<List<Invoice>> getAllInvoices() {
		System.out.println("sucess");
		return ResponseEntity.ok(cinemaService.getAllInvoices());
	}

	@PutMapping("/updateuser")
	public User updateUser(@RequestParam("id") int id , @RequestParam("status") String status) {
		return cinemaService.updateUser(id , status);
	}

	@PutMapping("/updateshow")
	public ResponseEntity<Show> updateShow(@RequestBody Show showRequest) {
		return new ResponseEntity<>(cinemaService.updateShow(showRequest), HttpStatus.OK);
	}

	@PostMapping("/addtheaters")
	public ResponseEntity<Theater> createTheater(@RequestBody CreateTheaterRequest theaterRequest) {
		return new ResponseEntity<>(cinemaService.createTheater(theaterRequest), HttpStatus.OK);
	}

	@PostMapping("/addshows")
	public ResponseEntity<?> createShows(@RequestParam("showData") String showData , @RequestParam("files") List<MultipartFile> files) throws IllegalStateException, IOException, ParseException {
		System.out.println("enter Sucess");
		CreateShowRequest showRequest = this.mapper.readValue(showData, CreateShowRequest.class);
		return new ResponseEntity<>(cinemaService.createShow(showRequest , files), HttpStatus.OK);
	}

	@DeleteMapping("/deleteuser")
	public ResponseEntity<?> deleteUserByEmail(@RequestParam("email") String email) {
		return ResponseEntity.ok(cinemaService.deleteUserByEmail(email));
	}
	@DeleteMapping("/deletetheater")
	public ResponseEntity<?> deleteTheaterById(@RequestParam("id") long id){
		return ResponseEntity.ok(cinemaService.deleteTheaterData(id));
	}

	@DeleteMapping("/deleteshow")
	public String deleteShow(@RequestParam long showId) {
		cinemaService.deleteData(showId);
		return "Show Deleted Successfully";
	}
	
	@PostMapping("/files")
	public ResponseEntity<?> uploadMultipleFiles(@RequestParam("images") MultipartFile[] files){
		Arrays.stream(files).forEach(MultipartFile ->{
			System.out.println(MultipartFile.getOriginalFilename());
		});
		return ResponseEntity.ok("file Uploaded");
	}
}
