<%@page import="hairshop.model.vo.Hairshop"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Hairshop hr = (Hairshop)request.getAttribute("hs");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤어샵 상세보기</title>
	<!-- Link Swiper's CSS -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<!-- 구글 아이콘 링크 -->
	 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<!-- 스타일 부분 -->
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style media="screen">
    .datePage{
        display: block;
        margin: 0 auto;
    }
    .navi>ul>li{
        list-style-type: none;
        float: left;
        display: block;
    }
    
</style>


</head>
<body>
	<!-- 헤더 -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="slideImg">
        <!-- Swiper -->
        <div class="swiper-container" style="width: 1000px; height: 700px;">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="/img/hairshop/hair1.png" style="width: 1000px; height: 700px;"></div>
                <div class="swiper-slide"><img src="/img/hairshop/hair2.png" style="width: 1000px; height: 700px;"></div>
                <div class="swiper-slide"><img src="/img/hairshop/hair3.png" style="width: 1000px; height: 700px;"></div>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
        </div>
    </div>
    
    <form action="reserVation">
    <div class="datePage" style="width: 1000px; height: 1000px;">
        <br>
        <hr>
        <h3 style="font-weight: bold">우당탕탕헤어샵</h3>   <!-- 값 들어가야하는부분   -->
        <p style="font-size: 14px"><span class="material-icons" style="font-size: 14px">calendar_today</span> 영업시간<span> : 시간</span></p>
        <h4 style="font-weight: bold">디자이너</h4>
        <button id="reserVation" name="reserVation">예약하기</button>
    </div>
    </form>
    
	<!-- Swiper JS -->
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper('.swiper-container', {
      pagination: {
        el: '.swiper-pagination',
        dynamicBullets: true,
      },
    });
	
		
	</script>
</body>
</html>