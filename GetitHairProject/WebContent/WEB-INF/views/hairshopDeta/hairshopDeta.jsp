<%@page import="image.model.vo.Image"%>
<%@page import="stylelist.model.vo.StyleTypeList"%>
<%@page import="stylelist.model.service.StylelistService"%>
<%@page import="stylelist.model.vo.Stylelist"%>
<%@page import="style.model.service.StyleService"%>
<%@page import="style.model.vo.Style"%>
<%@page import="shopprice.model.vo.ShopPrice"%>
<%@page import="reserve.model.service.ReserveService"%>
<%@page import="reserve.model.vo.Reserve"%>
<%@page import="likes.model.service.LikesService"%>
<%@page import="likes.model.vo.Likes"%>
<%@page import="designer.model.vo.Designer"%>
<%@page import="designer.model.service.DesignerService"%>
<%@page import="javax.swing.text.View"%>
<%@page import="designer.model.vo.DesignerList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="review.model.vo.Review"%>
<%@page import="hairshop.model.vo.Hairshop"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Hairshop hs = (Hairshop)request.getAttribute("hs");
   		ArrayList<Review> review = (ArrayList<Review>)request.getAttribute("review");
    	ArrayList<DesignerList> deli = (ArrayList<DesignerList>)request.getAttribute("designerList");
    	ArrayList<Reserve> reserve = (ArrayList<Reserve>)request.getAttribute("reserve");
    	ArrayList<ShopPrice> price = (ArrayList<ShopPrice>)request.getAttribute("price");
    	ArrayList<ArrayList<Stylelist>> styleList = (ArrayList<ArrayList<Stylelist>>)request.getAttribute("styleList");
    	ArrayList<StyleTypeList> stlList = (ArrayList<StyleTypeList>)request.getAttribute("typeList");
    	ArrayList<Image> img = (ArrayList<Image>)request.getAttribute("image");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤어샵 상세보기</title>
	<!-- Link Swiper's CSS -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<!-- 구글 아이콘 링크 -->
	 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 	<!-- 스켈레 -->
  	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=yehjayrzn1&submodules=geocoder"></script>
  	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style media="screen">
		body{
			padding: 0;
		}
        /* Style the tab */
        .tab {
            overflow: hidden;
        }

        /* Style the buttons inside the tab */
        .tab button {
            background-color: inherit;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            transition: 0.3s;
            font-size: 17px;
        }

        /* Change background color of buttons on hover */
        .tab button:hover {
            font-weight: bold;
        }

        /* Create an active/current tablink class */
        .tab button.active {
            font-weight: bold;
            border-bottom: 2px solid #8C2E40;
        }

        /* Style the tab content */
        .tabcontent {
            display: none;
            -webkit-animation: fadeEffect 1s;
            animation: fadeEffect 1s;
        }
		.deBtn{
			width: 30px;
			height: 10px;
			background-color: 
		}
        /* Fade in tabs */
        @-webkit-keyframes fadeEffect {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        @keyframes fadeEffect {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }
        .btbt{
        	padding:5px;
        	margin:0;
        	border-radius : 2px;
        	color: white!important;
        	background-color: #8C2E40!important;
        	text-decoration: none!important;
        	font-size: 14px;
        }
        #map{
        	float: left;
        }
</style>


</head>

