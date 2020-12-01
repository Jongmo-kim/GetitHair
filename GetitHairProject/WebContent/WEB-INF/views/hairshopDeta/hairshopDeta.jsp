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
		margin: 0;
	}
    .datePage{
        display: block;
        margin: 0 auto;
    }
    .navi>ul>li{
        list-style-type: none;
        float: left;
        display: block;
    }
    
    .tab{
    	width: 100px;
    	height: 20px;
    	line-height: 20px;
    	float: left;
    	display: block;
    	color: #8C2E40;
    	cursor: pointer;
    }
    .tab>a{
    	text-decoration: none;
    }
   /*  .designerPt{
    	padding-right: 10px;
    	display: flex;
    	justify-content: space-between;
    	flex-direction : row;
    	padding-top: 20px;
    } */
	.detail{
		display: none;
	}
	.inputBox>input{
		height: 2.1em;
		width: 80%;
	}
</style>


</head>
<body>
	<!-- 헤더 -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<br>
	<script>
	$(function() {
		   
		});
	 $("#reserveBtn").on('click',function(){
	    	
	    });
	    function reverseBtn(designerNo){
			$("#designerNo").val(designerNo);
	    }
	  
	  
	</script>
	<div class="modal fade" id="ReserveModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="/insertRserve" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">예약하기</h4>
					</div>
					<div class="modal-body">
						<div class="reserve inputBox">
							예약 일자<input type="text" id="testDatepicker" class="form-textbox" name="reserveDate" placeholder="00/00/00로 적어주세요(년/월/일)">							
						</div>											
						<div class="reserve inputBox">
							손님 요청 사항<input type="text" class="form-textbox" name="custReq" id="testid">	
						</div>
							<input type="hidden" name="designerNo" value="<%=deli.get(0).getDesigner().getDesignerNo()%>">
							<input type="hidden" name="shopNo" value="<%=hs.getShopNo() %>">
							<%-- <input type="hidden" name="stylelistNo" value="<%=styleList.getStylelistNo()%>"> --%>
						<div class="reserve inputBox">
						<input type="hidden" name="title" value="<%=reserve.get(0).getReserveTitle()%>">
						</div>
						<div class="reserve inputBox">
						<input type="hidden" name="status" value="<%=reserve.get(0).getReserveStatus()%>">
						</div>
						<div class="reserve inputBox">
							<input type="time" name="startDate">
						</div>
						<div class="reserve inputBox">
							<input type="hidden" name="endDate">
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
        <div class="swiper-container" style="width: 800px; height: 500px;">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="/img/hairshop/hair1.png" style="width: 800px; height: 500px;"></div>
                <div class="swiper-slide"><img src="/img/hairshop/hair2.png" style="width: 800px; height: 500px;"></div>
                <div class="swiper-slide"><img src="/img/hairshop/hair3.png" style="width: 800px; height: 500px;"></div>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <div class="datePage">
    <br>
  	<div class="container" style="width: 800px; height: 500px; padding: 0;">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">소개</a></li>
    <li><a data-toggle="tab" href="#menu1">디자이너</a></li>
    <li><a data-toggle="tab" href="#menu2">가격</a></li>
    <li><a data-toggle="tab" href="#menu3">리뷰</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active" style="width: 100%">
  	<div class="col-md-4">
  		 <h3>
      	 <input type="hidden" value ="<%=hs.getShopNo() %>"><label><%=hs.getShopName() %></label>
		 </h3>
		 <br>
		 <h4 style="font-weight: bold"><span class="material-icons" style="font-size: 16px;">place</span>장소</h4>
		 <p style="font-size: 14px"><%=hs.getShopAddr() %></p>
		 <p style="font-weight: bold"><span class="material-icons" style="font-size: 14px">calendar_today</span> 영업시간</p>
		 <p style="font-size: 14px"><%=hs.getShopOpen()%>~<%=hs.getShopClose() %> 휴무일 | <%=hs.getShopHoliday() %></p>
		 <h4 style="font-weight: bold"><span class="material-icons" style="font-size: 14px">local_phone</span> 전화번호</h4>
		 <p style="font-size: 14px"><%=hs.getShopPhone() %></p>
		 <a href="/hairshopModifyPage" class="btn btn-primary btn-sm">헤어샵 수정하기</a>
	</div>
	<div class="col-md-2"></div>
	
	<div class="col-md-6" id="map" style="height: 280px; margin-top: 20px; border: 2px solid #a2a2b2"><div></div></div>
    </div>
    <div id="menu1" class="tab-pane fade">
    	<br>
    	<%for(int i=0; i<deli.size(); i++) {%>
    	 <div class="dt row"  style="padding: 0;">
    	<div class="designerPt col-md-2">
    		<img src="/img/hairshop/designerPhoto.png" style="width: 100px; height :100px; border-radius: 200px; overflow: hidden;">	
    	</div>
    	<div class="designerPt col-md-8" style="height: 100px; display:block;" >
    		<p style="margin: 0; margin-bottom: 10px"><%=deli.get(i).getDesigner().getDesignerName() %><span style="font-size: 13px;"><%=deli.get(i).getDesigner().getDesignerRank() %></span></p>
    		<span style="font-size: 13px; color: #737270;"><%=deli.get(i).getDesigner().getDesignerIntro() %> <span>(경력 : <%=deli.get(i).getDesigner().getDesignerYear() %>년)</span></span>
    	</div>
    	<form action="/reserVation" method="get">
    	<div class="designerPt col-md-2" style="height: 100px; display:block;">
    		<a class="btn btn-primary btn-sm" style="margin-top: 30px;" data-toggle="modal" data-target="#ReserveModal">예약하기</a>
    	</div>
    	</form>
    </div>
    	<hr>	
    	<%} %>
    </div>
    <div id="menu2" class="tab-pane fade">
    <%for(int i = 0 ; i< stlList.size(); ++i) {%>
      <!-- style.type -->	
      <h4 style="font-size: 14px;"><%=stlList.get(i).getType()%></h4>
      <!-- stlye.name -->	
      <%for(int j = 0; j<stlList.get(i).getStyleList().size();j++) {%>
      <%for(int k = 0; k<stlList.get(i).getStyleList().get(j).size();k++) {%>
      <h4><%=stlList.get(i).getStyleList().get(j).get(k).getStyleName() %></h4>
      <%} %>
      <%} %>
    	<br>
    	<p style="font-size: 14px;"><%=price.get(i).getPrice()%></p>
    	<hr>
      <%} %>
    	
    </div>
    
    <div id="menu3" class="tab-pane fade">
	     <% for(int i=0; i<review.size(); i++){%>
	   		<% Review currReview = review.get(i); %>
	    	<h4><span style="font-size:16px; font-weight: bold;"><%=review.get(i).getDesigner().getDesignerName()%> 디자이너</span></h4>
	    	<br>
	    	<p style="font-size: 14px"><%=review.get(i).getCustomer().getCustomerName() %>님 - <%=review.get(i).getReviewContent()%> <span style="font-size: 12px; color: #a2a2b2">- <%=review.get(0).getReviewDate() %></span></p>
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
		var swiper = new Swiper('.swiper-container', {
      pagination: {
        el: '.swiper-pagination',
        dynamicBullets: true,
      },
    });
		});
		
		window.onload=function(){
   			//아무 값도 지정하지 않고 지도객체를 불러오면 서울시청 중심으로 불러와짐
   			/* var map = new naver.maps.Map("map"); */
   			var map = new naver.maps.Map("map",{
   				center : new naver.maps.LatLng(35.1541767, 129.1202395),	//지도 중심좌표설정
   				zoom : 18,												//지도 확대 크기
   				zoomControl : true,										//지도 확대 컨트롤
   				zoomControlOptions : {
   					position : naver.maps.Position.TOP_RIGHT,			//줌 컨트롤러 위치설정
   					style : naver.maps.ZoomControlStyle.SMALL		
   				}
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
   						'<p style="color:black";>'+address+"</p>",
   						'</div>'
   					].join('');
   					
   				});
   			});
   		}
		
	</script>
</body>
</html>
