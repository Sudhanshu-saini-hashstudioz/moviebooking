package com.hashstudioz.moviebooking.services;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.hashstudioz.moviebooking.dto.CreateInvoiceRequest;
import com.hashstudioz.moviebooking.entities.OrderDetails;
import com.hashstudioz.moviebooking.entities.User;
import com.razorpay.RazorpayException;

public interface PaymentService {
	
	OrderDetails getOrderDetails(CreateInvoiceRequest invoiceRequest , User user) throws RazorpayException, JsonMappingException, JsonProcessingException;

	String rePayment(long invoiceId) throws RazorpayException;

	void updatePaymentStatus(long invoiceId);
}
