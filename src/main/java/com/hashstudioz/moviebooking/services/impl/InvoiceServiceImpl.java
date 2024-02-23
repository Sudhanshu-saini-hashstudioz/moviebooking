package com.hashstudioz.moviebooking.services.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.hashstudioz.moviebooking.dto.CreateInvoiceRequest;
import com.hashstudioz.moviebooking.entities.Invoice;
import com.hashstudioz.moviebooking.entities.Show;
import com.hashstudioz.moviebooking.repository.theater.InvoiceRepository;
import com.hashstudioz.moviebooking.repository.theater.ShowRepository;
import com.razorpay.Order;
import com.razorpay.Payment;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import com.razorpay.Refund;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class InvoiceServiceImpl {

	@Autowired
	private InvoiceRepository invoiceRepo;
	@Autowired
	private ShowRepository showRepo;
	@Autowired
	private EmailServiceImpl emailService;

	@Transactional
	public Invoice createInvoice(CreateInvoiceRequest invoiceRequest, String orderId) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		Invoice invoice = new Invoice();

		Show show = showRepo.findById(invoiceRequest.getShow().getShowId()).get();

		invoice.setUserId(authentication.getName());
		invoice.setShow(show);
		invoice.setOrderId(orderId);

		invoice.setPayment_status("created");

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss a");
		LocalDateTime now = LocalDateTime.now();

		String dateTime = now.format(formatter);
		invoice.setSeatNumber(invoiceRequest.getSeatNumber());
		invoice.setBooked_date(dateTime);
		invoice.setBookingSeat(invoiceRequest.getBookingSeat());
		int totalTickets = invoiceRequest.getTotalTickets();

		invoice.setTotalTickets(totalTickets);
		invoice.setTotalPrice(invoiceRequest.getAmount());
		return invoiceRepo.save(invoice);

	}

	public void reFreshInvoice() throws RazorpayException {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Invoice invoice = invoiceRepo.findUserInvoicesWithoutUpdated(authentication.getName()).get(0);
		RazorpayClient razorpay = new RazorpayClient("rzp_test_2ZbY5hDyVZAQVh", "YQqoQaTvxi343PVCA3zVfKQ8");
		Order order = razorpay.Orders.fetch(invoice.getOrderId());
		
		if (order.get("status").equals("paid")) {
			
			if(!invoice.getPayment_status().equals("Canceled")) {
				invoice.setPayment_status(order.get("status"));
			}

			Show show = invoice.getShow();
			List<Integer> bookedSeats = show.getBookedSeat();
			bookedSeats.addAll(invoice.getBookingSeat());
			show.setBookedSeat(bookedSeats);
		}
	}

	public List<Invoice> getAllInvoicesByEmail(String email) throws RazorpayException {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		reFreshInvoice();
		List<Invoice> invoices = invoiceRepo.findUserInvoices(authentication.getName());
		return invoices;
	}

	public List<Invoice> getAllInvoices() {
		return invoiceRepo.findAllInvoices();
	}

//	public Page<Invoice> getAllInvoices(Pageable pageable) {
//		return invoiceRepo.findAll(pageable);
//	}

	public List<Invoice> getUserInvoices(String email) {
		return invoiceRepo.findUserInvoices(email);
	}

	public Invoice getInvoiceById(long invoiceId) {
		return invoiceRepo.findById(invoiceId).get();
	}

	
	public Invoice confirmPayment(long invoiceId) throws RazorpayException {
		Invoice myInvoice = invoiceRepo.findById(invoiceId).get();
		Show show = showRepo.findById(myInvoice.getShow().getShowId()).get();

		List<Integer> bookedSeats = show.getBookedSeat();
		bookedSeats.addAll(myInvoice.getBookingSeat());
		
		emailService.sendEmail(invoiceId);

		show.setBookedSeat(bookedSeats);
		RazorpayClient razorpay = new RazorpayClient("rzp_test_2ZbY5hDyVZAQVh", "YQqoQaTvxi343PVCA3zVfKQ8");
		Order order = razorpay.Orders.fetch(myInvoice.getOrderId());
		myInvoice.setPayment_status(order.get("status"));
		return myInvoice;
	}

	
	public List<Invoice> repaymentFailed(long invoiceId) {
		Invoice invoice = invoiceRepo.findById(invoiceId).get();
		invoice.setPayment_status("failed");
		return invoiceRepo.findAll();
	}

	public Refund cancelPayment(long invoiceId) throws RazorpayException {
		
		RazorpayClient razorpay = new RazorpayClient("rzp_test_2ZbY5hDyVZAQVh", "YQqoQaTvxi343PVCA3zVfKQ8");
		
		Invoice invoice = invoiceRepo.findById(invoiceId).get();
		
		Order order = razorpay.Orders.fetch(invoice.getOrderId());
		Show show = invoice.getShow();
		show.getBookedSeat().removeAll(invoice.getBookingSeat());
		show.getPendingSeats().removeAll(invoice.getBookingSeat()); 
		invoice.setPayment_status("Canceled");	
		List<Payment> payments = razorpay.Orders.fetchPayments(invoice.getOrderId());
		
		System.out.println(payments);
		
		for(Payment payment : payments) {
			if(payment.get("status").equals("captured")) {
				
				int amount = payment.get("amount");
				String receipt = order.get("receipt");
				String paymentId = payment.get("id");
				JSONObject refundRequest = new JSONObject();
				refundRequest.put("amount",amount);
				refundRequest.put("speed","normal");
				JSONObject notes = new JSONObject();
				notes.put("notes_key_1","Tea, Earl Grey, Hot");
				notes.put("notes_key_2","Tea, Earl Grey… decaf.");
				refundRequest.put("notes",notes);
//				refundRequest.put("receipt",receipt);           
				Refund refund = razorpay.Payments.refund(paymentId,refundRequest);
				return refund;
			}
		}
		
		return null;
	}

}
