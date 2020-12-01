<%@page import="common.DebugTemplate"%>
<%@page import="hairshop.model.vo.Hairshop"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Hairshop> list = (ArrayList<Hairshop>)request.getAttribute("list");
    	String searchShop = (String)request.getAttribute("searchShop");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=boyoclpts9&submodules=geocoder"></script>
<title>헤어샵 검색</title>
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
      height: 400px;

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
    .swiper-slide img{
    	width: 100%;
    }
    .swiper-slide h1{
    	position: absolute;
    	top: 40px;
    	left: 100px;
    	color: white;
    	font-size: 50px;
    	text-shadow: 5px 5px 10px black;
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
    	background: #D9ABA0;
    	color: white;
    }
    .mid{
    	width : 70%;
    	margin : 0 auto;
    	border: 1px solid black;
    	overflow: hidden;
    }
    .content{
    	width: 40%;
    	float: left;
    }
    .content table{
    	margin : 0 auto;
    }
    #map{
    	float: left;
    	width: 60%;
    	height: 500px;
    }
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section>
		<div class="swiper-container">
		    <div class="swiper-wrapper">
		      <div class="swiper-slide"><img src="/img/main/3.jpg"><h1>12월 신규 매장 이벤트</h1></div>
		      <div class="swiper-slide"><img src="/img/main/1.jpeg"><h1>커트만 예약해도 50% 할인 쿠폰 증정!</h1></div>
		      <div class="swiper-slide"><img src="/img/main/6.jpg"><h1>미리 메리 크리스마스 이벤트</h1></div>
		    </div>
		    <!-- Add Pagination -->
		    <div class="swiper-pagination"></div>
		</div>
		<div class="mid">
			<form action="/searchHairshop" method="get">
				<input type="search" name="searchShop" value="<%=searchShop%>">
				<button type="submit">검색</button>
			</form>
			<div class="content">
			<%if(list.size() != 0){ %>
					<%for(Hairshop shop : list){ %>
						<table style='cursor:pointer;'>
							<tr>
								<th rowspan="3"><img src="/"></th>
								<td style="font-size:20px;"><a href="/hairshopDetail?shopNo=<%=shop.getShopNo() %>"><%=shop.getShopName() %></a></td>
							</tr>
							<tr>
								<td style='font-size:15px;'><%=shop.getShopAddr() %></td>
							</tr>
							<tr>
								<td style='font-size:15px;'><%=shop.getShopOpen() %> ~ <%=shop.getShopClose() %></td>
							</tr>
						</table>
					<%} %>
			<%}else{ %>
				<h1>검색하신 헤어샵이 존재하지 않습니다.</h1>
				<a href="/hairshop">메인으로</a>
			<%} %>
			</div>
			<div id="map"></div>
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
	        delay: 3000,
	        disableOnInteraction: false,
	      },
	      loop: true,
	      pagination: {
	        el: '.swiper-pagination',
	        clickable: true,
	      }
	    });
	    
	    //네이버 지도
	    window.onload=function(){
			//아무 값도 지정하지 않고 지도 객체를 불러오면 서울 시청 중심으로 불러와짐
			//var map = new naver.maps.Map("map");
			var map = new naver.maps.Map("map",{
				center : new naver.maps.LatLng(37.533807,126.896772),//지도 중심 좌표 설정
				zoom : 17,//지도 확대 크기
				zoomControl : true,//줌 컨트롤러
				zoomControlOptions : {
					position : naver.maps.Position.TOP_RIGHT,//줌 컨트롤러 위치 설정. 우측 상단 위치
					style : naver.maps.ZoomControlStyle.SMALL
				}
			});
			//마커 추가
			var marker = new naver.maps.Marker({
				position : new naver.maps.LatLng(37.533807,126.896772),//마커 위치
				map : map//어떤 지도에 마커를 추가할지
			});
			//최초 중심지 주소
			var contentString = [
				'<div class="iw_inner">',
				'	<h3>KH정보교육원</h3>',
				'	<p>서울시 영등포구 선유2로 57 이레빌딩 19F, 20F</p>',
				'</div>'
			].join('');//string 4개 짜리 배열. 하나의 string으로 합쳐짐
			//(마커 누르면 주소 나오게)
			var infoWindow = new naver.maps.InfoWindow();//지도 위에 뜨는 정보창
			naver.maps.Event.addListener(marker,'click',function(e){
				if(infoWindow.getMap()){//지금 지도에 infoWindow가 열려있으면 true 반환. 열려있으면 닫고 열려있지 않으면 열리게
					infoWindow.close();//현재 정보창이 열려있으면 열려있는 정보창 닫기
				}else{
					infoWindow = new naver.maps.InfoWindow({
						content : contentString
					});
					infoWindow.open(map,marker);
				}
			});
		}
	   </script>
	    
</body>
</html>