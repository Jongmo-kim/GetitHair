<%@page import="image.model.vo.Image"%>
<%@page import="style.model.vo.Style"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Style> stylelist = (ArrayList<Style>)request.getAttribute("stylelist");
    	ArrayList<Image> imglist = (ArrayList<Image>)request.getAttribute("imglist");
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
    	background: #260101;
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
    .noexist{
    	margin: 0 auto;
    	width: 650px;
    	margin-top: 50px;
    	margin-bottom: 50px;
    	height: 500px;
    }
    .content{
    	text-align: center;
    	display: flex;
    	flex-direction: row;
    	flex-wrap: wrap;
    	width: 100%;
    }
    .styleList{
    	width: 250px;
    	margin: 60px;
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
			<%if(stylelist.size() != 0){ %>
					<%for(Style style : stylelist){ %>
						<%for(Image i : imglist){ %>
							<%if(i.getImgTypeNo() == style.getStyleNo()) {%>
								<div class="styleList" style="cursor:pointer">
									<img src = "/upload/style/<%=i.getFilepath()%>">
									<input type="hidden" value="<%=style.getStyleNo()%>">
									<p style="font-size:24px;"><%=style.getStyleName() %></p>
									<img src='/img/main/heart.png' style='width:20px; height:20px'><span><%=style.getStyleLikes() %></span>
								</div>
							<%} %>
						<%} %>
					<%} %>
			<%}else{ %>
				<div class="noexist">
					<h1>검색하신 스타일이 존재하지 않습니다.</h1>
					<a href="/hairshop">메인으로</a>
				</div>
			<%} %>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
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
	  	$(function(){
	  		$(".styleList").click(function(){
	  			var styleNo = $(this).find("input").val();//find가 이미 자식 찾는거
				location.href="/styleDetail?styleNo="+styleNo;
	  		});
		});
	  	$("button:submit").click(function(){
			if($(this).prev().val() == ""){
				return false;
			}
		});
	</script>
</body>
</html>