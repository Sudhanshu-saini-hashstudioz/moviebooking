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
	private Show show; // containing object of theater and upcoming show details
    private int totalTickets;
    
   
	private double totalPrice; 
    private LocalDate booked_date;
    private TicketClass ticketClass;
    
    @ElementCollection
    private List<Integer> bookingSeat;
}
