<%@page import="image.model.vo.Image"%>
<%@page import="common.DebugTemplate"%>
<%@page import="hairshop.model.vo.Hairshop"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Hairshop> shoplist = (ArrayList<Hairshop>)request.getAttribute("shoplist");
    	ArrayList<Image> imglist = (ArrayList<Image>)request.getAttribute("imglist");
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
    .mid{
    	width : 70%;
    	margin : 0 auto;
    	margin-bottom: 50px;
    }
    .content{
    	height: 700px;
    	position: relative;
    }
    .hairshopList{
    	height: 700px;
    	width: 100%;
    	overflow-y: auto;
    	position: absolute;
    }
    .hairshopList img{
    	width: 100px;
    	height: 100px;
    }
    #map{
    	width: 900px;
    	height: 600px;
    	position: absolute;
    	top: 40px;
    	left: 450px;
    }
    .addr h3{
    	display: inline-block;
    }
    .addr>span{
    	margin-left: 10px;
    	margin-right: 10px;
    }
    .addr{
    	border-radius: 30px;
    	margin: 10px;
    	margin-top: -10px;
    }
    .hairshopList::-webkit-scrollbar {
    	width: 7px;
  	}
  	.hairshopList::-webkit-scrollbar-thumb {
	    background-color: #260101;
	    border-radius: 5px;
	 }
	 .hairshopList::-webkit-scrollbar-track {
	    background-color: lightgrey;
	    border-radius: 5px;
	 }
	 .hairshopList>table{
    	margin: 50px;
    	height: 120px;
    	width: 300px;
    	margin-left: 100px;
    	margin-top: 20px;
    }
    .noexist{
    	margin: 0 auto;
    	width: 650px;
    	margin-top: 50px;
    	margin-bottom: 50px;
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
			<%if(shoplist.size() != 0){ %>
				<div class="hairshopList">
					<%for(Hairshop shop : shoplist){ %>
						<%for(Image i : imglist) {%>
							<%if(shop.getShopNo() == i.getImgTypeNo()) {%>
								<table style='cursor:pointer;\'>
									<tr>
										<th rowspan="3"><img src="/upload/hairshop/<%=i.getFilepath()%>"></th>
										<td style="font-size:20px;"><input type="hidden" value="<%=shop.getShopNo() %>"><%=shop.getShopName() %></td>
									</tr>
									<tr>
										<td style='font-size:15px;'><%=shop.getShopAddr() %></td>
									</tr>
									<tr>
										<td style='font-size:15px;'><%=shop.getShopOpen() %> ~ <%=shop.getShopClose() %></td>
									</tr>
								</table>
							<%} %>
						<%} %>
					<%} %>
				</div>
				<div id="map"></div>
			<%}else{ %>
				<div class="noexist">
					<h1>검색하신 헤어샵이 존재하지 않습니다.</h1>
					<a href="/hairshop">메인으로</a>
				</div>
			<%} %>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
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
				'<div class="addr">',
				'<span class="glyphicon glyphicon-scissors"></span>',
				'<h3>홍길헤어</h3>',
				'	<p>서울 영등포구 당산동</p>',
				'</div>'
			].join('');//string 4개 짜리 배열. 하나의 string으로 합쳐짐
			//(마커 누르면 주소 나오게)
			var infoWindow = new naver.maps.InfoWindow();//지도 위에 뜨는 정보창
			naver.maps.Event.addListener(marker,'click',function(e){
				if(infoWindow.getMap()){//지금 지도에 infoWindow가 열려있으면 true 반환. 열려있으면 닫고 열려있지 않으면 열리게
					infoWindow.close();//현재 정보창이 열려있으면 열려있는 정보창 닫기
				}else{
					infoWindow = new naver.maps.InfoWindow({
						content : contentString,
						borderWidth: 3,
						disableAnchor: true
					});
					infoWindow.open(map,marker);
				}
			});
		}
	    $(document).on(".addr",function(){//얘 안됨
	    	$(".addr").parent().parent().css("border-radius","20px;");
		});
	    $("table").click(function(){
	    	var shopNo = $(this).children().find("input").val();
			location.href="/hairshopDetail?shopNo="+shopNo;
	    });
	    $("button:submit").click(function(){
			if($(this).prev().val() == ""){
				return false;
			}
		});
	  	//css 객체로 넣는 법({"top":"50px","right":"30px"})
	   </script>
	    
</body>
</html>