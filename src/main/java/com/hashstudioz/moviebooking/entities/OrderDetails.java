package com.hashstudioz.moviebooking.entities;

import java.util.List;

import lombok.Data;

@Data
public class OrderDetails {
	
	private String id;
	private String payment_id;
	private String currency;
	private int amount;
	private String receipt;
	private String email;
	private List<String> seatNumber;

}
