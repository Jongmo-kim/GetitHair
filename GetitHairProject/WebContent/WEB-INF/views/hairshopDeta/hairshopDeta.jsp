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
    .dis-no{
    	display: none;
    }
    .dis-on{
    	display: block;
    }
    .dt{
    	display: none;
    }
    
</style>


</head>
<body>
	<!-- 헤더 -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<br>
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
    
    <div class="datePage" style="width: 800px; height: 500px;">
    <br>
    <div class="menu">
        <span><a class="tab">소개</a></span>
        <span><a class="tab">디자이너</a></span>
        <span><a class="tab">가격</a></span>
        <span><a class="tab">리뷰</a></span>
    </div>
        <br>
        <hr>
    <div class="detail">
	   	<div class="dt" style="width: 100%;"> 
	   		<div>
		   		<input type="hidden" value ="<%=hs.getShopNo() %>">
		        <h3 style="font-weight: bold; margin-bottom: 0;"><%=hs.getShopName() %> <label style="font-size: 16px;"><%=hs.getShopLikes() %><span class="material-icons" style="font-size: 14px;" id="shopLike">favorite_border</span></label></h3>
		        <p style="font-size: 15px; font-weight: 100;">평점 : <%=hs.getShopRate() %>점</p>
		        <br>
		        <h4 style="font-weight: bold"><span class="material-icons" style="font-size: 16px;">place</span>장소</h4>
		        <p style="font-size: 14px"><%=hs.getShopAddr() %></p>
		        <p style="font-weight: bold"><span class="material-icons" style="font-size: 14px">calendar_today</span> 영업시간</p>
		        <p style="font-size: 14px"><%=hs.getShopOpen()%>~<%=hs.getShopClose() %> 휴무일 | <%=hs.getShopHoliday() %></p>
		        <h4 style="font-weight: bold"><span class="material-icons" style="font-size: 14px">local_phone</span> 전화번호</h4>
		        <p style="font-size: 14px"><%=hs.getShopPhone() %></p>
	   		</div>
	    </div>
    	
    	<%for(int i=0; i<review.size(); i++){ %>
    <div class="dt row"  style="padding: 0;">
    	<div class="designerPt col-md-2">
    		<img src="/img/hairshop/designerPhoto.png" style="width: 100px; height :100px; border-radius: 200px; overflow: hidden;">	
    	</div>
    	<div class="designerPt col-md-8" style="height: 100px" >
    		<p style="margin: 0;"><%=review.get(i).getDesigner().getDesignerName() %><span style="font-size: 13px;"><%=review.get(i).getDesigner().getDesignerRank() %></span></p>
    		<span style="font-size: 13px; color: #737270;"><%=review.get(i).getDesigner().getDesignerIntro() %> <span>(경력 : <%=review.get(i).getDesigner().getDesignerYear() %>년)</span></span>
    		
    	</div>
    	<div class="designerPt col-md-2" style="height: 100px"><a href="/reserVation?shopNo=<%=hs.getShopNo() %>" class="btn btn-primary btn-sm" style="margin-top: 30px;" >예약하기</a></div>
    </div>
    	<hr>
    	<%} %>
    
    <div class="dt">
    	<h4>커트</h4>
    	<br>
    	<p style="font-size: 14px">남성 커트 : 15,000</p>
    	<p style="font-size: 14px">여성 커트 : 15,000</p>
    	<hr>
    	<h4>펌</h4>
    	<br>
    	<p style="font-size: 14px">남성 펌 : 15,000</p>
    	<p style="font-size: 14px">여성 펌 : 15,000</p>
    	<hr>
    </div>
    <div class="dt">
   		<% for(int i=0; i<review.size(); i++){%>
    	<h4><span style="font-size:12px"><%=review.get(i).getDesigner().getDesignerName()%> 디자이너</span></h4>
    	<br>
    	<p></p>
    	<p style="font-size: 14px"><%=review.get(i).getReviewContent()%> <span style="font-size: 12px; color: #a2a2b2">- <%=review.get(0).getReviewDate() %></span></p>
    	<hr>
    	<%} %>
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
	
		$(function(){
			$(".dt").eq(0).css("display",'block');
			$(".tab").click(function(){
			var tab = $(".tab").index(this);
				$(".dt").css("display",'none');
				$(".dt").eq(tab).css("display","block");
			});
		});
		
	</script>
</body>
</html>