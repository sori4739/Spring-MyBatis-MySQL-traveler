<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.traveler.app.model.Air"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include/nav.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script>
function loginForm(){
	window.open("/user/loginForm","","width=350, height=570,top =110,left=600;");		
};

</script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<div class="hero-wrap" style="background-color: #2B96ED;"
	style="height: 300px;">
	<div class="overlay" style="height: 300px;"></div>
	<div class="container"></div>
</div>

<section class="ftco-section">
	<div class="container">
		<div class="row mb-5 pb-3">
			<div class="col-md-7 heading-section ftco-animate">
				<form class="mrt_air" action="/airSearch">
					<div>
						<i class="fas fa-plane-departure">&ensp;출발지</i> <select
							name="depLo"
							style="width: 200px; float: right; margin-right: 150px">
							<option value="NAARKPC">제주</option>
							<option value="NAARKJJ">광주</option>
							<option value="NAARKJK">군산</option>
							<option value="NAARKJB">무안</option>
							<option value="NAARKJY">여수</option>
							<option value="NAARKNW">원주</option>
							<option value="NAARKNY">양양</option>
							<option value="NAARKPK">김해</option>
							<option value="NAARKPS">사천</option>
							<option value="NAARKPU">울산</option>
							<option value="NAARKSI">인천</option>
							<option value="NAARKSS">김포</option>
							<option value="NAARKTH">포항</option>
							<option value="NAARKTN">대구</option>
							<option value="NAARKTU">청주</option>

						</select>
					</div>
					<div>
						<i class="fas fa-plane-arrival">&ensp;도착지</i> <select name="arrLo"
							style="width: 200px; float: right; margin-right: 150px">
							<option value="NAARKPC">제주</option>
							<option value="NAARKJJ">광주</option>
							<option value="NAARKJK">군산</option>
							<option value="NAARKJB">무안</option>
							<option value="NAARKJY">여수</option>
							<option value="NAARKNW">원주</option>
							<option value="NAARKNY">양양</option>
							<option value="NAARKPK">김해</option>
							<option value="NAARKPS">사천</option>
							<option value="NAARKPU">울산</option>
							<option value="NAARKSI">인천</option>
							<option value="NAARKSS">김포</option>
							<option value="NAARKTH">포항</option>
							<option value="NAARKTN">대구</option>
							<option value="NAARKTU">청주</option>

						</select>
					</div>
					<div>
						<i class="far fa-calendar-alt">&ensp;가는날</i><input type="date"
							id="date" name="date" min="2020-02-11" required="required">
					</div>
					<div>
						<i class="fas fa-user">&ensp;인원</i><input type="number" value="1"
							name="people">
					</div>
					<button class="btn btn-primary" type="submit">검색</button>
				</form>
			</div>
		</div>

	</div>
</section>
<section class="ftco-section">
	<div class="container">
		<sec:authorize access="isAuthenticated()">
        	<sec:authentication property="principal.username" var="userId" /> 
        </sec:authorize>
		<c:forEach var="item" items="${item}">
			<div class="row d-flex">
				<div class="col-md-12 d-flex ftco-animate">
					<div class="mrt_airdetail">
						<!--  <i class="fas fa-plane-departure"></i>&ensp;&ensp;&ensp;&ensp; -->
						<table class="airtable"  style="text-align:center;">
							<tr>
								<th style="width: 10%;">항공사</th>
								<th style="width: 10%;">출발지</th>
								<!-- <th><i class="fas fa-plane" style="font-size:50px"></i></th> -->
								<th style="width: 10%;">도착지</th>
								<th style="width: 20%;">출발시간</th>
								<th style="width: 20%;">도착시간</th>
								<th style="width: 10%;">비용</th>
								<th style="width: 10%;" rowspan="2">
									<form action="/pay" method="POST">
										<input type="hidden" value="${item.economyCharge}" name="economyCharge"/>
										<input type="hidden" value="${item.airlineNm}" name="airlineNm"/>
										<input type="hidden" value="${item.depAirportNm}" name="depAirportNm"/>
										<input type="hidden" value="${item.depTime}" name="depTime"/>
										<input type="hidden" value="${item.arrAirportNm}" name="arrAirportNm"/>
										<input type="hidden" value="${item.arrTime}" name="arrTime"/>
										<c:choose>
											<c:when test="${userId ne null}">
												<input type="submit" value="결제"/>
											</c:when>
											<c:otherwise>
												<input type="button" onClick="loginForm()" value="결제">
											</c:otherwise>
										</c:choose>
									</form>
								
								</th>
							</tr>
							<tr>
								<td>${item.airlineNm }</td>
								<td>${item.depAirportNm }</td>
								<!-- <td></td> -->
								<td>${item.arrAirportNm }</td>
								<td>${item.depTime }</td>
								<td>${item.arrTime }</td>
								<td>${item.economyCharge }</td>
							</tr>
						</table>

					</div>
				</div>
			</div>
			</br>
		</c:forEach>
	</div>

</section>

<script>
	var date = new Date();
	document.getElementById('date').valueAsDate = date;
	document.getElementById('date').setAttribute('min',yyyymmdd(date));
	
	function yyyymmdd(date){
		 var year = date.getFullYear();              //yyyy
		 var month = (1 + date.getMonth());          //M
		 month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
		 var day = date.getDate();                   //d
		 day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
		 return  year + '-' + month + '-' + day;
	}

</script>
<%@include file="include/footer.jsp"%>
</body>
</html>