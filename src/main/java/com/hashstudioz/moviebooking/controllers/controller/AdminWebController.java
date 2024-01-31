package com.hashstudioz.moviebooking.controllers.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.hashstudioz.moviebooking.entities.Show;
import com.hashstudioz.moviebooking.repository.theater.ShowRepository;

@Controller("/api/v1/admin")
public class AdminWebController {
	
	@Autowired
	private ShowRepository showRepo;
	
	@GetMapping("/adminhome")
	public String adminHome(Model model) {
        List<Show> showsList = showRepo.findAll();
        System.out.println(showsList);
        model.addAllAttributes(showsList);
		return "adminhome";
	}
}
