<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>traveler</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/style.css">
	<script src="https://kit.fontawesome.com/5b8798f5c9.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		
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
		  <a class="navbar-brand" href="/index"><img src="/images/logo_white_back.png" width="128px" height="28px"></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
             <c:choose>
              	<c:when test="${principal.user.id != 1}">
              		<li class="nav-item"><a href="/trip" class="nav-link">여행지</a></li>
              		<li class="nav-item"><a href="/air" class="nav-link">항공권</a></li>
              	</c:when>
              	
              	<c:otherwise>
              		<li class="nav-item"><a href="/admin" class="nav-link">관리자페이지</a></li>
              		<li class="nav-item"><a href="/trip" class="nav-link">여행지</a></li>
              		<li class="nav-item"><a href="/air" class="nav-link">항공권</a></li>	
          	  	</c:otherwise>
          	  	
              </c:choose>
	          <c:choose>
	          	<c:when test="${not empty principal.user.id}">
	          		<li class="nav-item"><a href="/logout" class="nav-link">로그아웃</a></li>
	          		
	          		<li class="nav-item"><a href="/mypage" class="nav-link">마이페이지</a></li>
	          	</c:when>
	          	
	          	<c:otherwise>
	          		<li class="nav-item"><a href="#" onclick="loginForm()" class="nav-link">로그인</a></li>
	          		<li class="nav-item"><a href="#" onclick="joinForm()" class="nav-link">회원가입</a></li>
	          	</c:otherwise>
	          </c:choose>
	          
	        </ul>
	      </div>
	    </div>
	  </nav>
	  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>