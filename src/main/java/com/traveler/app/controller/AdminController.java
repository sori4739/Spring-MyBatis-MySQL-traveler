package com.traveler.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.traveler.app.model.Blog;
import com.traveler.app.model.Channel;
import com.traveler.app.model.City;
import com.traveler.app.model.Tour;
import com.traveler.app.repository.BlogRepository;
import com.traveler.app.repository.CityRepository;
import com.traveler.app.repository.TourRepository;
import com.traveler.app.service.AdminService;
import com.traveler.app.utils.Script;

@Controller
public class AdminController {

   @Autowired
   private BlogRepository blogRepo;

   @Autowired
   private TourRepository tourRepo;

   @Autowired
   private CityRepository cityRepo;

   @Autowired
   private AdminService adminService;

   @GetMapping("/admin")
   public String admin(Model model) {
      List<Tour> tourList = tourRepo.findByAll();
      List<City> cityList = cityRepo.findByAll();
      model.addAttribute("tourList", tourList);
      model.addAttribute("cityList", cityList);
      return "admin";
   }

   @GetMapping("/crawling")
   public String crawling(@RequestParam(value = "value", required = true, defaultValue = "0") String value,
         Model model) {
      
      List<Tour> tourList = tourRepo.findByAll();
      List<City> cityList = cityRepo.findByAll();

      // 크롤링
      Channel channel = adminService.isCrawling(value, model);
      
      //TourId 삽입
      for (Tour t : tourList) {
         if (value.contains(t.getName())) {
            for (Blog b : channel.getItems()) {
               b.setTourId(t.getId());
            }
         }
      }

      model.addAttribute("tourList", tourList);
      model.addAttribute("cityList", cityList);
      model.addAttribute("channel", channel);

      return "admin";
   }

   @PostMapping("/save")
   public @ResponseBody String save(Blog items) {
      int result = blogRepo.save(items);
      if (result == 1) {
         return Script.back("등록 완료");
      } else {
         return Script.back("저장 실패");
      }
   }
}