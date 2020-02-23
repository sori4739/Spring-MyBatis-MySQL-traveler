package com.traveler.app.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.traveler.app.model.Air;
import com.traveler.app.model.AirItem;
import com.traveler.app.repository.AirRepository;
import com.traveler.app.security.MyUserDetails;
import com.traveler.app.service.AirService;
import com.traveler.app.service.PublicAirAPI;
import com.traveler.app.utils.Script;

@Controller
public class AirController {

	@Autowired
	private AirRepository airRepo;
	
	@Autowired
	private AirService airService;
	
	@Autowired
	private PublicAirAPI airAPI;

	@GetMapping("/air")
	public String air() {
		return "air";
	}

	@GetMapping("/airpay")
	public String air(@RequestParam("result") String result, @AuthenticationPrincipal MyUserDetails userDetails) {

		int userId = userDetails.getUser().getId();
		if (result.equals("success")) {
			return "redirect:/mypage";
		} else {
			airRepo.delete(userId);
			return "air";
		}
	}

	@PostMapping("/pay")
	public String test(AirItem airItem, Model model, @AuthenticationPrincipal MyUserDetails userDetails) {

		int userId = userDetails.getUser().getId();
		airItem.setUserId(userId);

		model.addAttribute("economyCharge", airItem.getEconomyCharge());
		int result = airRepo.save(airItem);
		if (result == 1) {
			return "pay";
		} else {

			return "redirect:/savefail";
		}

	}

	@GetMapping("/airSearch")
	public String airSearch(@RequestParam("depLo") String depLo, @RequestParam("arrLo") String arrLo,
			@RequestParam("date") Date date, @RequestParam("people") int people, Model model) {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String date2 = format.format(date);

		try {
			String result = airAPI.airSearch(depLo, arrLo, date2);
			if (result.substring(88, 89).equals("{")) {
				Air air = airService.dateProcessing(result, people);
				model.addAttribute("item", air.getResponse().getBody().getItems().getItem());
				return "air";
			} else {
				return "redirect:/fail";
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@GetMapping("/fail")
	public @ResponseBody String fail() {
		return Script.back("운행하지 않는 노선입니다.");
	}

	@GetMapping("/savefail")
	public @ResponseBody String savefail() {
		return Script.back("다시 시도해주세요");
	}

}
