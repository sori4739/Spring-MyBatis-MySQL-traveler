<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>MyRealTrip</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/style.css">

  </head>
  <body>
	<script>
	function loginForm(){
		window.open("/user/loginForm","","width=350, height=570,top =110,left=600;");		
	};
	function joinForm(){
		window.open("/user/joinForm","","width=350, height=660,top =70,left=600;");		
	};
</script>

    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
		  <a class="navbar-brand" href="index"><img src="/images/logo.png" width="128px" height="28px"></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
              <li class="nav-item"><a href="#" class="nav-link">항공권</a></li>
	          <li class="nav-item"><a href="#" class="nav-link">파트너 등록하기</a></li>
	          <li class="nav-item"><a href="#" onclick="loginForm()" class="nav-link">로그인</a></li>
	          <li class="nav-item"><a href="#" onclick="joinForm()" class="nav-link">회원가입</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>