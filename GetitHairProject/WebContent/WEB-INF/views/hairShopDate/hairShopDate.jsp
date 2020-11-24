<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤어샵 상세보기</title>
	<!-- Link Swiper's CSS -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	
	<!-- Swiper -->
	<div class="swiper-container" style="width: 800px; height: 500px;">
		<div class="swiper-wrapper">
			<div class="swiper-slide"><img src="/getithair/img/shopimg1.png"></div>
			<div class="swiper-slide"><img src="/getithair/img/shopimg1.png"></div>
			<div class="swiper-slide"><img src="/getithair/img/shopimg1.png"></div>
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
	</div>

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