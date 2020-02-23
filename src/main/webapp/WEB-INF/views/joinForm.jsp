<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/join.css">
    <title>회원가입</title>

</head>

<body style="margin-top: -70px;">

	<%
    String clientId = "j7_wQWuwkdYe8BCI30A2";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://ec2-52-79-240-189.ap-northeast-2.compute.amazonaws.com:8080/user/callback", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>

    <div class="card align-middle" style="width:20rem; border-radius:20px;">
        <div class="card-title" style="margin-top:30px;">
            <h2 class="card-title text-center" style="color:#113366;">회원가입</h2>
        </div>
        
        
        <!--카카오 회원가입  -->
        <button onclick="" class="kakao-login">
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=39b7f27d609a45a4aea845e325f75e77&redirect_uri=http://ec2-52-79-240-189.ap-northeast-2.compute.amazonaws.com:8080/user/oauth&response_type=code">
            <img src="https://t1.daumcdn.net/cfile/tistory/2368144B56FFF8620A" width="18px" alt="">카카오 계정으로 회원가입</a>
        </button>
        
        <!--네이버 회원가입  -->
        <button type ="submit" onclick="" class="naver-login">
            <a href="<%=apiURL%>"><img src="https://d2yoing0loi5gh.cloudfront.net/assets/kitty/setting/naver-logo@2x-332865f7b796a02822378e0b61e6dcace93ae9a24abd810cd774a06b5fbcb0b5.png"
                width="18px"  alt=""> 네이버 계정으로 회원가입</a>
        </button>
       
       
        
        
        <div class="line">
            <div class="line-left"></div>
            <span>or</span>
            <div class="line-right"></div>
        </div>
        <div class="card-body">
            <form class="form-signin" action="/user/joinProcess" method="POST" onSubmit="return validateCheck()"/>
                
                <div class="join-login-text"><div style="margin-top: 10px;">아이디*</div>
                <input type="text" id="uid" name="username" class="form-control" placeholder="ID" onfocus="this.placeholder=''" onblur="this.placeholder='ID'" required autofocus></div>
                
                <div class="join-login-text"><div class="join-font">이메일*</div>
                <input type="email" id="uid" name="email" class="form-control" placeholder="Email" onfocus="this.placeholder=''" onblur="this.placeholder='Email'" required autofocus></div>
                
                <div class="join-login-text"><div class="join-font">비밀번호*</div>
                <input type="password" id="password" name="password" class="form-control" placeholder="Password" onfocus="this.placeholder=''" onblur="this.placeholder='Password'" required></div>
                
                <div class="join-login-text"><div class="join-font">비밀번호 확인*</div>
                <input type="password" id="passwordCheck" name="passwordCheck" class="form-control" placeholder="Password Check" onfocus="this.placeholder=''" onblur="this.placeholder='Password Check'" required></div>
                
                <br/>
                <input type="submit" value="회원가입" id="btn-Yes" class="btn btn-lg btn-primary btn-block"/>
            </form>
            <br />
           
        </div>
    </div>

    <div class="modal">
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    <script>
	    function validateCheck() {
			var password = document.querySelector('#password').value;
			var passwordCheck = document.querySelector('#passwordCheck').value;
			
			if (password === passwordCheck) {
				console.log('비밀번호가 동일합니다.');
				return true;
			} else {
				console.log('비밀번호가 틀렸습니다.');
				alert('비밀번호가 동일하지 않습니다. 다시 입력해주세요.');
				return false;
			}
		}
    </script>
</body>

</html>