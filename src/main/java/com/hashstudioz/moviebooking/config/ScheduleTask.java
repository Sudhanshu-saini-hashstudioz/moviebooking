package com.hashstudioz.moviebooking.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.hashstudioz.moviebooking.services.impl.SeatServiceImpl;
import com.razorpay.RazorpayException;

@Component
public class ScheduleTask {
	
	@Autowired private SeatServiceImpl  seatService;
	@Scheduled(fixedRate =5 * 60 *1000)
	public void refreshPage() throws RazorpayException {
		seatService.reFreshData();
	}
	
//	@Scheduled(fixedDelay =20 *1000)
//	public void sendEmail(long id) throws RazorpayException {
//		
//	}
}
