<%@page import="image.model.vo.Image"%>
<%@page import="style.model.vo.Style"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Style> stylelist = (ArrayList<Style>)request.getAttribute("stylelist");
    	ArrayList<Image> imglist = (ArrayList<Image>)request.getAttribute("imglist");
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
    .menu{
    	margin: 30px;
    }
	.menu li{
    	list-style-type : none;
    	float: left;
    	width: calc(100%/4);
    	height: 50px;
    	line-height: 50px;
    }
    .menu ul{
    	margin : 0;
    	padding: 0;
    }
    .menu a{
    	display: inline-block;
    	width: 100%;
    	height: 100%;
    	color: #260101;
    }
    .menu a:hover{
    	text-decoration: none;
    	font-weight: bold;
    }
    .style-sub{
    	display: none;
    	overflow: hidden;
    }
    .mid{
    	text-align: center;
    	width : 70%;
    	margin : 0 auto;
    	margin-bottom: 50px;
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
    	margin-bottom: 40px;
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
    .content{
    	width: 100%;
    }
    .style-sub>h1{
    	margin: 30px;
    }
    label{
    	margin-right: 30px;
    	margin-left: 5px;
    }
    .style-sub>div{
    	width: 250px;
    	margin: 60px;
    	float: left;
    	cursor: pointer;
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
					<input type="search" name="searchStyle" placeholder="스타일로 검색">
					<button type="submit">검색</button>
			</form>
			<div class="content">
				<div class="menu">
					<ul style="overflow:hidden;">
						<li><a style="cursor:pointer" name="cut">커트</a></li>
						<li><a style="cursor:pointer" name="perm">파마</a></li>
						<li><a style="cursor:pointer" name="color">염색</a></li>
						<li><a style="cursor:pointer" name="etc">기타</a></li>
					</ul>
				</div>
				<div class="style-sub cut">
					<input type="checkbox" name="long" id="long"><label for="long">롱</label>
					<input type="checkbox" name="medium" id="medium"><label for="medium">미디엄</label>
					<input type="checkbox" name="bob" id="bob"><label for="bob">단발</label>
					<input type="checkbox" name="short" id="short"><label for="short">숏</label>
					<h1>cut</h1>
					<%for(Image i : imglist) { %>
						<%for(Style s : stylelist) {%>
							<%if(s.getStyleNo() == i.getImgTypeNo()) {%>
								<%if(s.getStyleType().equals("cut")){ %>
									<div>
										<img src="/upload/style/<%=i.getFilepath() %>">
										<input type="hidden" value="<%=s.getStyleNo()%>">
										<p style="font-size:24px;"><%=s.getStyleName() %></p>
									</div>
								<%} %>
							<%} %>
						<%} %>
					<%} %>
				</div>
				<div class="style-sub perm">
					<input type="checkbox" name="long" id="long"><label for="long">롱</label>
					<input type="checkbox" name="medium" id="medium"><label for="medium">미디엄</label>
					<input type="checkbox" name="bob" id="bob"><label for="bob">단발</label>
					<input type="checkbox" name="short" id="short"><label for="short">숏</label>
					<h1>perm</h1>
					<%for(Image i : imglist){ %>
						<%for(Style s : stylelist) {%>
							<%if(s.getStyleNo() == i.getImgTypeNo()) {%>
								<%if(s.getStyleType().equals("perm")){ %>
									<div>
										<img src="/upload/style/<%=i.getFilepath() %>">
										<input type="hidden" value="<%=s.getStyleNo()%>">
										<p style="font-size:24px;"><%=s.getStyleName() %></p>
									</div>
								<%} %>
							<%} %>
						<%} %>
					<%} %>
				</div>
				<div class="style-sub color">
					<input type="checkbox" name="long" id="long"><label for="long">롱</label>
					<input type="checkbox" name="medium" id="medium"><label for="medium">미디엄</label>
					<input type="checkbox" name="bob" id="bob"><label for="bob">단발</label>
					<input type="checkbox" name="short" id="short"><label for="short">숏</label>
					<h1>color</h1>
					<%for(Image i : imglist){ %>
						<%for(Style s : stylelist) {%>
							<%if(s.getStyleNo() == i.getImgTypeNo()) {%>
								<%if(s.getStyleType().equals("color")){ %>
									<div>
										<img src="/upload/style/<%=i.getFilepath() %>">
										<input type="hidden" value="<%=s.getStyleNo()%>">
										<p style="font-size:24px;"><%=s.getStyleName() %></p>
									</div>
								<%} %>
							<%} %>
						<%} %>
					<%} %>
				</div>
				<div class="style-sub etc">
					<input type="checkbox" name="clinic" id="clinic"><label for="clinic">클리닉</label>
					<input type="checkbox" name="dry" id="dry"><label for="dry">드라이</label>
					<h1>etc</h1>
					<%for(Image i : imglist){ %>
						<%for(Style s : stylelist) {%>
							<%if(s.getStyleNo() == i.getImgTypeNo()) {%>
								<%if(s.getStyleType().equals("etc")){ %>
									<div>
										<img src="/upload/style/<%=i.getFilepath() %>">
										<input type="hidden" value="<%=s.getStyleNo()%>">
										<p style="font-size:24px;"><%=s.getStyleName() %></p>
									</div>
								<%} %>
							<%} %>
						<%} %>
					<%} %>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
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
			$(".menu a").parent().css("background","#fff");
			$(".menu a").css("color","#260101");
			$(".style-sub").hide();
			var name = $(this).attr("name");
			$("."+name).show();
			$(this).parent().css("background","#260101");
			$(this).css("color","#fff");
			$(this).css("font-weight","normal");
		});
		$(".tab>button:first-child").click(function(){
			location.href="/hairshop";
		});
		$(function(){
	  		$(".style-sub img").click(function(){
	  			var styleNo = $(this).next().val();
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