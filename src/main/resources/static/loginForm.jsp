<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="/css/login.css">
    <title>로그인</title>

</head>

<body style="margin-top: -70px;">

    <div class="card align-middle" style="width:20rem; border-radius:20px;">
        <div class="card-title" style="margin-top:30px;">
            <h2 class="card-title text-center" style="color:#113366;">로그인</h2>
        </div>
        <button onclick="" class="kakao-login">
            <img src="https://t1.daumcdn.net/cfile/tistory/2368144B56FFF8620A" width="18px" alt=""> 카카오 계정으로 로그인
        </button>
        <button onclick="" class="naver-login">
            <img src="https://d2yoing0loi5gh.cloudfront.net/assets/kitty/setting/naver-logo@2x-332865f7b796a02822378e0b61e6dcace93ae9a24abd810cd774a06b5fbcb0b5.png"
                width="18px" alt=""> 네이버 계정으로 로그인
        </button>
        <div class="line">
            <div class="line-left"></div>
            <span>or</span>
            <div class="line-right"></div>
        </div>
        <div class="card-body">
            <form class="form-signin" method="POST" onSubmit="logincall();return false">
                <h5 class="form-signin-heading"></h5>
                <div class="join-login-text">아이디</div>
                <input type="text" id="uid" class="form-control" placeholder="ID" onfocus="this.placeholder=''" onblur="this.placeholder='ID'" required autofocus><BR>
                <div class="join-login-text">비밀번호</div>
                <input type="password" id="upw" class="form-control" placeholder="Password" onfocus="this.placeholder=''" onblur="this.placeholder='Password'" required><br>
                <div class="checkbox">
                    <label>
                        <input style="width: 15px; height: 15px;" type="checkbox" name="rememeber-me"> 로그인 유지
                    </label>
                </div>
                <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">이메일로 로그인</button>
            </form>
            <br />
            <div class="already">
                <div style="font-size: small;">아직 마이리얼트립 회원이 아니신가요? <a class="member" href="#">회원가입</a></div>
            </div>
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
</body>

</html>