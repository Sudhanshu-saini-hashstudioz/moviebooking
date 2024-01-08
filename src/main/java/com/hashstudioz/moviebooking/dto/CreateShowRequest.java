package com.hashstudioz.moviebooking.dto;

import java.util.HashSet;
import java.util.Set;

import com.hashstudioz.moviebooking.entities.ShowPhotos;
import com.hashstudioz.moviebooking.entities.Theater;

public class CreateShowRequest {
	
	private String upcomingShows;
	private String runningTime;
	private int screenId;
	private int capacity;
	private Theater theater;
	private Set<ShowPhotos> photos = new HashSet<>();
	public CreateShowRequest() {
		super();

	}
	public CreateShowRequest(String upcomingShows, String runningTime, int capacity, Theater theater, int screenId, Set<ShowPhotos> photos) {
		super();
		this.upcomingShows = upcomingShows;
		this.runningTime = runningTime;
		this.screenId = screenId;
		this.capacity = capacity;
		this.theater = theater;
		this.photos = photos;
	}
	public String getUpcomingShows() {
		return upcomingShows;
	}
	public void setUpcomingShows(String upcomingShows) {
		this.upcomingShows = upcomingShows;
	}
	public String getRunningTime() {
		return runningTime;
	}
	public void setRunningTime(String runningTime) {
		this.runningTime = runningTime;
	}
	
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public Theater getTheater() {
		return theater;
	}
	public void setTheater(Theater theater) {
		this.theater = theater;
	}
	
	public int getScreenId() {
		return screenId;
	}
	public void setScreenId(int screenId) {
		this.screenId = screenId;
	}
	
	public Set<ShowPhotos> getPhotos() {
		return photos;
	}
	public void setPhotos(Set<ShowPhotos> photos) {
		this.photos = photos;
	}
	@Override
	public String toString() {
		return "CreateShowRequest [upcomingShows=" + upcomingShows + ", runningTime=" + runningTime + ", screen="
				 + ", capacity=" + capacity + ", theaterId=" + theater + "]";
	}
}
