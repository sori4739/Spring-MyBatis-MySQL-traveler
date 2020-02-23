<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="include/nav.jsp"%>
<!-- END nav -->
<script>
function loginForm(){
	window.open("/user/loginForm","","width=350, height=570,top =110,left=600;");		
};
</script>
<div class="hero-wrap" style="background-color: #2B96ED;"
	style="height: 300px;">
	b
	<div class="overlay" style="height: 300px;"></div>
	<div class="container"></div>
</div>

<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3"
			style="margin-bottom: 1.2rem !important">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span class="subheading">${city.subtitle}</span>
				<h2 class="mb-4">${city.name}</h2>
			</div>
		</div>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">

			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="row d-flex owl-carousel">
						<c:forEach var="i" begin="0" end="4">
							<div
								class="col-md pr-md-1 d-flex align-self-stretch ftco-animate">
								<div class="media block-6 services py-4 d-block text-center">
									<div class="d-flex justify-content-center">
										<div
											class="icon d-flex align-items-center justify-content-center">
											<img src="${tour.get(i).image}"
												style="width: 100%; height: 100%; border-radius: 100%;"
												alt="">
										</div>
									</div>
									<a onClick="showBlogListByFetch(${tour.get(i).id})"
										style="text-decoration: none; cursor: pointer;">
										<div class="media-body">
											<h3 class="heading mb-3">${tour.get(i).name}</h3>
										</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

				<div class="carousel-item">
					<div class="row d-flex owl-carousel">
						<c:forEach var="i" begin="5" end="9">
							<div
								class="col-md pr-md-1 d-flex align-self-stretch ftco-animate">
								<div class="media block-6 services py-4 d-block text-center">
									<div class="d-flex justify-content-center">
										<div
											class="icon d-flex align-items-center justify-content-center">
											<img src="${tour.get(i).image}"
												style="width: 100%; height: 100%; border-radius: 100%;"
												alt="">
										</div>
									</div>
									<div onClick="showBlogListByFetch(${tour.get(i).id})" style="text-decoration: none; cursor: pointer;" class="media-body">
										<h3 class="heading mb-3">${tour.get(i).name}</h3>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

			</div>

			<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#myCarousel"
				data-slide="next"> <span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</div>
</section>
<section class="ftco-section">
	<div class="container">
		<div class="row d-flex" id="blogList">
			<!--블로그 리스트 시작 -->
			<c:forEach var="mainBlog" items="${mainBlog}">
				<div class="col-md-4 ">
					<div class="blog-entry align-self-stretch">
						<a class="block-20 rounded"><img src="${mainBlog.previewImg}" width=100% height=100%></a>
						<div class="text mt-3">
							<h3 class="heading"	style="width: 100%; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">
								<a href="#">${mainBlog.title}</a>
							</h3>
							<p style="width: 100%; height: 150px; text-overflow: ellipsis; white-space: normal; overflow: hidden; color:black;">${mainBlog.description}</p>
							<a href="#" onclick="blogLink(${mainBlog.id})" class="btn btn-secondary rounded" style="width: 100%;">More info</a>
						</div>
					</div>
				</div>
			</c:forEach>
			<!--블로그 리스트 끝 -->
		</div>

	</div>
</section>
<%@include file="include/footer.jsp"%>
<script>
	function showBlogListByFetch(tourId){
			var url = 'blogList';

			fetch(url,{
				method:'post',
				body:tourId+""
				}).then(function(res){
					return res.json();
					}).then(function(res){
							console.log(res[0].title);
							var showBlogList = showList(res);

						})
		}



	 function showList(res){
		 $("#blogList").empty();
		 for(var a of res){
				var comment = "<div class='col-md-4'>";
				comment += "<div class='blog-entry align-self-stretch'>";
				comment += "<a class='block-20 rounded'><img src='"+a.previewImg+"' width=100% height=100%></a>";
				comment += "<div class='text mt-3'>";
				
				comment += "<h3 class='heading' style='width:100%; text-overflow:ellipsis; white-space:nowrap; overflow:hidden;'><a href='#'>"+a.title+"</a></h3>";
				comment += "<p style='width:100%; height:150px; text-overflow:ellipsis; white-space:normal; overflow:hidden; color:black;'>"+a.description+"</p>";
				comment += "<a href='#' onclick='blogLink("+a.id+")' class='btn btn-secondary rounded' style='width: 88%;'>More info</a>";
				
				comment +="<c:choose><c:when test='${not empty principal.user.id}'>";

				if(a.status == true){
				comment +="<a id='km_"+a.id+"' onclick='cancel("+a.id+","+a.tourId+")' class='meta-chat' style='float:right; cursor:pointer;'><i id='icon_"+a.id+"' class='fas fa-heart' style='font-size:35px;'></i></a>";
				} else {
				comment +="<a id='km_"+a.id+"' onclick='keep("+a.id+","+a.tourId+")' class='meta-chat' style='float:right; cursor:pointer;'><i id='icon_"+a.id+"' class='far fa-heart' style='font-size:35px;'></i></a>";
				}
				comment +="</c:when><c:otherwise>";
				comment +="<a href='#' onclick='loginForm()' class='meta-chat' style='float:right; '><i class='far fa-heart' style='font-size:35px;'></i></a>";
				comment +="</c:otherwise></c:choose>";
		
				
				comment += "</div></div></div>";

				
				$("#blogList").append(comment);
			}
		} 


		function keep(blogId,tourId){
			var url = 'keep';
			//$('#icon_'+blogId).attr('class','fas fa-heart');
						
			fetch(url,{
				method:'post',
				body:blogId+""
				}).then(function(res){
					var result=showBlogListByFetch(tourId);
					console.log(result);				
					showList(result);
					return res.json();
					}).then(function(res){
							console.log(res[0]);
							
						})
			
		}

		function cancel(blogId,tourId){
			var url = 'keep/cancel';
			//$('#icon_'+blogId).attr('class','far fa-heart');

			fetch(url,{
				method:'post',
				body:blogId+""
				}).then(function(res){
					var result=showBlogListByFetch(tourId);
					console.log(result);				
					showList(result);
					return res.json();
					}).then(function(res){
							console.log(res[0]);
							
						})
		}
		
	function blogLink(id){
			window.open("blogLink?id="+id,"","width=1020, height=1020, top=110,left=450;");
		}
</script>

</body>
</html>