package com.hashstudioz.moviebooking.controllers.restcontroller;

import java.util.List;
import com.razorpay.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.hashstudioz.moviebooking.dto.CreateInvoiceRequest;
import com.hashstudioz.moviebooking.entities.EmailDetails;
import com.hashstudioz.moviebooking.entities.Invoice;
import com.hashstudioz.moviebooking.entities.OrderDetails;
import com.hashstudioz.moviebooking.entities.User;
import com.hashstudioz.moviebooking.services.EmailService;
import com.hashstudioz.moviebooking.services.PaymentService;
import com.hashstudioz.moviebooking.services.impl.CinemaService;
import com.hashstudioz.moviebooking.services.impl.InvoiceServiceImpl;

@RestController
@RequestMapping("/api/v1/user")

public class UserRestController {
	
	@Autowired
	private EmailService emailService;

	@Autowired
	private CinemaService cinemaService;

	@Autowired
	private PaymentService paymentService;

	@Autowired
	InvoiceServiceImpl invoiceService;

	@GetMapping
	public ResponseEntity<String> sayHello() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		return ResponseEntity.ok(authentication.getName());
	}

	@GetMapping("/getallinvoices")
	public ResponseEntity<List<Invoice>> getAllInvoices(@RequestParam("email") String email) throws RazorpayException {
		return ResponseEntity.ok(invoiceService.getAllInvoicesByEmail(email));
	}

	@GetMapping("/getinvoicebyid")
	public ResponseEntity<Invoice> getInvoiceById(@RequestParam("invoiceId") long invoiceId) {
		return ResponseEntity.ok(invoiceService.getInvoiceById(invoiceId));
	}
	
//===============payment controller=============================================================================================================================================================================

	@PostMapping("/getOrderDetails")
	public ResponseEntity<OrderDetails> getOrderDetails(@RequestBody CreateInvoiceRequest invoiceRequest,
			Authentication auth) throws RazorpayException, JsonMappingException, JsonProcessingException {
		User user = (User) auth.getPrincipal();
		return ResponseEntity.ok(paymentService.getOrderDetails(invoiceRequest, user));
	}

	@PostMapping("/getInvoice")
	public ResponseEntity<?> getTicket(@RequestBody CreateInvoiceRequest invoiceRequest,
			@RequestParam("orderId") String orderId) {
		return ResponseEntity.ok(invoiceService.createInvoice(invoiceRequest, orderId).getInvoiceId());
	}

	@PostMapping("/confirm-payment")
	public ResponseEntity<Invoice> confirmPayment(@RequestParam("invoiceId") long invoiceId) throws RazorpayException {
		return ResponseEntity.ok(invoiceService.confirmPayment(invoiceId));
	}

	@GetMapping("/repayment")
	public ResponseEntity<String> rePayment(@RequestParam("invoiceId") long invoiceId) throws RazorpayException {
		String status = paymentService.rePayment(invoiceId);
		return ResponseEntity.ok(status);
	}

	@GetMapping("/repaymentfailed")
	public ResponseEntity<List<Invoice>> failedRepayment(@RequestParam("id") long invoiceId) {
		return ResponseEntity.ok(invoiceService.repaymentFailed(invoiceId));
	}
	
	
	//for failed 
	@PutMapping("/paymentfailed")
	public String paymentFailed(@RequestParam("id") long invoiceId) {
		paymentService.updatePaymentStatus(invoiceId);
		return "Updated";
	}
	
	
//=============Email controllers======================================================================================================================


	// Sending a simple Email
	@PostMapping("/sendMail")
	public String sendMail(@RequestParam("id") String id) {
		String status = emailService.sendSimpleMail(id);
		return status;
	}

	// Sending email with attachment
	@PostMapping("/sendMailWithAttachment")
	public String sendMailWithAttachment(@RequestBody EmailDetails details) {
		String status = emailService.sendMailWithAttachment(details);
		return status;
	}
	
	
	@PostMapping("/sendemail")
	public String downloadTicket(@RequestParam("id") long id) {
		String status = emailService.sendEmail(id);
		return status;
	}
	
	
/*======================= Ticket Cancel =======================*/
	
	@PostMapping("/cancelTicket")
	public String cancelTicket(@RequestParam("id") long invoiceId) throws RazorpayException {
		return invoiceService.cancelPayment(invoiceId).get("id");
	}
}

