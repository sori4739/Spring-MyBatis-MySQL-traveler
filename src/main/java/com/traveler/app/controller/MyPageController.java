package com.traveler.app.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.traveler.app.model.AirItem;
import com.traveler.app.model.Blog;
import com.traveler.app.model.Keep;
import com.traveler.app.model.User;
import com.traveler.app.repository.AirRepository;
import com.traveler.app.repository.BlogRepository;
import com.traveler.app.repository.KeepRepository;
import com.traveler.app.repository.UserRepository;
import com.traveler.app.security.MyUserDetails;
import com.traveler.app.utils.Script;

@Controller
public class MyPageController {

	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private AirRepository airRepo;
	
	@Autowired
	private KeepRepository keepRepo;
	
	@Autowired
	private BlogRepository blogRepo;
	
	
	@GetMapping("/mypage")
	public String myPage(@AuthenticationPrincipal MyUserDetails userDetails,Model model) {
		String username=userDetails.getUser().getUsername();
		int userId=userDetails.getUser().getId();
		User user = userRepo.findByUsername(username);
		List<AirItem> airItem= airRepo.findByUserId(userId);
		List<Keep> keeps = keepRepo.findByUserId(userId);
		List<Blog> blogs = new ArrayList<Blog>();
		
		for (Keep k : keeps) {
			blogs.add(blogRepo.findById(k.getBlogId()));
		}
		model.addAttribute("blog",blogs);
		model.addAttribute("item",airItem);
		model.addAttribute("user",user);
		return "mypage";
	}
	
	@PostMapping("/cancel")
	public @ResponseBody String cancel(@RequestParam("id") int id) {
		int result = airRepo.delete(id);
		if(result==1) {
			return Script.href("mypage");
		}else {
			return Script.back("취소 실패");
		}
	}
	
	@PostMapping("/keep/delete")
	public @ResponseBody String keepDelete(@RequestParam("id") int id,@AuthenticationPrincipal MyUserDetails userDetails) {
		int userId = userDetails.getUser().getId();
		int result = keepRepo.delete(userId, id);
		if(result==1) {
			return Script.href("/mypage");
		}else {
			return Script.back("취소 실패");
		}
	}
}
