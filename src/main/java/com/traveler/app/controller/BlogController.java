package com.traveler.app.controller;

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
import com.traveler.app.model.Keep;
import com.traveler.app.repository.BlogRepository;
import com.traveler.app.repository.KeepRepository;
import com.traveler.app.security.MyUserDetails;

@Controller
public class BlogController {
	
	@Autowired
	private BlogRepository blogRepo;
	
	@Autowired
	private KeepRepository keepRepo;
	
	@PostMapping("/keep")
	public @ResponseBody String keep(@RequestBody String blogId,@AuthenticationPrincipal MyUserDetails userDetails) {
		Keep keep = new Keep();
		int userId=userDetails.getUser().getId();
		int blogId_int=Integer.parseInt(blogId);
		keep.setBlogId(blogId_int);
		keep.setUserId(userId);
		keepRepo.save(keep);
		return null;
	}
	
	@PostMapping("/keep/cancel")
	public String keepCancel(@RequestBody String blogId,@AuthenticationPrincipal MyUserDetails userDetails) {
		int userId=userDetails.getUser().getId();
		int blogId_int=Integer.parseInt(blogId);
		keepRepo.delete(userId,blogId_int);
		return null;
	}
	
	@GetMapping("/blogLink")
	public String blog(@RequestParam("id") int id, Model model) {
		Blog blog = blogRepo.findById(id);
		System.out.println("blogLink : "+blog.getLink());
		model.addAttribute("blog", blog);
		return "blog";
	}
}
