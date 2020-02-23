package com.traveler.app.service;

import java.io.BufferedReader;
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
import com.traveler.app.model.NaverUser;
import com.traveler.app.model.User;
import com.traveler.app.repository.NaverUserRepository;
import com.traveler.app.repository.UserRepository;
import com.traveler.app.security.MyUserDetailService;
import com.traveler.app.utils.Script;

@Service
public class NaverUserInfo {

	@Autowired
	private UserRepository mUserRepository;

	@Autowired
	private NaverUserRepository nUserRepository;

	@Autowired
	private MyUserDetailService mPrincipalDetailService;

	public String getNaverUserInfo(String access_token, HttpSession session) {
		
		String header = "Bearer " + access_token; // Bearer 다음에 공백 추가
		int result = 0;
		try {
			String URL = "https://openapi.naver.com/v1/nid/me";
			URL url = new URL(URL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer responseData = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				responseData.append(inputLine);
			}
			br.close();

			//System.out.println(responseData.toString());
			
			NaverUser nUser = new NaverUser();
			Gson gson = new Gson();
			nUser = gson.fromJson(responseData.toString(), NaverUser.class);

			//System.out.println(nUser.getResponse().getId());
			User user = mUserRepository.findByUsername(nUser.getResponse().getId());
			
			if (user != null) {
				System.out.println("=======================아이디 있으면 그대로 로그인");

				UserDetails userDetail = mPrincipalDetailService.loadUserByUsername(user.getUsername());
				System.out.println(userDetail.getUsername());
				System.out.println(userDetail.getPassword());
				Authentication authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
						userDetail.getAuthorities());
				SecurityContext securityContext = SecurityContextHolder.getContext();
				securityContext.setAuthentication(authentication);
				session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
				return null;

			} else {
				result = nUserRepository.save(nUser);
				user = mUserRepository.findByUsername(nUser.getResponse().getId());
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

		} catch (Exception e) {

			System.out.println(e);
		}

		return Script.close();
	}
}
