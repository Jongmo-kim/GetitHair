<%@page import="style.model.vo.Style"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Style> list = (ArrayList<Style>)request.getAttribute("list");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스타일 페이지</title>
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
      height: 100%;
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
	.menu li{
    	list-style-type : none;
    	float: left;
    	width: 150px;
    	height: 30px;
    	border: 1px solid black;
    }
    .menu a{
    	display: inline-block;
    	width: 100%;
    	height: 100%;
    }
    .style-sub{
    	display: none;
    }
    .content{
    	float: left;
    }
    .mid{
    	overflow: hidden;
    	text-align: center;
    	width : 70%;
    	margin : 0 auto;
    }
    img{
    	width: 250px;
    	height: 250px;
    }
    .tab{
    	float: left;
    	display: flex;
    	flex-direction : column;
    }
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section>
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
			  <div class="swiper-slide"><img src="/img/style/color/밀크브라운.jpg"></div>
			  <div class="swiper-slide"><img src="/img/style/color/밤비브라운.jpg"></div>
			  <div class="swiper-slide"><img src="/img/style/color/솜브레.jpg"></div>
			  <div class="swiper-slide"><img src="/img/style/color/애쉬블루.jpg"></div>
			  <!-- <%for(Style s : list) {%>
				<div class="swiper-slide"><img src="<%=s.getStyleImg()%>"></div>
			  <%} %> -->
		    </div>
		    <!-- Add Arrows -->
		    <div class="swiper-button-next"></div>
		    <div class="swiper-button-prev"></div>
		</div>
		<div class="mid">
			<div class="content">
				<h1>스타일</h1>
				<form action="/searchStyle" method="get">
					<input type="search" name="searchStyle" placeholder="스타일로 검색">
					<button type="submit">검색</button>
				</form>
				<div class="menu">
					<ul style="overflow:hidden;">
						<li><a href="#" name="cut">커트</a></li>
						<li><a href="#" name="perm">파마</a></li>
						<li><a href="#" name="color">염색</a></li>
						<li><a href="#" name="etc">기타</a></li>
					</ul>
				</div>
				<div class="style-sub cut">
					<input type="checkbox" name="long">롱
					<input type="checkbox" name="medium">미디엄
					<input type="checkbox" name="bob">단발
					<input type="checkbox" name="short">숏
					<h1>cut</h1>
					<img src="/img/style/cut/레이어드컷.jpg">
					<img src="/img/style/cut/리프컷.jpg">
					<img src="/img/style/cut/샌드컷.jpg">
					<img src="/img/style/cut/허쉬컷.jpeg">
				</div>
				<div class="style-sub perm">
					<input type="checkbox" name="long">롱
					<input type="checkbox" name="medium">미디엄
					<input type="checkbox" name="bob">단발
					<input type="checkbox" name="short">숏
					<h1>perm</h1>
					<%for(Style s : list) {%>
						<%if(s.getStyleType().equals("perm")){ %>
							<img src="<%=s.getStyleImg()%>">
						<%} %>
					<%} %>
				</div>
				<div class="style-sub color">
					<input type="checkbox" name="long">롱
					<input type="checkbox" name="medium">미디엄
					<input type="checkbox" name="bob">단발
					<input type="checkbox" name="short">숏
					<h1>color</h1>
					<%for(Style s : list) {%>
						<%if(s.getStyleType().equals("color")){ %>
							<img src="<%=s.getStyleImg()%>">
						<%} %>
					<%} %>
				</div>
				<div class="style-sub etc">
					<input type="checkbox" name="clinic">클리닉
					<input type="checkbox" name="dry">드라이
					<h1>etc</h1>
					<%for(Style s : list) {%>
						<%if(s.getStyleType().equals("etc")){ %>
							<img src="<%=s.getStyleImg()%>">
						<%} %>
					<%} %>
				</div>
			</div>
			<div class="tab">
				<button name="place">지역</button>
				<button name="style">스타일</button>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</section>
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

	  <!-- Initialize Swiper -->
	  <script>
	  	var swiper = new Swiper('.swiper-container', {
	      slidesPerView: 4,
	      spaceBetween: 0,
	      slidesPerGroup: 4,
	      loop: true,
	      loopFillGroupWithBlank: true,
	      autoplay: {
		        delay: 3000,
		        disableOnInteraction: false,
		      },
	      navigation: {
	        nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev',
	      },
	    });
		$(function(){
			$(".menu li:first-child>a").click();
		});
		$(".menu a").click(function(){
			$(".style-sub").hide();
			var name = $(this).attr("name");
			$("."+name).show();
		});
		$(".tab>button:first-child").click(function(){
			location.href="/hairshop";
		});
	  </script>
</body>
</html>