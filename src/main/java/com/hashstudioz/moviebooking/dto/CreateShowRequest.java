package com.hashstudioz.moviebooking.dto;

import com.hashstudioz.moviebooking.entities.Theatre;
import lombok.Data;

@Data
public class CreateShowRequest {
	
	private String upcomingShows;
	private String runningTime;
	private int screenId;
	private int capacity;
	private Theatre theatre;
	private double rating;
	private String genre;
	private String language;
	private String description;
	private String cast;
	
	
}
