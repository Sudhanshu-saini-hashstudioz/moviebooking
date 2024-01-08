package com.hashstudioz.moviebooking.dto;

public class Request {
private int screenId;
private long theaterId;
public Request() {
	super();
	// TODO Auto-generated constructor stub
}
public Request(int screenId, long theaterId) {
	super();
	this.screenId = screenId;
	this.theaterId = theaterId;
}
public int getScreenId() {
	return screenId;
}
public void setScreenId(int screenId) {
	this.screenId = screenId;
}
public long getTheaterId() {
	return theaterId;
}
public void setTheaterId(long theaterId) {
	this.theaterId = theaterId;
}

}
