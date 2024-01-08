package com.hashstudioz.moviebooking.entities;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import com.hashstudioz.moviebooking.entities.classenum.TicketClass;

import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Version;

@Entity
@Table(name="invoice_table")
@EntityListeners(AuditingEntityListener.class)
public class Invoice implements Serializable  {
	
	/**
	 * 
	 */
	
	private static final long serialVersionUID = 2208223718753093154L;
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long invoiceId;
	@Version
	private long version;
	private String userId;
	
	@ManyToOne
    @JoinColumn(name = "show_id")
	private Show show; // containing object of theater and upcoming show details
    private int totalTickets;
    
   
	private double totalPrice; 
    private LocalDate booked_date;
    private TicketClass ticketClass;
    
    @ElementCollection
    private List<Integer> bookingSeat;
	public Invoice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Invoice(long invoiceId, String userId, Show show, int totalTickets, double totalPrice, LocalDate booked_date , TicketClass ticketClass , List<Integer> bookingSeat) {
		super();
		this.invoiceId = invoiceId;
		this.userId = userId;
		this.show = show;
		this.totalTickets = totalTickets;
		this.totalPrice = totalPrice;
		this.booked_date = booked_date;
		this.ticketClass = ticketClass;
		this.bookingSeat = bookingSeat;
	}
	public long getInvoiceId() {
		return invoiceId;
	}
	public void setInvoiceId(long invoiceId) {
		this.invoiceId = invoiceId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public LocalDate getBooked_date() {
		return booked_date;
	}
	public void setBooked_date(LocalDate booked_date) {
		this.booked_date = booked_date;
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
	
	
	public long getVersion() {
		return version;
	}
	public void setVersion(long version) {
		this.version = version;
	}
	@Override
	public String toString() {
		return "Invoice [invoiceId" + invoiceId + ", userId=" + userId + ", show=" + show + ", totalTickets="
				+ totalTickets + ", totalPrice=" + totalPrice + ", booked_date=" + booked_date + "]";
	}
}
