<%@page import="style.model.vo.Style"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Style> list = (ArrayList<Style>)request.getAttribute("list");
    	String searchStyle = (String)request.getAttribute("searchStyle");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스타일로 검색</title>
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
    img{
    	width: 250px;
    	height: 250px;
    }
    input[type="search"]{
    	width : 700px;
    	height: 50px;
    	border-radius : 10px;
    	outline: none;
    }
    .mid>form{
    	text-align: center;
    	margin-top: 40px;
    	margin-bottom: 20px;
    }
    body button{
    	height: 50px;
    	width : 80px;
    	border: none;
    	border-radius: 10px;
    	background: #8C2E40;
    	color: white;
    }
    button:hover{
    	background: #D9ABA0;
    	transition-duration: 0.2s;
    }
    .mid{
    	width : 70%;
    	margin : 0 auto;
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
		    </div>
		    <!-- Add Arrows -->
		    <div class="swiper-button-next"></div>
		    <div class="swiper-button-prev"></div>
		</div>
		<div class="mid">
			<form action="/searchStyle" method="get">
				<input type="search" name="searchStyle" value="<%=searchStyle%>">
				<button type="submit">검색</button>
			</form>
			<div class="content">
			<%if(list.size() != 0){ %>
					<%for(Style style : list){ %>
						<div class="styleList">
							<!-- <img src = > -->
							<a href="/styleDetail?styleNo=<%=style.getStyleNo() %>"><%=style.getStyleName() %></a>
							<%=style.getStyleLikes() %>
						</div>
					<%} %>
			<%}else{ %>
				<h1>검색하신 스타일이 존재하지 않습니다.</h1>
				<a href="/hairshop">메인으로</a>
			<%} %>
			</div>
		</div>
	</section>
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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
	</script>
</body>
</html>