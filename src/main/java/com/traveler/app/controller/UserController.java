package com.traveler.app.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.traveler.app.model.User;
import com.traveler.app.repository.UserRepository;
import com.traveler.app.service.KakaoAPI;
import com.traveler.app.service.KakaoUserInfo;
import com.traveler.app.service.NaverAPI;
import com.traveler.app.service.NaverUserInfo;
import com.traveler.app.utils.Script;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private NaverAPI naver;
	
	@Autowired
	private NaverUserInfo naverUserInfo;
	
	@Autowired
	private KakaoAPI kakao;
	
	@Autowired
	private KakaoUserInfo kakaoUserInfo;
	
	@Autowired
	private UserRepository mUserRepo;

	@Autowired
	private BCryptPasswordEncoder encoderPassword;

	
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "joinForm";
	}

	@PostMapping("/joinProcess")
	public @ResponseBody String joinProcess(User user) {
		//패스워드 인코딩
		String rawPassword = user.getPassword();
		String encPassword = encoderPassword.encode(rawPassword);
		user.setPassword(encPassword);
		int result = mUserRepo.save(user);
		
		if (result == 1) {
			return Script.href("loginForm");
		} else {
			return Script.back("Join Fail");
		}

	}

	@GetMapping("/loginForm")
	public String loginForm() {
		return "loginForm";
	}

	//네이버 콜백 컨트롤
	@GetMapping("/callback")
	public @ResponseBody String oauthNaverLogin(
			@RequestParam("code") String codeNum,
			@RequestParam("state") String stateNum,
			HttpSession session) throws UnsupportedEncodingException {
		
		//코드로 토큰 요청
		String access_token = naver.getAccessToken(codeNum, stateNum);
		//받아온 토큰으로 정보 요청
		naverUserInfo.getNaverUserInfo(access_token, session);
		return Script.close();
	}
	
	//카카오 콜백 컨트롤
	@GetMapping("/oauth")
	public @ResponseBody String oauthKakaoLogin(@RequestParam("code") String code, HttpSession session) {
		
		//코드로 토큰 요청
		String access_token = kakao.getAccessToken(code);
		//받아온 토큰으로 정보 요청
		kakaoUserInfo.getKakaoUserInfo(access_token, session);
		return Script.close();
	}
	
	@PostMapping("/update")
	public @ResponseBody String userUpdate(User user) {
		System.out.println("user : "+user);
		int result = mUserRepo.update(user);
		if(result==1) {
			return Script.href("/mypage");
		}else {
			return Script.back("수정 실패"); 
		}
	}
	
}
