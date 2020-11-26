<%@page import="hairshop.model.vo.Hairshop"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Hairshop> list = (ArrayList<Hairshop>)request.getAttribute("list");
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
      width: 100%;
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
    input[type="search"]{
    	width : 800px;
    	height: 50px;
    }
    #search{
    	text-align: center;
    	margin-top: 20px;
    }
    .content>table{
    	margin: 0 auto;
    }
</style>
<title>헤어샵 메인페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section>
		<div class="swiper-container">
		    <div class="swiper-wrapper">
		      <div class="swiper-slide"><img src="/img/main/unnamed (2).jpg"></div>
		      <div class="swiper-slide"><img src="/img/main/unnamed (3).jpg"></div>
		      <div class="swiper-slide"><img src="/img/main/unnamed.jpg"></div>
		    </div>
		    <!-- Add Pagination -->
		    <div class="swiper-pagination"></div>
		    <!-- Add Arrows -->
		    <div class="swiper-button-next"></div>
		    <div class="swiper-button-prev"></div>
		</div>
		<%-- <form action="/search" method="get" id="search"> 요거 삭제함 --%>
		<form action="/hairshopSearch" method="get" id="search">
			<input type="search" name="search">
			<button type="submit">검색</button>
		</form>
		<div class="content">
			<%for(Hairshop shop : list){ %>
				<table border="1">
					<tr>
						<th rowspan="3"><img src = <%=shop.getShopImg() %>></th>
						<td><a href="/hairshopDetail?shopNo=<%=shop.getShopNo() %>"><%=shop.getShopName() %></a></td>
						<td><%=shop.getShopRate() %><%=shop.getShopLikes() %></td>
					</tr>
					<tr>
						<td colspan="2"><%=shop.getShopAddr() %></td>
					</tr>
					<tr>
						<td colspan="2"><%=shop.getShopOpen() %> ~ <%=shop.getShopClose() %></td>
					</tr>
				</table>
			<%} %>
		</div>
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
	        delay: 2500,
	        disableOnInteraction: false,
	      },
	      loop: true,
	      pagination: {
	        el: '.swiper-pagination',
	        clickable: true,
	      },
	      navigation: {
	        nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev',
	      },
	    });
	  </script>
</body>
</html>