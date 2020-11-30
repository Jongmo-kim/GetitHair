<%@page import="hairshop.model.vo.Hairshop"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Hairshop> list = (ArrayList<Hairshop>)request.getAttribute("list");
    	int totalCount = (Integer)request.getAttribute("totalCount");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<style>
	.swiper-pagination{
		position: abosolute;
		top: 420px;
		height: 10px;
	}
    html,
    body {
      position: relative;
      height: 100%;
    }

    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper-container {
      width: 100%;
      height: 400px;

    }
    .swiper-container1 {
      width: 100%;
      height: 400px;
      overflow: hidden;

    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    input[type="search"]{
    	width : 700px;
    	height: 50px;
    	border-radius : 10px;
    	outline: none;
    }
    .content{
    	float: left;
    	width: 90%;
    }
    .tab{
    	float: left;
    	display: flex;
    	flex-direction : column;
    	width: 10%;
    	height: 100%;
    	margin-top: 20px;
    }
    .mid{
    	overflow: hidden;
    	width : 80%;
    	margin : 0 auto;
    }
    .swiper-slide img{
    	width: 100%;
    }
    .swiper-slide h1{
    	position: absolute;
    	top: 40px;
    	left: 100px;
    	color: white;
    	font-size: 50px;
    	text-shadow: 5px 5px 10px black;
    }
    .shop{
    	display: flex;
    	flex-direction: row;
    }
    .mid>form{
    	text-align: center;
    	margin-top: 40px;
    	margin-bottom: 20px;
    }
    .style img{
    	width: 250px;
    	height: 250px;
    }
    .tab a{
    	display : inline-block;
    	width: 100%;
    	text-decoration : none;
    	height: 50px;
    	color: black;
    	font-size: 20px;
    }
    .tab li{
    	list-style-type: none;
    }
    .tab ul{
    	margin: 0;
    	padding: 0;
    }
    #hairshopList img{
    	width: 100px;
    	height: 100px;
    }
    #hairshopList .glyphicon{
    	color: lightgray;
    }
    #hairshopList>table{
    	margin: 50px;
    	height: 120px;
    	width: 300px;
    }
    body button{
    	height: 50px;
    	width : 80px;
    	border: none;
    	border-radius: 10px;
    	background: #D9ABA0;
    	color: white;
    }
    .long{
    	display: none;
    	position: relative;
    }
    .short{
    	text-align: center;
    }
    .long>a{
    	position: absolute;
    	left: 200px;
    	top: 0px;
    }
    #hairshopList{
    	display: flex;
    	flex-direction: row;
    	height: 300px;
    	align-items: center;
    }
    .shop{
    	overflow-x: scroll;
    }
    .shop::-webkit-scrollbar {
    	height: 5px;
  	}
  	.shop::-webkit-scrollbar-thumb {
	    background-color: #260101;
	    border-radius: 5px;
	 }
	 .shop::-webkit-scrollbar-track {
	    background-color: lightgrey;
	    border-radius: 5px;
	 }
	 .type{
	 	height: 600px;
	 	display: flex;
	 	flex-direction: row;
	 	justify-content: center;
	 	align-items: center;
	 	text-align: end;
	 }
	 .type img{
	 	width: 400px;
	 	margin: 50px;
	 }
