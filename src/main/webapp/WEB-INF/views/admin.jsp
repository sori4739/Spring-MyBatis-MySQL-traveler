<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<title>traveler</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="/css/animate.css">
<link rel="stylesheet" href="/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<div>

		<section class="ftco-section">
			<div class="container">
			<a href="/"><button type="button" style="float:right" onclick="">Home</button></a>
				<div>

					<!--국내 여행지 리스트 시작 -->
					<form action="/crawling">
						<select name="value" style="width: 189px">
							<option>국내</option>

							<optgroup label="경주">
								<c:forEach var="t" items="${tourList}">
									<c:if test="${t.cityId eq 1}">
										<option value="경주 ${t.name}">${t.name}</option>
									</c:if>
								</c:forEach>
							</optgroup>

							<optgroup label="대전">
								<c:forEach var="t" items="${tourList}">
									<c:if test="${t.cityId eq 2}">
										<option value="대전 ${t.name}">${t.name}</option>
									</c:if>
								</c:forEach>
							</optgroup>

							<optgroup label="부산">
								<c:forEach var="t" items="${tourList}">
									<c:if test="${t.cityId eq 3}">
										<option value="부산 ${t.name}">${t.name}</option>
									</c:if>
								</c:forEach>
							</optgroup>

							<optgroup label="서울">
								<c:forEach var="t" items="${tourList}">
									<c:if test="${t.cityId eq 4}">
										<option value="서울 ${t.name}">${t.name}</option>
									</c:if>
								</c:forEach>
							</optgroup>

							<optgroup label="전주">
								<c:forEach var="t" items="${tourList}">
									<c:if test="${t.cityId eq 5}">
										<option value="전주 ${t.name}">${t.name}</option>
									</c:if>
								</c:forEach>
							</optgroup>

							<optgroup label="제주도">
								<c:forEach var="t" items="${tourList}">
									<c:if test="${t.cityId eq 6}">
										<option value="제주도 ${t.name}">${t.name}</option>
									</c:if>
								</c:forEach>
							</optgroup>
						</select>
						<button type="submit" style="height: 30px">확인</button>
					</form>
					<!--국내 여행지 리스트 끝-->

					<!--해외 여행지 리스트 시작  -->
					<form action="/crawling">
						<select name="value" style="width: 189px">
							<option>해외</option>

							<optgroup label="방콕">
								<c:forEach var="t" items="${tourList}">
									<c:if test="${t.cityId eq 7}">
										<option value="방콕 ${t.name}">${t.name}</option>
									</c:if>
								</c:forEach>
							</optgroup>

							<optgroup label="타이페이">
								<c:forEach var="t" items="${tourList}">
									<c:if test="${t.cityId eq 8}">
										<option value="타이페이 ${t.name}">${t.name}</option>
									</c:if>
								</c:forEach>
							</optgroup>

							<optgroup label="파리">
								<c:forEach var="t" items="${tourList}">
									<c:if test="${t.cityId eq 9}">
										<option value="파리 ${t.name}">${t.name}</option>
									</c:if>
								</c:forEach>
							</optgroup>

							<optgroup label="프라하">
								<c:forEach var="t" items="${tourList}">
									<c:if test="${t.cityId eq 10}">
										<option value="프라하 ${t.name}">${t.name}</option>
									</c:if>
								</c:forEach>
							</optgroup>

							<optgroup label="하와이">
								<c:forEach var="t" items="${tourList}">
									<c:if test="${t.cityId eq 11}">
										<option value="하와이 ${t.name}">${t.name}</option>
									</c:if>
								</c:forEach>
							</optgroup>

							<optgroup label="홍콩">
								<c:forEach var="t" items="${tourList}">
									<c:if test="${t.cityId eq 12}">
										<option value="홍콩 ${t.name}">${t.name}</option>
									</c:if>
								</c:forEach>
							</optgroup>

						</select>
						<button type="submit" style="height: 30px">확인</button>
					</form>
					<!--해외 여행지 리스트 끝 -->
					</br> </br>
				</div>
				<!--블로그 크롤링 시작 -->
				<div class="row d-flex">
					<c:forEach var="i" begin="0" end="49">
						<form class="col-md-3 d-flex ftco-animate" action="/save"
							method="POST">
							<input type="hidden" id="title" name="title" value="${channel.items.get(i).title}"/>
							<input type="hidden" id="link" name="link" value="${channel.items.get(i).link}"/>
						 	<input type="hidden" id="bloggername" name="bloggername" value="${channel.items.get(i).bloggername}"/>
						 	<input type="hidden" id="description" name="description" value="${channel.items.get(i).description}"/>
						 	<input type="hidden" id="previewImg" name="previewImg" value="${channel.items.get(i).previewImg}"/>
						 	<input type="hidden" id="tourId" name="tourId" value="${channel.items.get(i).tourId}"/>
							<div class="blog-entry align-self-stretch">
								<a href="${channel.items.get(i).link }"><img
									src="${channel.items.get(i).previewImg }"
									style="width: 255px; height: 200px" id="img"> </a>
								<div class="text mt-3" style="width: 255px">
									
									<h3 class="heading">
										<a href="#">${channel.items.get(i).title }</a>
									</h3>
									<p>${channel.items.get(i).description }</p>
									<button style="width: 240px" type="submit"
										class="btn btn-primary">등록</button>
								</div>
							</div>
						</form>
					</c:forEach>
				</div>
				<!--블로그 크롤링 끝 -->
			</div>
		</section>

	</div>

	<%@include file="include/footer.jsp"%>
</body>
</html>