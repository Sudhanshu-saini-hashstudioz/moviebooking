package com.hashstudioz.moviebooking.services.impl;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hashstudioz.moviebooking.dto.CreateInvoiceRequest;
import com.hashstudioz.moviebooking.dto.CreateShowRequest;
import com.hashstudioz.moviebooking.dto.CreateTheaterRequest;
import com.hashstudioz.moviebooking.entities.FileEntity;
import com.hashstudioz.moviebooking.entities.Invoice;
import com.hashstudioz.moviebooking.entities.Show;
import com.hashstudioz.moviebooking.entities.Theater;
import com.hashstudioz.moviebooking.entities.Ticket;
import com.hashstudioz.moviebooking.entities.User;
import com.hashstudioz.moviebooking.entities.classenum.Status;
import com.hashstudioz.moviebooking.repository.UserRepo;
import com.hashstudioz.moviebooking.repository.theater.InvoiceRepository;
import com.hashstudioz.moviebooking.repository.theater.ShowRepository;
import com.hashstudioz.moviebooking.repository.theater.TheaterRepository;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class CinemaService {

	@Autowired
	private TheaterRepository theaterRepo;
	@Autowired
	private ShowRepository showRepo;
	@Autowired
	private UserRepo userRepo;
	@Autowired
	private InvoiceRepository invoiceRepo;
	@Autowired
	private ObjectMapper mapper;


	/*-----------------------------------User---------------------------------------*/

	public Page<User> getAllUsers(Pageable pageable) {
		return userRepo.findAll(pageable);
	}

	public User findUserByEmail(String email) {
		return userRepo.findByEmail(email).get();
	}

	public User updateUser( int id , String status) {
		User user = userRepo.findById(id).get();
		user.setStatus(Status.valueOf(status));
		user.setModifiedDate(LocalDate.now().toString());
		return user;
	}

	public String deleteUserByEmail(String email) {
		userRepo.deleteByEmail(email);
		return "User Deleted Sucessfully";
	}

	// remove it no use
	public List<User> getAllUsers() {
		return userRepo.findAll();
	}
	
	public List<User> getUserByName(String name) {
		return userRepo.findByNameLike(name);
	}

	/*-------------------------------- Theater--------------------------------------*/

	public Theater createTheater(CreateTheaterRequest theaterRequest) {
		Theater theater = new Theater();
		theater.setTheaterName(theaterRequest.getTheaterName());
		theater.setCity(theaterRequest.getCity());
		return theaterRepo.save(theater);
	}

	public String deleteTheaterData(long theaterId) {
		//invoiceRepo.deleteById(showRepo.findById(theaterId).get().getShowId());
		showRepo.deleteByTheaterTheaterId(theaterId);
		theaterRepo.deleteById(theaterId);
		return "Theater Data Deleted !!";
	}

	public List<Theater> getAllTheater() {
		return theaterRepo.findAll();
	}

	public List<Theater> getTheaterByTheaterName(String theaterName) {
		return theaterRepo.findByTheaterName(theaterName);
	}

	/*---------------------------------Show------------------------------*/

	public Show createShow(CreateShowRequest showRequest , List<MultipartFile> files) throws IllegalStateException, IOException, ParseException {

		Theater theater = theaterRepo.findById(showRequest.getTheater().getTheaterId()).orElseThrow(
				() -> new RuntimeException("Theater not found with ID: " + showRequest.getTheater().getTheaterId()));
		Show show = new Show();
		show.setUpcomingShows(showRequest.getUpcomingShows());
		show.setRunningTime(getTime(showRequest.getRunningTime()).toLocaleString());
		show.setTheater(theater);
		show.setScreenId(showRequest.getScreenId());
		show.setCapacity(showRequest.getCapacity());
		show.setDescription(showRequest.getDescription());
		show.setGenre(showRequest.getGenre());
		show.setRating(showRequest.getRating());
		show.setLanguage(showRequest.getLanguage());
		show.setCast(showRequest.getCast());
		
		for (MultipartFile file : files) {
	        String filename = file.getOriginalFilename();
	        byte[] data = file.getBytes();
	        FileEntity fileEntity = new FileEntity();
	        fileEntity.setFilename(filename);
	        fileEntity.setImagedata(data);
	        fileEntity.setShow(show);
	        show.getFiles().add(fileEntity);
	    }

		return showRepo.save(show);
	}

	public List<Show> getShows(long theaterId, int screenId) {
		return showRepo.findByTheaterTheaterIdAndScreenId(theaterId, screenId);
	}

	public Show updateShow(Show showRequest) {

		Show show = showRepo.findById(showRequest.getShowId()).get();
		show.setUpcomingShows(showRequest.getUpcomingShows());
		show.setTheater(showRequest.getTheater());
		show.setRunningTime(showRequest.getRunningTime());
		show.setScreenId(showRequest.getScreenId());
		show.setBookedSeat(null);
		return show;
	}
	
	public Show getShowById(long showId) {
		return showRepo.findById(showId).get();
	}
	
	public List<Show> findShowByName(String name) {
		// TODO Auto-generated method stub
		return showRepo.findByShowByNameLike(name);
	}

	public void deleteData(long showId) {

	}

	/*-----------------------Invoice----------------------------*/

	@Transactional
	public Invoice createInvoice(CreateInvoiceRequest invoiceRequest) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Invoice invoice = new Invoice();
		Show show = showRepo.findById(invoiceRequest.getShow().getShowId()).get();
		invoice.setUserId(authentication.getName());
		invoice.setShow(show);
		invoice.setBooked_date(LocalDate.now());
		invoice.setBookingSeat(invoiceRequest.getBookingSeat());
		int totalTickets = invoiceRequest.getTotalTickets();
	
		List<Integer> bookingSeat = invoiceRequest.getBookingSeat();
		List<Integer> bookedSeats = show.getBookedSeat();
		
		for (Integer seatNumber : bookingSeat) {

			if (!bookedSeats.contains(seatNumber)) {
				bookedSeats.add(seatNumber);
			} else {
				throw new RuntimeException("Seat :" + seatNumber + " are not available");
			}
		}
		bookedSeats.addAll(bookingSeat);
		show.setBookedSeat(bookedSeats);
		invoice.setTotalTickets(totalTickets);
		invoice.setTotalPrice(invoiceRequest.getAmount());

		return invoiceRepo.save(invoice);

	}
	
	public List<Invoice> getAllInvoicesByEmail(String email) {
		return invoiceRepo.findByUserId(email);
	}

	public List<Invoice> getAllInvoices() {
		return invoiceRepo.findAll();
	}

	public Page<Invoice> getAllInvoices(Pageable pageable) {
		return invoiceRepo.findAll(pageable);
	}

	/*----------------------------Final Ticket--------------------------*/

	public Ticket getFinalTicket(long invoiceId) {
		Invoice invoice = invoiceRepo.findById(invoiceId).get();
		Show show = showRepo.findById(invoice.getShow().getShowId()).get();
		Ticket finalTicket = new Ticket();
		finalTicket.setTheater(theaterRepo.findById(show.getTheater().getTheaterId()).get());
		finalTicket.setUpcomingShow(show.getUpcomingShows());
		finalTicket.setShowTime(show.getRunningTime());
		finalTicket.setScreen(show.getScreenId());
		finalTicket.setSeatNumbers(invoice.getBookingSeat());
		return finalTicket;
	}

	public List<Integer> getAvailableSeats(long id) {
		Show show = showRepo.findById(id).get();
		List<Integer> availableSeats = new ArrayList<>();
		List<Integer> bookedSeat = show.getBookedSeat();
		for(int i =1 ; i<=show.getCapacity();i++) {
			if(!bookedSeat.contains(i)) {
				availableSeats.add(i);
			}
		}
		return availableSeats;
	}

	public Object deleteTheaterById(long id) {
		
		return null;
	}
	
	
	public Date getTime(String inputDate) throws ParseException {
		SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm");
        Date parsedDate = inputFormat.parse(inputDate);
		return parsedDate;
	}

}
