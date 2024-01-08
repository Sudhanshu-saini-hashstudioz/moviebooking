package com.hashstudioz.moviebooking.services;

import com.hashstudioz.moviebooking.dto.JwtAuthenticationResponse;
import com.hashstudioz.moviebooking.dto.RefreshTokenRequest;
import com.hashstudioz.moviebooking.dto.SignInRequest;
import com.hashstudioz.moviebooking.dto.SignUpRequest;
import com.hashstudioz.moviebooking.entities.User;

public interface AuthenticationService {
	User signUp(SignUpRequest signUpRequest);
	JwtAuthenticationResponse signIn(SignInRequest signInRequest);
	JwtAuthenticationResponse refreshToken(RefreshTokenRequest refreshTokenRequest);
}
