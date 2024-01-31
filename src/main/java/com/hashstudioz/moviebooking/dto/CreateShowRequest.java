package com.hashstudioz.moviebooking.dto;

import java.util.Date;

import com.hashstudioz.moviebooking.entities.Theater;
import lombok.Data;

@Data
public class CreateShowRequest {
	
	private String upcomingShows;
	private String runningTime;
	private int screenId;
	private int capacity;
	private Theater theater;
	private double rating;
	private String genre;
	private String language;
	private String description;
	private String cast;
	
	
}
