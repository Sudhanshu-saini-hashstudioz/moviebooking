package com.hashstudioz.moviebooking.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.hashstudioz.moviebooking.entities.classenum.Role;
import com.hashstudioz.moviebooking.services.UserService;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
//@EnableWebMvc
@RequiredArgsConstructor
@OpenAPIDefinition
public class SecurityConfig {
	
	public static final String[] PUBLIC_URLS = {
			"/v3/api-docs/**", "/v2/api-docs/**",
			"/swagger-resources/**",
			"/swagger-ui/**",
			"/webjars/**"
	};
	
	@Autowired
	private JwtAuthenticationFilter jwtAuthenticationFilter;
	
	@Autowired
	private  UserService userService;

    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http
		.authorizeHttpRequests(request -> request
				.requestMatchers("/api/v1/auth/**").permitAll()
				.requestMatchers(PUBLIC_URLS).permitAll()
				.requestMatchers("/api/v1/admin/**").hasAnyAuthority(Role.ADMIN.name())
				.requestMatchers("/api/v1/user/**").hasAnyAuthority(Role.USER.name())
				.anyRequest().authenticated())
		.sessionManagement(manager -> manager.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
		.authenticationProvider(authenticationProvider()).addFilterBefore(
				jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class
				);
	
		return http.build();
	}

    @Bean
    AuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
		authenticationProvider.setUserDetailsService(userService.userDetailsService());
		authenticationProvider.setPasswordEncoder(passwordEncoder());
		return authenticationProvider;
		
	}

    @Bean
    PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

    @Bean
    AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
		return config.getAuthenticationManager();
		
	}
	
}
