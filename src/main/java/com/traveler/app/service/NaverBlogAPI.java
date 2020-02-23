package com.traveler.app.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Service;

@Service
public class NaverBlogAPI {
    public static String crawling(String keyword) {
           String clientId = "tYIJr18uXfTjmTELkqwE";//애플리케이션 클라이언트 아이디값";
           String clientSecret = "Ddp_8Cm8Uc";//애플리케이션 클라이언트 시크릿값";
           try {
               String text = URLEncoder.encode(keyword, "UTF-8");
               String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text+"&start=1&display=50"; // json 결과
               //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
               URL url = new URL(apiURL);
               HttpURLConnection con = (HttpURLConnection)url.openConnection();
               con.setRequestMethod("GET");
               con.setRequestProperty("X-Naver-Client-Id", clientId);
               con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
               int responseCode = con.getResponseCode();
               BufferedReader br;
               if(responseCode==200) { // 정상 호출
                   br = new BufferedReader(new InputStreamReader(con.getInputStream(),"utf-8"));
               } else {  // 에러 발생
                   br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"utf-8"));
               }
               String inputLine;
               StringBuffer response = new StringBuffer();
               while ((inputLine = br.readLine()) != null) {
                   response.append(inputLine);
               }
               br.close();
               return response.toString();
           } catch (Exception e) {
               System.out.println(e);
           }
         return null;
       }
}