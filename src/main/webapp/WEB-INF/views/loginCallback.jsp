<%@page import="com.traveler.app.model.NaverUser"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.traveler.app.model.Token"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
2. callback.jsp
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>

<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "Pib4qbKkrYc1EHWAAiyP";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "gcCSDLDM0L";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
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
    String temp ="";
   // System.out.println("apiURL="+apiURL);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
     // System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
        out.println(res.toString());
        temp = res.toString();
      }
    } catch (Exception e) {
      System.out.println(e);
    }
    
    Token token = new Token();
    ObjectMapper mapper = new ObjectMapper();
    token = mapper.readValue(temp.toString(), Token.class);
    System.out.print(token.getAccess_token());
    access_token = token.getAccess_token();
    
    
    String accessToken = access_token;// 네이버 로그인 접근 토큰;
    String header = "Bearer " + access_token; // Bearer 다음에 공백 추가
    
    try {
        String URL = "https://openapi.naver.com/v1/nid/me";
        URL url = new URL(URL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("Authorization", header);
        int responseCode = con.getResponseCode();
        BufferedReader br;
        if(responseCode==200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        String inputLine;
        StringBuffer responseData = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            responseData.append(inputLine);
        }
        br.close();
        System.out.println(responseData.toString());
        Gson gson = new Gson();
        NaverUser nUser = new NaverUser(); 
        nUser =	gson.fromJson(responseData.toString(), NaverUser.class);
        System.out.println(nUser.getResponse().getId());
        System.out.println(nUser.getResponse().getEmail());
        
    } catch (Exception e) {
    	
        System.out.println(e);
    }
    
    
  %>
  	
  </body>
</html>
