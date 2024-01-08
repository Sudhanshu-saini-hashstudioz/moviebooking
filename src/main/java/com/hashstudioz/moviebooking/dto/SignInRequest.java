package com.hashstudioz.moviebooking.dto;

import com.hashstudioz.moviebooking.entities.classenum.Status;

import lombok.Data;

@Data
public class SignInRequest {
	
	private String email;
	private String password;
	private Status status;
	public SignInRequest(String email, String password , Status status) {
		super();
		this.email = email;
		this.password = password;
		this.status = status;
	}
	public SignInRequest() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "SignInRequest [email=" + email + ", password=" + password + "]";
	}
	
	

}
