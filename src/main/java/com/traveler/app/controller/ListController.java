package com.traveler.app.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.traveler.app.model.Blog;
import com.traveler.app.model.City;
import com.traveler.app.model.Keep;
import com.traveler.app.model.Tour;
import com.traveler.app.repository.BlogRepository;
import com.traveler.app.repository.CityRepository;
import com.traveler.app.repository.KeepRepository;
import com.traveler.app.repository.TourRepository;
import com.traveler.app.security.MyUserDetails;

@Controller
public class ListController {

	@Autowired
	private CityRepository cityRepo;

	@Autowired
	private TourRepository tourRepo;

	@Autowired
	private BlogRepository blogRepo;

	@Autowired
	private KeepRepository keepRepo;
	
	@GetMapping("/tourList")
	public String tourList(@RequestParam("id") int cityId, Model model) {
		City city = cityRepo.findById(cityId);
		List<Tour> tour = tourRepo.findByCityId(cityId);
		List<Blog> mainBlog = new ArrayList<Blog>(); 
		System.out.println("==============================");
		for (Tour t : tour) {
			mainBlog.addAll(blogRepo.findByTourId(t.getId()));  
		}
		for (Blog blog : mainBlog) {
			System.out.println("mainBlog Title : "+blog.getTitle());
			
		}

		model.addAttribute("mainBlog", mainBlog);
		model.addAttribute("city", city);
		model.addAttribute("tour", tour);

		return "list";
	}

	@PostMapping("/blogList")
	public @ResponseBody List<Blog> blogList(@RequestBody String tourId, @AuthenticationPrincipal MyUserDetails userDetails) {
		System.out.println("=============");
		int tId = Integer.parseInt(tourId);
		List<Blog> items = blogRepo.findByTourId(tId);
		
		int userId = 0;
		if(userDetails != null) {
			userId=userDetails.getUser().getId();
		}
		
		List<Keep> keeps = keepRepo.findByUserId(userId);
//		for (Keep k : keeps) {
//			k.setStatus(true);
//		}
		
		
		for (Blog i : items) {
			System.out.println("Id : "+i.getId());
			System.out.println("PreviewImg : "+i.getPreviewImg());
			System.out.println("title : "+ i.getTitle());
			
			for (Keep k : keeps) {
				if(k.getBlogId() == i.getId()) {
					i.setStatus(true);
				}
			}
			System.out.println("status : " + i.isStatus());
		}
		
		return items;

	}

}
