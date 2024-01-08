package com.hashstudioz.moviebooking.services.impl;

import java.time.LocalDate;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import com.hashstudioz.moviebooking.dto.CreateInvoiceRequest;
import com.hashstudioz.moviebooking.dto.CreateShowRequest;
import com.hashstudioz.moviebooking.dto.CreateTheaterRequest;
import com.hashstudioz.moviebooking.dto.SignUpRequest;
import com.hashstudioz.moviebooking.entities.Invoice;
import com.hashstudioz.moviebooking.entities.Show;
import com.hashstudioz.moviebooking.entities.ShowPhotos;
import com.hashstudioz.moviebooking.entities.Theater;
import com.hashstudioz.moviebooking.entities.Ticket;
import com.hashstudioz.moviebooking.entities.User;
import com.hashstudioz.moviebooking.repository.UserRepo;
import com.hashstudioz.moviebooking.repository.theater.InvoiceRepository;
import com.hashstudioz.moviebooking.repository.theater.ShowPhotosRepository;
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
	private ShowPhotosRepository showPhotosRepo;

	/*-----------------------------------User---------------------------------------*/

    public Page<User> getAllUsers(Pageable pageable) {
        return userRepo.findAll(pageable);
    }
	
	public User findUserByEmail(String email) {
		return userRepo.findByEmail(email).get();
	}
	
	public User updateUser(SignUpRequest signUpRequest) {
		User user = userRepo.findByEmail(signUpRequest.getEmail()).get();
		user.setStatus(signUpRequest.getStatus());
		user.setModifiedDate(LocalDate.now().toString());
		return user;
	}
	
	public String deleteUserByEmail(String email) {
		userRepo.deleteByEmail(email);
		return "User Deleted Sucessfully";
	}

	/*-------------------------------- Theater--------------------------------------*/

	public Theater createTheater(CreateTheaterRequest theaterRequest) {
		Theater theater = new Theater();
		theater.setTheaterName(theaterRequest.getTheaterName());
		theater.setCity(theaterRequest.getCity());
		return theaterRepo.save(theater);
	}

	public void deleteTheaterData(long theaterId) {
		invoiceRepo.deleteById(showRepo.findById(theaterId).get().getShowId());
		showRepo.deleteById(theaterId);
		theaterRepo.deleteById(theaterId);
	}


	/*---------------------------------Show------------------------------*/

	public Show createShow(CreateShowRequest showRequest) {
		Theater theater = theaterRepo.findById(showRequest.getTheater().getTheaterId()).orElseThrow(
				() -> new RuntimeException("Theater not found with ID: " + showRequest.getTheater().getTheaterId()));
		Show show = new Show();

		show.setUpcomingShows(showRequest.getUpcomingShows());
		show.setRunningTime(showRequest.getRunningTime());
		show.setTheater(theater);
		show.setScreenId(showRequest.getScreenId());
		show.setCapacity(showRequest.getCapacity());
		
		show.setPhotos(showRequest.getPhotos());
		
		for(ShowPhotos photoPath:show.getPhotos()) {
			ShowPhotos photo = new ShowPhotos();
            photo.setPhotoPath(photoPath.getPhotoPath());
            photo.setShow(show);
            showPhotosRepo.save(photo);
		}
		System.out.println(show);
		return showRepo.save(show);
	}
	
	public Page<Show> getShows(long theaterId, int screenId, Pageable pageable) {
        return showRepo.findByTheaterTheaterIdAndScreenId(theaterId, screenId, pageable);
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
	
	public void deleteData(long showId) {
		//invoiceRepo.deleteById(showId);
		//showRepo.deleteById(showId);
	}

/*-----------------------Invoice----------------------------*/

	@Transactional
	public Invoice createInvoice(CreateInvoiceRequest invoiceRequest) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Invoice invoice = new Invoice();
		Show show = showRepo.findById(invoiceRequest.getShow().getShowId()).get();
		System.out.println(show);
		invoice.setUserId(authentication.getName());
		invoice.setShow(show);
		invoice.setTicketClass(invoiceRequest.getTicketClass());
		invoice.setBooked_date(LocalDate.now());
		invoice.setBookingSeat(invoiceRequest.getBookingSeat());
		int totalTickets = invoiceRequest.getTotalTickets();
		CinemaService cinemaService = new CinemaService();
		Set<String> availableSeats = cinemaService.getAvailableSeats(show);
		List<Integer> bookingSeat = invoiceRequest.getBookingSeat();
		Set<Integer> bookedSeats = show.getBookedSeat();
		System.out.println(availableSeats);
		System.out.println(bookedSeats);
		for (Integer seatNumber : bookingSeat) {

			if (!bookedSeats.contains(seatNumber)) {
				bookedSeats.add(seatNumber);
			} else {
				throw new RuntimeException("Seat :" + seatNumber + " are not available");
			}
		}

		bookedSeats.addAll(bookingSeat);
		System.out.println(bookedSeats);

		show.setBookedSeat(bookedSeats);
		invoice.setTotalTickets(totalTickets);
		invoice.setTotalPrice(findPrice(invoiceRequest, totalTickets));
		Invoice invoice1 = invoiceRepo.save(invoice);
		System.out.println();
		return invoice1;

	}

	public List<Invoice> getAllInvoices() {
		return invoiceRepo.findAll();
	}

	public Page<Invoice> getAllInvoices(Pageable pageable) {
		return invoiceRepo.findAll(pageable);
	}

	public double findPrice(CreateInvoiceRequest invoiceRequest, int totalTickets) {
		double price = invoiceRequest.getTicketClass().getPrice();
		double totalPrice = price + price * 0.18;

		return totalPrice * totalTickets;
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

	public Set<String> getAvailableSeats(Show show) {
		return IntStream.rangeClosed(1, show.getCapacity())
	            .filter(seatNumber -> !show.getBookedSeat().contains(seatNumber))
	            .mapToObj(seatNumber -> "Seat" + seatNumber)
	            .collect(Collectors.toSet());
	}

	
	/*-------------------------------Screen-----------------------------*/

//	public Screen createScreen(CreateScreenRequest screenRequest) {
//		Screen screen = new Screen();
//		screen.setTheater(theaterRepo.findById(screenRequest.getTheater().getTheaterId()).get());
//		screen.setScreen(screenRequest.getScreen());
//		return screenRepo.save(screen);
//	}
	
}

