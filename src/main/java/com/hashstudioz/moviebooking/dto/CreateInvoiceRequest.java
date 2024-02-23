package com.hashstudioz.moviebooking.dto;

import java.util.List;

import com.hashstudioz.moviebooking.entities.Show;
import lombok.Data;

@Data
public class CreateInvoiceRequest {

	private Show show; // containing object of theater and upcoming show details
    private int totalTickets; 
    private List<Integer> bookingSeat;
    private List<Integer> pendingSeats;
    private double amount;
    private List<String> seatNumber;
}
