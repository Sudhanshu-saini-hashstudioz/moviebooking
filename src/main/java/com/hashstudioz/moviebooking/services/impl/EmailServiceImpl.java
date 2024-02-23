package com.hashstudioz.moviebooking.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.io.File;
import com.hashstudioz.moviebooking.entities.EmailDetails;
import com.hashstudioz.moviebooking.services.EmailService;

import jakarta.activation.DataHandler;
import jakarta.activation.DataSource;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;
import jakarta.mail.util.ByteArrayDataSource;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private JavaMailSender javaMailSender;
	@Autowired
	private CinemaService cinemaService;

	@Value("${username}")
	private String sender;

	@Override
	public String sendSimpleMail(String id) {
//		Authentication  auth = SecurityContextHolder.getContext().getAuthentication();
		try {

			// Creating a simple mail message
			SimpleMailMessage mailMessage = new SimpleMailMessage();

			// Setting up necessary details
			mailMessage.setFrom(sender);
			mailMessage.setTo("sudhanshu@yopmail.com");
			mailMessage.setText("Here is reference for your refund request with Refund id :" + id +" .\n\n Thank you ");
			mailMessage.setSubject("Refund Initiated");

			// Sending the mail
			javaMailSender.send(mailMessage);
			return "Mail Sent Successfully...";
		} catch (Exception e) {
			e.printStackTrace();
			return "Error while Sending Mail";
		}
	}

	@Override
	
	public String sendMailWithAttachment(EmailDetails details) {
		
		// Creating a mime message
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper;

		try {

			// Setting multipart as true for attachments to be send
			mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
			mimeMessageHelper.setFrom(sender);
			mimeMessageHelper.setTo(details.getRecipient());
			mimeMessageHelper.setText(details.getMsgBody());
			mimeMessageHelper.setSubject(details.getSubject());

			// Adding the attachment
			FileSystemResource file = new FileSystemResource(new File(details.getAttachment()));
			mimeMessageHelper.addAttachment(file.getFilename(), file);

			// Sending the mail
			javaMailSender.send(mimeMessage);
			return "Mail sent Successfully";
			
		}catch (MessagingException e) {
			return "Error while sending mail!!!";
		}
	}

	
	
	
	
	@Override
	public String sendEmail(long id) {
		 byte[] bytes = cinemaService.downloadTicket(id);
		    
		    MimeMessage mimeMessage = javaMailSender.createMimeMessage();
			MimeMessageHelper mimeMessageHelper;

			try {

				mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
				mimeMessageHelper.setFrom(sender);
				mimeMessageHelper.setTo("sudhanshu@yopmail.com");
				mimeMessageHelper.setText("Download Your Ticket.");
				mimeMessageHelper.setSubject("Ticket");
				
				DataSource dataSource = new ByteArrayDataSource(bytes ,"application/pdf");
				MimeBodyPart pdfBodyPart = new MimeBodyPart();
		        pdfBodyPart.setDataHandler(new DataHandler(dataSource));
		        pdfBodyPart.setFileName("ticket.pdf");
				
				MimeMultipart mimeMultipart = new MimeMultipart();
		        mimeMultipart.addBodyPart(pdfBodyPart);
				
				 mimeMessage.setContent(mimeMultipart);
				 
				javaMailSender.send(mimeMessage);
				return "Mail sent Successfully";
				
			}catch (MessagingException e) {
				return "Error while sending mail!!!";
			}
	}

}
