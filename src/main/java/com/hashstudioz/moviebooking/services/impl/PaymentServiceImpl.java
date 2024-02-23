package com.hashstudioz.moviebooking.services.impl;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hashstudioz.moviebooking.dto.CreateInvoiceRequest;
import com.hashstudioz.moviebooking.entities.Invoice;
import com.hashstudioz.moviebooking.entities.OrderDetails;
import com.hashstudioz.moviebooking.entities.Show;
import com.hashstudioz.moviebooking.entities.User;
import com.hashstudioz.moviebooking.repository.theater.InvoiceRepository;
import com.hashstudioz.moviebooking.repository.theater.ShowRepository;
import com.hashstudioz.moviebooking.services.PaymentService;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private ObjectMapper mapper;
	@Autowired
	private InvoiceRepository invoiceRepo;
	
	@Autowired
	private ShowRepository showRepo;
	
	@Autowired 
	private InvoiceServiceImpl invoiceService;
	
	

	@Override
	public OrderDetails getOrderDetails(CreateInvoiceRequest invoiceRequest, User user)
			throws RazorpayException, JsonMappingException, JsonProcessingException {
		Show show = showRepo.findById(invoiceRequest.getShow().getShowId()).get();
		
		List<Integer> bookingSeat = invoiceRequest.getBookingSeat();
		List<Integer> bookedSeats = show.getBookedSeat();
		List<Integer> pendingSeats = show.getPendingSeats();
		for (Integer seatNumber : bookingSeat) {

			if (bookedSeats.contains(seatNumber) || pendingSeats.contains(seatNumber)) {
				
				throw new RuntimeException("Seat :" + seatNumber + " are not available");
				
			} else {
				pendingSeats.add(seatNumber);
			}
		}
		show.setPendingSeats(pendingSeats);
		
		int price = (int) invoiceRequest.getAmount();
		RazorpayClient razorpayClient = new RazorpayClient("rzp_test_2ZbY5hDyVZAQVh", "YQqoQaTvxi343PVCA3zVfKQ8");

		JSONObject options = new JSONObject();
		options.put("amount", price * 100);
		options.put("currency", "INR");
		options.put("receipt", "txn_123456");

		JSONObject order = razorpayClient.Orders.create(options).toJson();

		OrderDetails response = this.mapper.readValue(order.toString(), OrderDetails.class);
		response.setEmail(user.getEmail());
		response.setSeatNumber(invoiceRequest.getSeatNumber());
		
		return response;
	}

	@Override
	public String rePayment(long invoiceId) throws RazorpayException {

		Invoice invoice = invoiceRepo.findById(invoiceId).get();
		String orderId = invoice.getOrderId();
		
		RazorpayClient razorpay = new RazorpayClient("rzp_test_2ZbY5hDyVZAQVh", "YQqoQaTvxi343PVCA3zVfKQ8");
		Order order = razorpay.Orders.fetch(orderId);
		String status =order.get("status");
		
		if(status.equals("paid")) {
			invoiceService.confirmPayment(invoiceId);	
		}
		
		return status;
	}

	@Override
	public void updatePaymentStatus(long invoiceId) {
		invoiceRepo.findById(invoiceId).get().setPayment_status("failed");	
	}
}
