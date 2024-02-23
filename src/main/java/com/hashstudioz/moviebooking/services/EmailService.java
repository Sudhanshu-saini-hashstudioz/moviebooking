package com.hashstudioz.moviebooking.services;

import com.hashstudioz.moviebooking.entities.EmailDetails;

public interface EmailService {
	
    String sendSimpleMail(String id);

    String sendMailWithAttachment(EmailDetails details);

	String sendEmail(long id);

}
