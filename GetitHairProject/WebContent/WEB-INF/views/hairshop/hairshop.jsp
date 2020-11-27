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
      width: 80%;
      height: 300px;

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
    	overflow: hidden;
    	width: 80%;
    }
    .tab{
    	float: left;
    	display: flex;
    	flex-direction : column;
    	width: 20%;
    	height: 100%;
    	background-color : beige;
    	border-right: 5px solid #59362E;
    }
    .mid{
    	overflow: hidden;
    	width : 80%;
    	margin : 0 auto;
    	border: 1px solid black;
    }
    .swiper-slide>img{
    	width: 100%;
    }
    .swiper-slide>h1{
    	position: absolute;
    	top: 40px;
    	left: 100px;
    	color: white;
    	font-size: 50px;
    	text-shadow: 5px 5px 10px black;
    }
    .shop, .style{
    	float: left;
    	width: 50%;
    }
    .mid>form{
    	text-align: center;
    	margin-top: 20px;
    	margin-bottom: 20px;
    }
    .style>img{
    	width: 250px;
    	height: 250px;
    }
    .tab a{
    	display : inline-block;
    	width: 100%;
    	text-decoration : none;
    }
    .tab li{
    	list-style-type: none;
    }
    #hairshopList img{
    	width: 100px;
    	height: 100px;
    }
    .glyphicon{
    	color: lightgray;
    }
    #hairshopList>table{
    	margin: 50px;
    	height: 120px;
    }
    .mid>form>button{
    	height: 50px;
    	width : 80px;
    	border: none;
    	border-radius: 10px;
    	background: #D9ABA0;
    	color: white;
    }
</style>
<title>헤어샵 메인페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section>
		<div class="swiper-container">
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
			<div class="tab">
				<ul>
					<li><a href="#">지역 별</a></li>
					<li><a href="/style">스타일</a></li>
				</ul>
			</div>
			<div class="content">
				<div class="shop">
					<h2>헤어샵</h2>
					<div id="hairshopList"></div>
					<div style="text-align:center;">
						<button currentCount="0" value="" totalCount="<%=totalCount %>" id="more-btn">더보기</button>
					</div>
				</div>
				<div class="style">
					<h2>인기있는 스타일</h2>
					<img src="/img/style/perm/빌드펌.jpg">
					<p class="caption">빌드펌</p>
					<img src="/img/style/perm/레이어드 펌.jpg">
					<p class="caption">레이어드펌</p>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</section>
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

	  <!-- Initialize Swiper -->
	  <script>
	    var swiper = new Swiper('.swiper-container', {
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
					$("#more-btn").val(Number(start)+5);
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
	  </script>
</body>
</html>