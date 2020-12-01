<%@page import="stylelist.model.vo.Stylelist"%>
<%@page import="reserve.model.vo.Reserve"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	Reserve reserve = (Reserve)request.getAttribute("reserve");  
    	/*
    	if(reserve.getCustomer()==null){ 
    		reserve.setCustomer(new Customer());
    	}
    	if(reserve.getDesigner()==null){ 
    		reserve.setDesigner(new Designer());
    	}
    	if(reserve.getShop()==null){ 
    		reserve.setShop(new Hairshop());
    	}
    	if(reserve.getStylelist()==null){ 
    		reserve.setStylelist(new Stylelist());
    	}
    	String shopName="";
    	if(reserve.getShop().getShopName() == null){
    		 shopName = "탈퇴한 헤어샵";    		 
    	}else{
    		shopName = reserve.getShop().getShopName();
    	}
    	String designerName ="";
    	if(reserve.getDesigner().getDesignerName()==null){
    		designerName = "탈퇴한 디자이너";
    	}else{
    		designerName = reserve.getDesigner().getDesignerName();
    	}
    	String customerName ="";
    	if(reserve.getCustomer().getCustomerName()==null){
    		customerName = "탈퇴한 손님";
    	}else{
    		customerName = reserve.getCustomer().getCustomerName();
    	}
    	String styleName = "";
    	if(reserve.getStylelist().getStyle().getStyleName() ==null){
    		styleName = "없어진 스타일";
    	}else{
    		styleName = reserve.getStylelist().getStyle().getStyleName();
    	}*/
    	//int shopNo = reserve.getShop().getShopNo();
    	//int designerNo = reserve.getDesigner().getDesignerNo() ;
    	//int customerNo = reserve.getCustomer().getCustomerNo();
    	//int stylelistNo = reserve.getStylelist().getStylelistNo();
    	//int styleNo = reserve.getStylelist().getStyle().getStyleNo();
    	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>손님 리뷰작성</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="table-wrapper" style="width:80%;margin:0 auto;text-align:center;">
			<form action="/insertReviewByCustomer" method="post" enctype="multipart/form-data">
				<!-- hidden영역 -->
				<input type="hidden" name="shopNo" value="">
				<input type="hidden" name="designerNo" value="">
				<input type="hidden" name="customerNo" value="">
				
				<table class="table table-bordered">
					<tr>
						<th colspan="2">리뷰 작성</th>
					</tr>
					<tr>
						<th>샵이름</th>
						<td><input type="text" class="form-control" name="shopName" value="" readonly></td>
					</tr>
						<th>디자이너이름</th>
						<td><input type="text" class="form-control" name="designerName" value="" readonly></td>
					<tr>
					</tr>
						<th>작성자</th>
						<td><input type="text" class="form-control" name="customerName" value=""readonly></td>
					<tr>
					</tr>
						<th>스타일이름</th>
						
					<tr>				
					</tr>
						<th>평점</th>
						<td><input type="text" class="form-control" name="reviewRate"></td>
					<tr>
					</tr>
						<th>좋아요(찜)</th>
						<td><input type="checkbox" name="reviewLikes" value=1></td>
					<tr>
					</tr>
						<th>리뷰 내용</th>
						<td>
							<textarea name="reviewContent" class="form-control" rows="3" col="40"></textarea>
						</td>
					<tr>					
					<tr style="text-align:center">
						<th colspan="2">
							<button type="submit" class="btn btn-primary btn-lg">등록하기</button>
						</th>
					</tr>
				</table>
			</form>
		</div>
		
		<input type="file" name="filename">
</body>
</html>