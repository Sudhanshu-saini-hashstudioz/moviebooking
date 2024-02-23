package com.hashstudioz.moviebooking.entities;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Ticket {
	private String upcomingShow;
	private String showTime;
	private Theatre theatre;
	private int screen;
	private List<Integer> seatNumbers;
	
}
