<%@page import="stylelist.model.vo.Stylelist"%>
<%@page import="reserve.model.vo.Reserve"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	Reserve reserve = (Reserve)request.getAttribute("reserve");  
    	int reqPage = (Integer)request.getAttribute("reqPage");
    	String selStatus = (String)request.getAttribute("selStatus");
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
			<form action="/insertReviewByCustomer" method="post">
				<!-- hidden영역  hidden-->
				<input type="hidden" id="shopNo" name="reviewNo">
				<input type="hidden" id="shopNo" name="shopNo" value="<%=reserve.getShop().getShopNo()%>">
				<input type="hidden" id="designerNo" name="designerNo" value="<%=reserve.getDesigner().getDesignerNo()%>">
				<input type="hidden" id="customerNo" name="customerNo" value="<%=reserve.getCustomer().getCustomerNo()%>">
				<input type="hidden" id="styleNo" name="styleNo" value="<%=reserve.getStylelist().getStyle().getStyleNo()%>">
				<input type="hidden" id="reviewLikes" name="reviewLikes" value=1>
				<input type="hidden" id=reqPage name="reqPage" value=<%=reqPage %>>
				<input type="hidden" id=selStatus name="selStatus" value=<%=selStatus %>>
				<table class="table table-bordered">
					<tr>
						<th colspan="2">리뷰 작성</th>
					</tr>
					<tr>
						<th>샵이름</th>
						<td><input type="text" id="shopName" class="form-control" name="shopName" value="<%=reserve.getShop().getShopName() %>" readonly></td>
					</tr>
					<tr>
						<th>디자이너이름</th>
						<td><input type="text" id="designerName" class="form-control" name="designerName" value="<%=reserve.getDesigner().getDesignerName() %>" readonly></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" id="customerName" class="form-control" name="customerName" value="<%=reserve.getCustomer().getCustomerName()%>"readonly></td>
					</tr>
					<tr>
						<th>스타일이름</th>
						<td><input type="text" id="styleName" class="form-control" name="styleName" value="<%=reserve.getStylelist().getStyle().getStyleName()%>"readonly></td>
					</tr>				
					<tr>
						<th>평점</th>
						<td><input type="text" id="reviewRate" class="form-control" name="reviewRate"></td>
					</tr>					
					<tr>
						<th>리뷰 내용</th>
						<td>
							<textarea name="reviewContent" id="reviewContent" class="form-control" rows="3"></textarea>
						</td>
					</tr>					
					<tr style="text-align:center">
						<th colspan="2">
							<button type="submit" class="btn btn-primary btn-lg">등록하기</button>							
						</th>
						<th colspan="2">
							<input type="button" value="이전화면으로" onClick="history.go(-1)">					
						</th>
					</tr>
				</table>
			</form>
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>