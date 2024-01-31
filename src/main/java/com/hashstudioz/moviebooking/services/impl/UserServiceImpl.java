package com.hashstudioz.moviebooking.services.impl;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.hashstudioz.moviebooking.repository.UserRepo;
import com.hashstudioz.moviebooking.services.UserService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
	
	private final UserRepo userRepo;	
	
	public UserDetailsService userDetailsService() {
		return new UserDetailsService() {
			@Override
			public UserDetails loadUserByUsername(String email){
				return userRepo.findByEmail(email)
						.orElseThrow(()-> new UsernameNotFoundException("User Not Found"));
			}	
		};
	}
}