<body>
	<!-- 헤더 -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<br>

	<div class="modal fade" id="ReserveModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="/insertReserve" method="post">
					<div class="modal-header">
						<h4 class="modal-title">예약하기</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<input class="designerNo" type="hidden" name="desinerNo">
						<input type="hidden" name="shopNo" value="<%=hs.getShopNo() %>">
						<div class="reserve inputBox">
							날짜 및 시간<input type="datetime-local" name="startDate"  class="form-textbox">							
						</div>							
						<div class="reserve inputBox">
							손님 요청 사항<input type="text" class="form-textbox" name="custReq">	
						</div>
						<div class="reserve inputBox">
							<select name="title" class="form-textbox">
							<%for(int i = 0 ; i< stlList.size(); ++i) {%>
								<option value="<%=stlList.get(i).getType()%>"><%=stlList.get(i).getType()%></option>
								<%} %>
							</select>
						</div>
						<div class="reserve inputBox">
						<input type="hidden" name="status" value="예약">
						</div>
						<div class="reserve inputBox">
							<input type="hidden" name="endDate" value="">
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default">예약하기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	
	<div class="slideImg">
        <!-- Swiper -->
        <div class="swiper-container" style="width: 1000px; height: 500px;">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="/img/hairshop/hair1.png" style="width: 1000px; height: 500px;"></div>
                <div class="swiper-slide"><img src="/img/hairshop/hair2.png" style="width: 1000px; height: 500px;"></div>
                <div class="swiper-slide"><img src="/img/hairshop/hair3.png" style="width: 1000px; height: 500px;"></div>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <div class="datePage" style="margin: 0; padding: 0;">
  	<div class="container" style="width: 1000px; height: 500px; padding: 0;">
  	 <div class="tab" >
        <button type="button" id="btnonetap"class="tablinks" onclick="openCity(event, 'onetab')">소개</button>
        <button type="button" class="tablinks" onclick="openCity(event, 'twotab')">디자이너</button>
        <button type="button" class="tablinks" onclick="openCity(event, 'threetab')">가격</button>
        <button type="button" class="tablinks" onclick="openCity(event, 'fourtab')">리뷰</button>
    </div>
    <!-- 소개 -->
    <div id="onetab" class="tabcontent">
    	<br>
    	<div>
        <div class="" style="width: 50%; float: left;">
            <h3>
                <input type="hidden" value="<%=hs.getShopNo() %>"><label><%=hs.getShopName() %></label>
            </h3>
            <br>
            <h4 style="font-weight: bold"><span class="material-icons" style="font-size: 16px;">place</span>장소</h4>
            <p style="font-size: 14px"><%=hs.getShopAddr() %></p>
            <p style="font-weight: bold"><span class="material-icons" style="font-size: 14px">calendar_today</span> 영업시간
            </p>
            <p style="font-size: 14px"><%=hs.getShopOpen()%>~<%=hs.getShopClose() %> 휴무일 | <%=hs.getShopHoliday() %></p>
            <h4 style="font-weight: bold"><span class="material-icons" style="font-size: 14px">local_phone</span> 전화번호
            </h4>
            <p style="font-size: 14px"><%=hs.getShopPhone() %></p>
            <a href="/hairshopModifyPage?shopNo=<%=hs.getShopNo() %>" class="btbt">수정하기</a>
        </div>
        <div>
        <div id="map" style="width:48%; height: 322px; float:left; border: 1px solid #a2a2a2;"></div></div>
    </div>

    <div id="twotab" class="tabcontent">
        <hr>
        <%for(int i=0; i<deli.size(); i++) {%>
        <div class="dt row" style="padding: 0;">
            <div class="designerPt col-md-2">
                <img src="/img/hairshop/designerPhoto.png"
                    style="width: 100px; height :100px; border-radius: 200px; overflow: hidden;">
            </div>
            <div class="designerPt col-md-8" style="height: 100px; display:block;">
                <p style="margin: 0; margin-bottom: 10px"><%=deli.get(i).getDesigner().getDesignerName() %><span
                        style="font-size: 13px;"><%=deli.get(i).getDesigner().getDesignerRank() %></span></p>
                <span style="font-size: 13px; color: #737270;"><%=deli.get(i).getDesigner().getDesignerIntro() %>
                    <span>(경력 : <%=deli.get(i).getDesigner().getDesignerYear() %>년)</span></span>
            </div>
            <div class="designerPt col-md-2" style="height: 100px; display:block;">
                <a class="deBtn" style="margin-top: 30px; " data-toggle="modal"
                    data-target="#ReserveModal" data-name="<%=deli.get(i).getDesigner().getDesignerNo()%>"
                    id="btbt">예약하기</a>
            </div>
        </div>
        <hr>
        <%} %>
    </div>

    <div id="threetab" class="tabcontent">
    <hr>
        <%for(int i = 0 ; i< stlList.size(); ++i) {%>
        <h4 style="font-weight: bold;"><%=stlList.get(i).getType()%></h4>
        <%for(int j = 0; j<stlList.get(i).getStyleList().size();j++) {%>
        <%for(int k = 0; k<stlList.get(i).getStyleList().get(j).size();k++) {%>
        <h4 style="font-size: 14px"><%=stlList.get(i).getStyleList().get(j).get(k).getStyleName() %>
            <%for(int l = 0;l<price.size();l++) {%>
            <%if(price.get(l).getStyleList().getStyle().getStyleName().equals(stlList.get(i).getStyleList().get(j).get(k).getStyleName())) {%>
            <span style="font-size: 14px;"><%=price.get(l).getPrice()%></span></h4>
        <%break;} %>
        <!-- if 1 -->
        <%} %>
        <!-- for 4 -->
        <%} %>
        <!-- for 3 -->
        <%} %>
        <!-- for 2 -->
        <%} %>
        <!-- for 1 -->
        <br>

        <hr>
    </div>

    <div id="fourtab" class="tabcontent">
    <hr>
        <% for(int i=0; i<review.size(); i++){%>
        <% Review currReview = review.get(i); %>
        <h4><span style="font-size:16px; font-weight: bold;"><%=review.get(i).getDesigner().getDesignerName()%>
                디자이너</span></h4>
        <br>
        <p style="font-size: 14px"><%=review.get(i).getCustomer().getCustomerName() %>님 -
            <%=review.get(i).getReviewContent()%> <span style="font-size: 12px; color: #a2a2b2">-
                <%=review.get(i).getReviewDate() %></span></p>
        <hr>
        <%} %>
    </div>
