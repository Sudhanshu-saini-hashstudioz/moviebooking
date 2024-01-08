package com.hashstudioz.moviebooking.entities;

import java.util.List;

public class Ticket {
	private String upcomingShow;
	private String showTime;
	private Theater theater;
	private int screen;
	private List<Integer> seatNumbers;
	public Ticket() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Ticket(String upcomingShow, String showTime, Theater theater, int screen, List<Integer> seatNumbers) {
		super();
		this.upcomingShow = upcomingShow;
		this.showTime = showTime;
		this.theater = theater;
		this.screen = screen;
		this.seatNumbers = seatNumbers;
	}
	public String getUpcomingShow() {
		return upcomingShow;
	}
	public void setUpcomingShow(String upcomingShow) {
		this.upcomingShow = upcomingShow;
	}
	public String getShowTime() {
		return showTime;
	}
	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}
	public Theater getTheater() {
		return theater;
	}
	public void setTheater(Theater theater) {
		this.theater = theater;
	}
	public int getScreen() {
		return screen;
	}
	public void setScreen(int screen) {
		this.screen = screen;
	}
	public List<Integer> getSeatNumbers() {
		return seatNumbers;
	}
	public void setSeatNumbers(List<Integer> seatNumbers) {
		this.seatNumbers = seatNumbers;
	}
	@Override
	public String toString() {
		return "Ticket [upcomingShow=" + upcomingShow + ", showTime=" + showTime + ", theater=" + theater
				+ ", screen=" + screen + ", seatNumbers=" + seatNumbers + "]";
	}
	
}
