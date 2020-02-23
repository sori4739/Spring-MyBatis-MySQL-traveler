package com.traveler.app.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.traveler.app.model.KakaoUser;
import com.traveler.app.model.User;
import com.traveler.app.repository.KakaoUserRepository;
import com.traveler.app.repository.UserRepository;
import com.traveler.app.security.MyUserDetailService;
import com.traveler.app.utils.Script;

@Service
public class KakaoUserInfo {
	
	@Autowired
	private UserRepository mUserRepository;
	
	@Autowired
	private MyUserDetailService mPrincipalDetailService;
	
	@Autowired
	private KakaoUserRepository kUserRepository;
	
	public String getKakaoUserInfo(String access_token, HttpSession session) {
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		int result = 0;
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_token);

			int responseCode = conn.getResponseCode();
			//System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String response = "";

			while ((line = br.readLine()) != null) {
				response += line;
			}
			//System.out.println("response body : " + response);
			Gson gson = new Gson();
			KakaoUser kUser = new KakaoUser();
			kUser = gson.fromJson(response, KakaoUser.class);
			//System.out.println("kId : "+kUser.getId());
			//System.out.println("kEmail : "+kUser.getKakao_account().getEmail());
			
			User user = mUserRepository.findByUsername(kUser.getId());
			if(user != null) {
				System.out.println("=======================아이디 있으면 그대로 로그인");
				UserDetails userDetail = mPrincipalDetailService.loadUserByUsername(user.getUsername());
				Authentication authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
						userDetail.getAuthorities());
				SecurityContext securityContext = SecurityContextHolder.getContext();
				securityContext.setAuthentication(authentication);
				session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
				return null;
				
			}else {
				result = kUserRepository.save(kUser);
				user = mUserRepository.findByUsername(kUser.getId());
				if (result == 1) {
					System.out.println("=======================세이브하면서 로그인");
					UserDetails userDetail = mPrincipalDetailService.loadUserByUsername(user.getUsername());
					Authentication authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
							userDetail.getAuthorities());
					SecurityContext securityContext = SecurityContextHolder.getContext();
					securityContext.setAuthentication(authentication);
					session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
					return null;
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return Script.close();
	}
}


