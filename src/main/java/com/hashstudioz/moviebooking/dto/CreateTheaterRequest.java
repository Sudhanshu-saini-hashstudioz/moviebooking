package com.hashstudioz.moviebooking.dto;

public class CreateTheaterRequest {
	
	private String theaterName;
    private String city;
	public CreateTheaterRequest() {
		super();
		
	}
	public CreateTheaterRequest(String theaterName, String city) {
		super();
		this.theaterName = theaterName;
		this.city = city;
	}
	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	@Override
	public String toString() {
		return "CreateTheaterRequest [tName=" + theaterName + ", city=" + city + "]";
	}
}
