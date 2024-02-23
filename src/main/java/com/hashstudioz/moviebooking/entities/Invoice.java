package com.hashstudioz.moviebooking.entities;

import java.io.Serializable;
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
import lombok.Data;

@Entity
@Table(name="invoice_table")
@EntityListeners(AuditingEntityListener.class)
@Data
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
	private Show show; 
    private int totalTickets;
    private String orderId;
    private String payment_id;
    private String payment_status;
	private double totalPrice; 
    private String booked_date;
    private TicketClass ticketClass;
    private boolean deleted = Boolean.FALSE;

    @ElementCollection
    private List<Integer> bookingSeat;
    
    @ElementCollection
    private List<String> seatNumber;
}
