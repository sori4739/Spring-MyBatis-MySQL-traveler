package com.traveler.app.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.traveler.app.model.Token;

@Service
public class NaverAPI {
	public String getAccessToken(String codeNum, String stateNum) throws UnsupportedEncodingException {
		String clientId = "j7_wQWuwkdYe8BCI30A2";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "RYVixQuoOw";// 애플리케이션 클라이언트 시크릿값";
		String code = codeNum;
		String state = stateNum;
		String redirectURI = URLEncoder.encode("http://ec2-52-79-240-189.ap-northeast-2.compute.amazonaws.com:8080/user/callback", "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		String access_token = "";
		String refresh_token = "";
		String temp = "";
		// System.out.println("apiURL="+apiURL);
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			// System.out.print("responseCode="+responseCode);
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if (responseCode == 200) {
				temp = res.toString();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		//Gson으로 객체변환
		Token token = new Token();
		Gson gson = new Gson();
		token = gson.fromJson(temp.toString(), Token.class);
		access_token = token.getAccess_token();
		
		return access_token;
	}
}
