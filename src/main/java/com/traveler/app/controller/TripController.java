package com.traveler.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.traveler.app.model.City;
import com.traveler.app.repository.CityRepository;

@Controller
public class TripController {
	
	@Autowired
	private CityRepository cityRepo;
	
	@GetMapping("/trip")
	public String trip(Model model) {
		List<City> cities = cityRepo.findByAll();
		model.addAttribute("cities", cities);
		return "trip";
	}
}
