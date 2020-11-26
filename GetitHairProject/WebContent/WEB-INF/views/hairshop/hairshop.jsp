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
    	margin-bottom : 20px;
    }
    .content table{
    	margin: 0 auto;
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
		<form action="/hairshopSearch" method="get" id="search">
			<input type="search" name="search" placeholder="헤어샵 이름으로 검색">
			<button type="submit">검색</button>
		</form>
		<div class="content">
			<h1>지역</h1>
			<div id="hairshopList"></div>
		</div>
		<div style="text-align:center;">
			<button currentCount="0" value="" totalCount="<%=totalCount %>" id="more-btn">더보기</button>
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
						html += "<table style='cursor:pointer;'><tr><th rowspan='3'><img src = "+h.shopImg+"></th>";
						html += "<td>"+h.shopName+"</td>";
						html += "<input type='hidden' name='shopNo' value="+h.shopNo+">";
						html += "<td><span>"+h.shopRate+"</span><span>"+h.shopLikes+"</span></td></tr>";
						html += "<tr><td colspan='2'>"+h.shopAddr+"</td></tr>";
						html += "<tr><td colspan='2'>"+h.shopOpen+" ~ "+h.shopClose+"</td></tr></table>";
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
	  </script>
</body>
</html>