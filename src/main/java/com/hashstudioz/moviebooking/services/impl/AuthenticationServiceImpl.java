package com.hashstudioz.moviebooking.services.impl;

import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.hashstudioz.moviebooking.dto.JwtAuthenticationResponse;
import com.hashstudioz.moviebooking.dto.RefreshTokenRequest;
import com.hashstudioz.moviebooking.dto.SignInRequest;
import com.hashstudioz.moviebooking.dto.SignUpRequest;
import com.hashstudioz.moviebooking.entities.User;
import com.hashstudioz.moviebooking.entities.classenum.Role;
import com.hashstudioz.moviebooking.entities.classenum.Status;
import com.hashstudioz.moviebooking.repository.UserRepo;
import com.hashstudioz.moviebooking.services.AuthenticationService;
import com.hashstudioz.moviebooking.services.JwtService;

@Service
public class AuthenticationServiceImpl implements AuthenticationService {

	@Autowired
	private UserRepo userRepo;
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private JwtService jwtService;

	@Autowired
	private AuthenticationManager authenticationManager;

	public User signUp(SignUpRequest signUpRequest) {
		
		if (!isPresent(signUpRequest.getEmail())) {
			User user = new User();
			user.setName(signUpRequest.getName());
			user.setEmail(signUpRequest.getEmail());
			user.setRole(Role.USER);
			user.setPassword(passwordEncoder.encode(signUpRequest.getPassword()));
			user.setCreatedDate(java.time.LocalDate.now().toString());
			user.setStatus(Status.ACTIVE);
			return userRepo.save(user);
			
		}
		
		User user = userRepo.findByEmail(signUpRequest.getEmail()).get();
		user.setModifiedDate(java.time.LocalDate.now().toString());
		return user;
	}

	
	@Override
	public JwtAuthenticationResponse signIn(SignInRequest signInRequest) {
		
		User user = userRepo.findByEmail(signInRequest.getEmail())
				.orElseThrow(() -> new IllegalArgumentException("Invalid Email or Password !!"));
		
			authenticationManager.authenticate(
					new UsernamePasswordAuthenticationToken(signInRequest.getEmail(), signInRequest.getPassword()));

			   JwtAuthenticationResponse jwtAuthenticationResponse = new JwtAuthenticationResponse();
				
			   if(Status.ACTIVE.equals(user.getStatus())) {
					var jwt = jwtService.generateToken(user);
					var refreshToken = jwtService.generateRefreshToken(new HashMap<>(), user);
					System.out.println(jwt);
					jwtAuthenticationResponse.setToken(jwt);
					jwtAuthenticationResponse.setRefreshToken(refreshToken);
					return jwtAuthenticationResponse;	
					
				}
				return null;
	}

	@Override
	public JwtAuthenticationResponse refreshToken(RefreshTokenRequest refreshTokenRequest) {
		String userEmail = jwtService.extractUserName(refreshTokenRequest.getToken());
		User user = userRepo.findByEmail(userEmail).orElseThrow(null);
		if (jwtService.isTokenValid(refreshTokenRequest.getToken(), user));
		{
			var jwt = jwtService.generateToken(user);

			JwtAuthenticationResponse jwtAuthenticationResponse = new JwtAuthenticationResponse();
			jwtAuthenticationResponse.setToken(jwt);
			jwtAuthenticationResponse.setRefreshToken(refreshTokenRequest.getToken());
			return jwtAuthenticationResponse;
		}
	}
	
	// --check if user is Already present or not -----------------------------
	public boolean isPresent(String email) {
		return userRepo.findByEmail(email).isPresent();
	}

}
