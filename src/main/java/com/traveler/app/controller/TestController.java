package com.traveler.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.traveler.app.utils.Script;

@Controller
public class TestController {
	
	@GetMapping("/close")
	public @ResponseBody String close() {
		return Script.close();
	}
	
	@GetMapping({"/","/index"})
	public String index() {
		return "index";
	}

	
}