</style>
<title>헤어샵 메인페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section>
		<div class="swiper-container1">
		    <div class="swiper-wrapper">
		      <div class="swiper-slide"><img src="/img/main/3.jpg"><h1>11월 신규 매장 이벤트</h1></div>
		      <div class="swiper-slide"><img src="/img/main/1.jpeg"><h1>커트만 예약해도 50% 할인 쿠폰 증정!</h1></div>
		      <div class="swiper-slide"><img src="/img/main/6.jpg"><h1>미리 메리 크리스마스 이벤트</h1></div>
		    </div>
		    <!-- Add Pagination -->
		    <div class="swiper-pagination"></div>
		</div>
		<div class="mid">
			<form action="/searchHairshop" method="get">
				<input type="search" name="searchShop" placeholder="헤어샵, 지역으로 검색">
				<button type="submit">검색</button>
			</form>
			<div class="tab short">
				<ul>
					<li><a style="cursor:pointer;"><img src="/img/main/menu.png"></a></li>
				</ul>
			</div>
			<div class="tab long">
				<ul>
					<li><a href="#">지역 별</a></li>
					<li><a href="/style">스타일</a></li>
				</ul>
				<a style="cursor:pointer;"><img src="/img/main/x.png"></a>
			</div>
			<div class="content">
				<div class="style">
					<h2>BEST 스타일</h2>
					<div class="swiper-container">
					    <div class="swiper-wrapper">
					      <div class="swiper-slide"><img src="/img/style/cut/레이어드컷.jpg"></div>
					      <div class="swiper-slide"><img src="/img/style/cut/리프컷.jpg"></div>
					      <div class="swiper-slide"><img src="/img/style/cut/샌드컷.jpg"></div>
					      <div class="swiper-slide"><img src="/img/style/cut/허쉬컷.jpeg"></div>
					      <div class="swiper-slide"><img src="/img/style/perm/빌드펌.jpg"></div>
						  <div class="swiper-slide"><img src="/img/style/perm/레인펌.jpg"></div>
						  <div class="swiper-slide"><img src="/img/style/perm/엘리자벳펌.jpg"></div>
			  			  <div class="swiper-slide"><img src="/img/style/perm/플라워펌.jpg"></div>
					    </div>
					    <!-- Add Arrows -->
					    <div class="swiper-button-next"></div>
					    <div class="swiper-button-prev"></div>
					</div>
				</div>
				<h2>BEST 헤어샵</h2>
				<div class="shop">
					<div id="hairshopList"></div>
					<div style="text-align:center;">
						<button currentCount="0" value="" totalCount="<%=totalCount %>" id="more-btn">더보기</button>
					</div>
				</div>
				<div class="type">
					<div>
						<h1 style="font-size: 50px;">최근 인기를 끌고 있는</h1>
						<h1 style="font-size: 50px;">'리프컷'</h1>
						<br>
						<p>겨울에 하면 시크, 도도한 분위기가 연출되는</p>
						<p>턱 선 기장의 귀를 덮는 오버 가르마의 숏컷 스타일</p>
						<p>직선의 라인이 턱 선을 감싸고 옆 얼굴을 커버하여 시크하고 이지적인 무드</p>
					</div>
					<div><img src="/img/style/cut/리프컷.jpg"></div>
				</div>
				<div class="type">
					<div><img src="/img/style/perm/엘리자벳펌.jpg"></div>
					<div style="text-align:left;">
						<h1 style="font-size: 50px;">우아한 감성 가득</h1>
						<h1 style="font-size: 50px;">'엘리자벳펌'</h1>
						<br>
						<p>가을에 무드한 분위기를 위한</p>
						<p>가슴 위 기장의 솔리드 한 롱헤어 퍼머로</p>
						<p>선명한 실루엣이 특징이며 우아하고 고급스러운 이미지를 강조하는 스타일</p>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</section>
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

	  <!-- Initialize Swiper -->
	  <script>
	    var swiper = new Swiper('.swiper-container1', {
	   	  slidesPerView: 1,
	      spaceBetween: 30,
	      centeredSlides: true,
	      autoplay: {
	        delay: 3000,
	        disableOnInteraction: false,
	      },
	      loop: true,
	      pagination: {
	        el: '.swiper-pagination',
	        clickable: true,
	      }
	    });
	    var swiper = new Swiper('.swiper-container', {
	      slidesPerView: 4,
	      spaceBetween: 0,
	      slidesPerGroup: 4,
	      loop: true,
	      loopFillGroupWithBlank: true,
	      navigation: {
	        nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev',
	      },
	    });
	    $(function(){
			hairshopMore(1);
		});
		$("#more-btn").click(function(){
			hairshopMore($(this).val());
		});
		function hairshopMore(start){//더보기(시작번호). 처음에는 1번 세팅
			$.ajax({
				url : "/hairshopMore",
				data : {start:start},
				type : "post",
				dataType : "json",//데이터 타입 json인 걸 여기서 해도 됨.아님 서블릿에서
				success : function(data){
					var html ="";
					for(var i in data){
						var h = data[i];
						html += "<table style='cursor:pointer;'><tr><th rowspan='4'><img src = "+h.shopImg+"></th>";
						html += "<td colspan='2' style='font-size:20px;'>"+h.shopName+"</td></tr>";
						html += "<input type='hidden' name='shopNo' value="+h.shopNo+">";
						html += "<tr><td><span class='glyphicon glyphicon-star'></span> <span>"+h.shopRate+"</span></td>";
						html += "<td><span class='glyphicon glyphicon-heart'></span> <span>"+h.shopLikes+"</span></td></tr>";
						html += "<tr><td colspan='2' style='font-size:15px;'>"+h.shopAddr+"</td></tr>";
						html += "<tr><td colspan='2' style='font-size:15px;'>"+h.shopOpen+" ~ "+h.shopClose+"</td></tr></table>";
					}
					$("#hairshopList").append(html);
					$("#more-btn").val(Number(start)+10);
					//현재 몇번까지 가지고 왔는지 체크
					var currCount = $("#more-btn").attr("currentCount");
					$("#more-btn").attr("currentCount",Number(currCount)+data.length);
					currCount = $("#more-btn").attr("currentCount");
					var totalCount = $("#more-btn").attr("totalCount");
					if(currCount == totalCount){
						$("#more-btn").attr("disable",true)//버튼 비활성화
						$("#more-btn").css("cursor","not-allowed");//버튼 안 눌리게
					}
				}
			});
		}
		$(document).on("click","table",function(){//문서에서 테이블 찾아서 이벤트 걸어줌. 테이블이 동적으로 만들어진거라
			var shopNo = $(this).children().find("input").val();
			location.href="/hairshopDetail?shopNo="+shopNo;
		});
		$(".short a").click(function(){
			$(".short").hide();
			$(".long").show();
		});
		$(".long a").click(function(){
			$(".long").hide();
			$(".short").show();
		});
	  </script>
</body>
</html>