package com.hashstudioz.moviebooking.services.impl;

import java.security.Key;
import java.util.Date;
import java.util.Map;
import java.util.function.Function;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.hashstudioz.moviebooking.services.JwtService;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;


@Service
public class JwtServiceImpl  implements JwtService{
	
	@Value("${test.property.name}")
	private String name;
	 private String secret = "afafafafafafaafafsfsfafsfsfafsfsasfasafsafsSHDHJSJJDHFHSJSSKDKNVNVHFHFDHSJDJSJJDJCNSJJNFNXLKMKDFNJNXNVFVEVNJFNVHERNJHFNDJSJKccaddaasddfffssdsdjsvjvfjjfvdfj";
	
	public String generateToken(UserDetails userDetails) {
		return Jwts.builder().setSubject(userDetails.getUsername())
				.setIssuedAt(new Date(System.currentTimeMillis()))
				.setExpiration(new Date(System.currentTimeMillis()*1000*60*24))
				.signWith(getSignInKey() , SignatureAlgorithm.HS256).compact();
	}
	
	public String extractUserName(String token) {
		return extractClaim(token , Claims::getSubject);
	}

	private <T> T extractClaim(String token , Function<Claims , T> claimsResolver) {
		final Claims claims = extractAllClaims(token);
		return claimsResolver.apply(claims);
	}

	private Key getSignInKey() {
		byte[] key = Decoders.BASE64.decode(secret);
		return Keys.hmacShaKeyFor(key);
	}
	
	private Claims extractAllClaims(String token) {
		return Jwts.parserBuilder().setSigningKey(getSignInKey()).build().parseClaimsJws(token).getBody();
	}
	
	
	public boolean isTokenValid(String token, UserDetails userDetails) {
        final String username = extractUserName(token);
        return (username.equals(userDetails.getUsername()) && !isTokenExpired(token));
    }

	private boolean isTokenExpired(String token) {
		return extractClaim(token , Claims::getExpiration).before(new Date());
	}

	@Override
	public String generateRefreshToken(Map<String , Object> extraClaims, UserDetails userDetails) {
		return Jwts.builder().setClaims(extraClaims).setSubject(userDetails.getUsername())
				.setIssuedAt(new Date(System.currentTimeMillis()))
				.setExpiration(new Date(System.currentTimeMillis()*1000*60*60))
				.signWith(getSignInKey() , SignatureAlgorithm.HS256).compact();
	}

}
