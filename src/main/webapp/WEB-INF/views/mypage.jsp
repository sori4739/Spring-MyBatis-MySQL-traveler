<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.traveler.app.model.Air"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include/nav.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=79866955a2587e652b5296e2bbe4b828"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

<div class="hero-wrap" style="background-color: #2B96ED;"
	style="height: 300px;">
	<div class="overlay" style="height: 300px;"></div>
	<div class="container"></div>
</div>

<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<h2>My Page</h2>
			</div>
		</div>

	</div>
</section>


  <section class="ftco-section contact-section">
      <div class="container">
        <div class="row d-flex contact-info">
          <div class="col-md-12 mb-4">
            <h2><i class="fas fa-user-edit"></i>&emsp;회원 정보 수정</h2>
          </div>

        </div>
            <form action="/user/update" method="POST" class="bg-white contact-form">
        <div class="row block-9">
          <div class="col-md-6 order-md-last">
            <input type="hidden" name="id" value="${user.id }"/>
              <div>
              	<p>이메일</p>
                <input type="email" class="form-control" name="email" placeholder="${user.email }" disabled></br>
              </div>
              <div>
              <p>이름</p>
                <input type="text" class="form-control" name="name" value="${user.name }"></br>
              </div>
              <div>
              <p>전화번호</p>
                <input type="tel" class="form-control" name="phone" value="${user.phone }"></br>
              </div>
									
              <div>
                <input type="submit" value="수정" class="btn btn-primary py-3 px-5">
              </div>
            
          
          </div>

  <!--         <div class="col-md-6 d-flex">
          	<div id="kmap" style="width:500px;height:400px;"></div>
	
          </div> -->
        </div>
        </form>
      </div>
    </section>

<section class="ftco-section">
	<div class="container">
		<h2><i class="fas fa-receipt"></i>&emsp;예약 내역</h2><hr width=1000px/>
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
									<form action="/cancel" method="POST">
										<input type="hidden" value="${item.id }" name="id">
										<input type="submit" value="취소"/>
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
		</br></br></br>
		<h2><i class="fas fa-shopping-cart"></i>&emsp;보관한 게시물</h2><hr width=1000px/>

		<div class="row d-flex" id="blogList">
		<c:forEach var="blog" items="${blog}">
			<div class="col-md-4 ">
					<div class="blog-entry align-self-stretch">
						<a class="block-20 rounded"><img src="${blog.previewImg}" width=100% height=100%></a>
						<div class="text mt-3">
							<h3 class="heading"	style="width: 100%; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">
								<a href="#">${blog.title}</a>
							</h3>
							<p style="width: 100%; height: 150px; text-overflow: ellipsis; white-space: normal; overflow: hidden; color:black;">${blog.description}</p>
							<form action="/keep/delete" method="POST">
							<a href="#" onclick="blogLink(${blog.id})" class="btn btn-secondary rounded" style="width: 45%;">More info</a>
							<input type="submit" class="btn btn-secondary rounded" style="width: 45%; float:right" value="삭제">
							<input type="hidden" value="${blog.id }" name="id">
							</form>
						</div>
					</div>
				</div>
		</c:forEach>
		</div>
		
	</div>

</section>
	<script>
		var container = document.getElementById('kmap');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
function blogLink(id){
			window.open("blogLink?id="+id,"","width=1020, height=1020, top=110,left=450;");
		}
	</script>
<%@include file="include/footer.jsp"%>
</body>
</html>