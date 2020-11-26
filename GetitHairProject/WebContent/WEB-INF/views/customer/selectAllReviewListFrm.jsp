<%@page import="review.model.vo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   	 ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
			<tr>
				<th>1.리뷰번호</th>
				<th>2.미용실번호</th>
				<th>3.디자이너번호</th>
				<th>4.손님번호</th>
				<th>5.시술번호</th>
				<th>6.리뷰내용</th>
				<th>7.리뷰평점</th>
				<th>8.좋아요수</th>
				<th>9.작성날짜</th>
				<th>10.리뷰이미지</th>				
			</tr>
				<%for(Review r : list) {%>
				<tr>
					<td><%=r.getReviewNo() %></td>
					<td><%=r.getShop().getShopNo() %></td>
					<td><%=r.getDesigner().getDesignerNo() %></td>
					<td><%=r.getCustomer().getCustomerNo() %></td>
					<td><%=r.getStyle().getStyleNo() %></td>					
					<td><%=r.getReviewContent() %></td>
					<td><%=r.getReviewRate() %></td>
					<td><%=r.getReviewLikes() %></td>
					<td><%=r.getReviewDate() %></td>
					<td><%=r.getReviewImg()%></td>							
				</tr>
				<%} %>			
		</table>
</body>
</html>