</div>
    </div>
    </div>
    
	<!-- Swiper JS -->
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
	/* 헤어샵 사진 */
		var swiper = new Swiper('.swiper-container', {
      pagination: {
        el: '.swiper-pagination',
        dynamicBullets: true,
      },
    });
		$(document).ready(function(){
			$('#reserBtn').click(function(){
				$('.designerNo').val($(this).data('name'));
			});
		});
		
		
		$(document).ready(function(){
		      
		});
		
		function openCity(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
			window.onload=function(){
				tabcontent[0].style.display = "block";
			}
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }
		
		
		
		
		
		
		
		//네이버 지도
		window.onload=function(){
   			//아무 값도 지정하지 않고 지도객체를 불러오면 서울시청 중심으로 불러와짐
   			/* var map = new naver.maps.Map("map"); */
   			var map = new naver.maps.Map("map",{
   				center : new naver.maps.LatLng(37.533807,126.896772),	//지도 중심좌표설정
   				zoom : 18,												//지도 확대 크기
   				zoomControl : true,										//지도 확대 컨트롤
   				zoomControlOptions : {
   					position : naver.maps.Position.TOP_RIGHT,			//줌 컨트롤러 위치설정
   					style : naver.maps.ZoomControlStyle.SMALL		
   				}
   			});
   			//마커 추가
   			var marker = new naver.maps.Marker({
   				position : new naver.maps.LatLng(37.533807,126.896772),
   				map : map
   			});
   			//지도에 클릭이벤트 추가
   			naver.maps.Event.addListener(map,'click',function(e){
   				marker.setPosition(e.coord);
   				if(infoWindow != null){
   					if(infoWindow.getMap()){
   						infoWindow.close();
   					}
   				}
   				//위경도 좌표를 주소로 가져오는기능 reverseGeocode - > submodule추가해야 사용가능
   				naver.maps.Service.reverseGeocode({
   					location : new naver.maps.LatLng(e.coord.lat(), e.coord.lng())	//위경도
   				},function(status, response){
   					if(status != naver.maps.Service.Status.OK){
   						return alert("주소검색오류");
   					}
   					var result = response.result;
   					var items = result.items;	//json형태로 주소값을 갖고옴
   					var address = items[1].address;	//0번이 지번, 1번이 도로명
   					contentString = [
   						'<div class="iw_inner">',
   						'<p style="color:red";>'+address+"</p>",
   						'</div>'
   					].join('');
   					
   				});
   			});
   			//최초 중심지 주소
   			var contentString = [
   				'<div class="iw_inner">',
   				'	<h3>KH정보교육원</h3>',
   				'	<p>서울시 영등포구 선유2로 57 이레빌딩19F, 20F</p>',
   				'</div>'
   			].join('');
   			var infoWindow = new naver.maps.InfoWindow();
   			naver.maps.Event.addListener(marker,'click',function(e){
   				if(infoWindow.getMap()){
   					infoWindow.close();
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
