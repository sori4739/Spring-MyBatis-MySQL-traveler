package com.traveler.app.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.traveler.app.model.Token;
 
@Service
public class KakaoAPI {
    
    public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=39b7f27d609a45a4aea845e325f75e77");
            sb.append("&redirect_uri=http://ec2-52-79-240-189.ap-northeast-2.compute.amazonaws.com:8080/user/oauth");
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            
            //    결과 코드가 200이라면 성공
            //int responseCode = conn.getResponseCode();
            
 
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            
            //System.out.println("response body : " + result);
            
            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            Gson gson = new Gson(); 
            Token token = new Token(); 
            token = gson.fromJson(result, Token.class);
            access_Token = token.getAccess_token();
            //System.out.println("access_token : " + token.getAccess_token());
            //System.out.println("refresh_token : " + token.getRefresh_token());
            
            br.close();
            bw.close();
            
        } catch (IOException e) {
            e.printStackTrace();
        } 
        
        return access_Token;
    }
}
 