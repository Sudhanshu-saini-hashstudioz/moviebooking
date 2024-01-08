package com.hashstudioz.moviebooking.dto;

import java.util.List;

import com.hashstudioz.moviebooking.entities.Show;
import com.hashstudioz.moviebooking.entities.classenum.TicketClass;

public class CreateInvoiceRequest {

	private Show show; // containing object of theater and upcoming show details
    private int totalTickets; 
    private List<Integer> bookingSeat;
	private TicketClass ticketClass;
	public CreateInvoiceRequest() {
		super();
		
	}
	public CreateInvoiceRequest( Show show, int totalTickets , TicketClass ticketClass , List<Integer> bookingSeat) {
		super();
		this.show = show;
		this.totalTickets = totalTickets;
		this.ticketClass = ticketClass;
		this.bookingSeat = bookingSeat;
	}

	public Show getShow() {
		return show;
	}
	public void setShow(Show show) {
		this.show = show;
	}
	public int getTotalTickets() {
		return totalTickets;
	}
	public void setTotalTickets(int totalTickets) {
		this.totalTickets = totalTickets;
	}
	
	public TicketClass getTicketClass() {
		return ticketClass;
	}
	public void setTicketClass(TicketClass ticketClass) {
		this.ticketClass = ticketClass;
	}
	
	public List<Integer> getBookingSeat() {
		return bookingSeat;
	}
	public void setBookingSeat(List<Integer> bookingSeat) {
		this.bookingSeat = bookingSeat;
	}
	@Override
	public String toString() {
		return "CreateInvoiceRequest [show=" + show + ", totalTickets=" + totalTickets
				 + "]";
	} 

}
