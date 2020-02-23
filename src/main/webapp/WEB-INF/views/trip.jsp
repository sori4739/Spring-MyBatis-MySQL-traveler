<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/nav.jsp" %>
		<div class="hero-wrap" style="background-color: #2B96ED;">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
          	<div class="text">
					<h1 class="mb-4 bread">Trip</h1>
				<p class="breadcrumbs"><span class="mr-2">국내 여행지</span>&emsp;&emsp; <span>해외 여행지</span><br/>
					<img src="/images/country.jpg" width="300px" height="300px">&emsp;&emsp;&emsp;<img src="/images/oversea.jpg" width="300px" height="300px"><br/>
					<a href="#country" style="font-size: 16px;">Let's get it</a>&emsp;&emsp;&emsp;<a href="#oversea" style="font-size: 16px;">Let's get it</a>
				</p>
				
            </div>
          </div>
		</div>
      </div>
    </div>


    <section class="ftco-section ftco-menu bg-light" id="country">
			<div class="container">
				<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
			<h2 style="color: black;">국내 여행지</h2>
			<hr/>
          </div>
        </div>
			<div class="row">
        	
			<c:forEach var="city" items="${cities}">
			<c:if test="${city.national eq '국내'}">
        	<div class="col-lg-4 col-xl-4 d-flex">
        		<div class="pricing-entry rounded d-flex ftco-animate">
        			<a href="tourList?id=${city.id}"><img class="img" src="${city.image}" style="width:180px; height:226px"></a>
        			<div class="desc p-4">
	        			<div class="d-md-flex text align-items-start">
	        				<h3><span>${city.name}</span></h3>
	        			</div>
	        			<div class="d-block">
	        				<p>주요 명소 ☞ <br/> ${city.content}</p>
	        			</div>
        			</div>
        		</div>
        	</div>
        	</c:if>
        	</c:forEach>
 
        </div>
			</div>
		</section>


		<section class="ftco-section ftco-menu bg-light" id="oversea">
				<div class="container">
					<div class="row justify-content-center mb-5 pb-3">
			  <div class="col-md-7 heading-section text-center ftco-animate">
				<h2 style="color: black;">해외 여행지</h2>
				<hr/>
			  </div>
			</div>
				<div class="row">
				<c:forEach var="city" items="${cities}">
				<c:if test="${city.national eq '해외'}">
					<div class="col-lg-4 col-xl-4 d-flex">
						<div class="pricing-entry rounded d-flex ftco-animate">
							<a href="tourList?id=${city.id}"><img class="img" src="${city.image}" style="width:180px; height:226px"></a>
        					<div class="desc p-4">
	        					<div class="d-md-flex text align-items-start">
	        						<h3><span>${city.name}</span></h3>
	        					</div>
	        					<div class="d-block">
	        						<p>주요 명소 ☞ <br/> ${city.content}</p>
	        					</div>
							</div>
						</div>
					</div>
				</c:if>
				</c:forEach>
				
			</div>
				</div>
			</section>
<%@include file="include/footer.jsp" %>
    </body>
    </html>