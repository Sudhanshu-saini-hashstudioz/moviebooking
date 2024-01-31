package com.hashstudioz.moviebooking.controllers.restcontroller;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.hashstudioz.moviebooking.dto.JwtAuthenticationResponse;
import com.hashstudioz.moviebooking.dto.RefreshTokenRequest;
import com.hashstudioz.moviebooking.dto.SignInRequest;
import com.hashstudioz.moviebooking.dto.SignUpRequest;
import com.hashstudioz.moviebooking.entities.Show;
import com.hashstudioz.moviebooking.entities.Theater;
import com.hashstudioz.moviebooking.entities.User;
import com.hashstudioz.moviebooking.repository.theater.ShowRepository;
import com.hashstudioz.moviebooking.repository.theater.TheaterRepository;
import com.hashstudioz.moviebooking.services.AuthenticationService;
import com.hashstudioz.moviebooking.services.impl.CinemaService;

@RestController
@RequestMapping("/api/v1/auth")
public class AuthenticationController {
	
	@Autowired
	private TheaterRepository theaterRepo;
	@Autowired
	private ShowRepository showRepo;
	@Autowired
	private CinemaService cinemaService;
	
	@Autowired
	private AuthenticationService authenticationService;

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
	
	@GetMapping("/getAlltheaters")
	public Page<Theater> getAllTheaters(Pageable pageable) {
        return theaterRepo.findAll(pageable);
    }
	
	@GetMapping("/upcomingshows") 
	public Page<Show> upcomingShows(Pageable pageable){
		return showRepo.findAll(pageable);
	}
	
	
	
	@GetMapping("/upcomingshowsbyname") //error
	public Page<Show> upcomingShowsByName(@RequestParam String name , Pageable pageable){
		return showRepo.findByUpcomingShows(name , pageable);
	}
	
	@GetMapping("/getshowbyid")
	public ResponseEntity<Show> getShowById(@RequestParam("id") long showId){
		return ResponseEntity.ok(cinemaService.getShowById(showId));
	}
	
	
	@GetMapping("/getshowslist")
	public ResponseEntity<List<Show>> getShowsList(){
		List<Show> list = showRepo.findAll();
		return ResponseEntity.ok(list);
	}
	
	@GetMapping("/getshowsbyname")
	public ResponseEntity<List<Show>> getShowsByName(@RequestParam("name") String name){
		return ResponseEntity.ok(cinemaService.findShowByName(name));
	}
	
//	@GetMapping("/theatersbyname")
//	public Page<Theater> getTheatersByName(@RequestParam String name , Pageable pageable) {
//        return theaterRepo.findByTheaterName(name , pageable);
//    }
	
	@GetMapping("/theatersbycity")
	public Page<Theater> getTheatersByCity(@RequestParam String name , Pageable pageable) {
        return theaterRepo.findByCity(name , pageable);
    }
	
	@GetMapping("/userdetails")
    public String getUserDetails(Authentication authentication) {
        User principal = (User) authentication.getPrincipal();
        return principal.getRole().toString() ;
    }
	@GetMapping("/availableseat")
	public List<Integer> getAvailableSeats( @RequestParam("id") long id){
		return cinemaService.getAvailableSeats(id);
	}
	
}


