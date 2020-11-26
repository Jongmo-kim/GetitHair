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
    	width : 800px;
    	height: 50px;
    }
    .content table{
    	margin: 0 auto;
    }
    .content{
    	float: left;
    	width: 70%;
    }
    .tab{
    	float: left;
    	display: flex;
    	flex-direction : column;
    }
    .mid{
    	overflow: hidden;
    	text-align: center;
    	width : 70%;
    	margin : 0 auto;
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
			<div class="content">
				<h1>지역</h1>
				<form action="/searchHairshop" method="get">
					<input type="search" name="searchShop" placeholder="헤어샵 이름으로 검색">
					<button type="submit">검색</button>
				</form>
				<div id="hairshopList"></div>
				<div style="text-align:center;">
					<button currentCount="0" value="" totalCount="<%=totalCount %>" id="more-btn">더보기</button>
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
		$(".tab>button:last-child").click(function(){
			location.href="/style";
		});
	  </script>
</body>
</html>