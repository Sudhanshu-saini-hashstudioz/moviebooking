package com.hashstudioz.moviebooking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
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

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthenticationController {
	
	@Autowired
	private TheaterRepository theaterRepo;
	@Autowired
	private ShowRepository showRepo;
	
	@Autowired
	private AuthenticationService authenticationService;

	@PostMapping("/signup")
	public ResponseEntity<User> signUp(@RequestBody SignUpRequest signUpRequest) {
		return ResponseEntity.ok(authenticationService.signUp(signUpRequest));
	}

	@PostMapping("/signin")
	public ResponseEntity<JwtAuthenticationResponse> signIn(@RequestBody SignInRequest signInrequest) {	
		return ResponseEntity.ok(authenticationService.signIn(signInrequest));

	}
	
	@PostMapping("/refresh")
	public ResponseEntity<JwtAuthenticationResponse> refresh(@RequestBody RefreshTokenRequest refreshTokenRequest) {	
		return ResponseEntity.ok(authenticationService.refreshToken(refreshTokenRequest));
	}
	
	@GetMapping("/theaters")
	public Page<Theater> getAllTheaters(Pageable pageable) {
        return theaterRepo.findAll(pageable);
    }
	
	@GetMapping("/upcomingshows") //error
	public Page<Show> upcomingShows(Pageable pageable){
		return showRepo.findAll(pageable);
	}
	
	@GetMapping("/upcomingshowsbyname") //error
	public Page<Show> upcomingShowsByName(@RequestParam String name , Pageable pageable){
		return showRepo.findByUpcomingShows(name , pageable);
	}
	
	@GetMapping("/theatersbyname")
	public Page<Theater> getTheatersByName(@RequestParam String name , Pageable pageable) {
        return theaterRepo.findByTheaterName(name , pageable);
    }
	
	@GetMapping("/theatersbycity")
	public Page<Theater> getTheatersByCity(@RequestParam String name , Pageable pageable) {
        return theaterRepo.findByCity(name , pageable);
    }
	
	
}


