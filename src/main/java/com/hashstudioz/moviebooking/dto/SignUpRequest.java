package com.hashstudioz.moviebooking.dto;

import com.hashstudioz.moviebooking.entities.classenum.Role;
import com.hashstudioz.moviebooking.entities.classenum.Status;

import lombok.Data;

@Data
public class SignUpRequest {
	
	private String name;
	private String email;
	private String password;
	private Role role;
	private Status status;
	
	
	public SignUpRequest(String name, String email, String password , Role role , Status status) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.role = role;
		this.status = status;
	}
	public SignUpRequest() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "SignUpRequest [name=" + name + ", email=" + email + ", password=" + password + "]";
	}
}
