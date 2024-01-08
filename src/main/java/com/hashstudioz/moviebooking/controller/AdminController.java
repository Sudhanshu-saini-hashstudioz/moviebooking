package com.hashstudioz.moviebooking.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
import com.hashstudioz.moviebooking.dto.CreateShowRequest;
import com.hashstudioz.moviebooking.dto.CreateTheaterRequest;
import com.hashstudioz.moviebooking.dto.SignUpRequest;
import com.hashstudioz.moviebooking.entities.Invoice;
import com.hashstudioz.moviebooking.entities.Show;
import com.hashstudioz.moviebooking.entities.Theater;
import com.hashstudioz.moviebooking.entities.User;
import com.hashstudioz.moviebooking.services.impl.CinemaService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/v1/admin")
@RequiredArgsConstructor
public class AdminController {

	@Autowired
	private CinemaService cinemaService;

	@GetMapping("/users")
    public Page<User> getAllUsers(Pageable pageable) {
        return cinemaService.getAllUsers(pageable);
    }
	
	@GetMapping("/user")
	public User findUserByEmail(@RequestParam String email) {
		return cinemaService.findUserByEmail(email);
	}
	
	@PutMapping("/updateuser") 
	public User updateUser(@RequestBody SignUpRequest signUpRequest) {
		return cinemaService.updateUser(signUpRequest);
	}
	
	
	@DeleteMapping("/deleteuser")
	public String deleteUserByEmail(@RequestParam String email) {
		return cinemaService.deleteUserByEmail(email);
	}
	
	@PostMapping("/addtheaters")
	public ResponseEntity<Theater> createTheater(@RequestBody CreateTheaterRequest theaterRequest) {
		Theater theater = cinemaService.createTheater(theaterRequest);
		return new ResponseEntity<>(theater, HttpStatus.OK);
	}
	
	
	@PostMapping("/addshows")
	public ResponseEntity<Show> createShows(@RequestBody CreateShowRequest showRequest) {
		Show show = cinemaService.createShow(showRequest);
		return new ResponseEntity<>(show, HttpStatus.OK);
	}
	
	
//	@GetMapping("/getshows") 
//    public Page<Show> shows(@RequestBody CreateShowRequest showRequest, Pageable pageable) {
//        int screenId = showRequest.getScreenId();
//        long theaterId = showRequest.getTheater().getTheaterId();
//        return cinemaService.getShows(theaterId, screenId, pageable);
//    }
	
	@GetMapping("/getshows") 
    public Page<Show> shows(@RequestParam int screenId, @RequestParam long theaterId,Pageable pageable) {
        System.out.println("ScreenId ="+screenId+" TheaterId = "+theaterId);
		return cinemaService.getShows(theaterId, screenId, pageable);
    }
	
	@PutMapping("/updateshow")
	public ResponseEntity<Show> updateShow(@RequestBody Show showRequest) {
		return new ResponseEntity<>(cinemaService.updateShow(showRequest), HttpStatus.OK);
	}
	
	@DeleteMapping("/deleteshow")
	public String deleteShow(@RequestParam long showId) {
		cinemaService.deleteData(showId);
		return "Show Deleted Successfully";
	}
	
	@GetMapping("/getallinvoices")  //error Access Denied
	public ResponseEntity<Page<Invoice>> getAllInvoices(Pageable pageable) {
        Page<Invoice> invoices = cinemaService.getAllInvoices(pageable);
        return ResponseEntity.ok(invoices);
    }

}
