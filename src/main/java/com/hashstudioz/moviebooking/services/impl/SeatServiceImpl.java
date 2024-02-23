package com.hashstudioz.moviebooking.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hashstudioz.moviebooking.entities.Show;
import com.hashstudioz.moviebooking.repository.theater.ShowRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class SeatServiceImpl {
	
	@Autowired private ShowRepository showRepo;

	public void reFreshData() {
		List<Show> shows = showRepo.findAll();
		for(Show show : shows) {
			show.getPendingSeats().clear();
		}
	}

}
