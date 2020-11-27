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
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section>
	<div>
		<table class="table table-bordered">
			<tr>
				<th colspan="4">리뷰 리스트</th>
			</tr>
			<tr>
				<th>리뷰번호</th>
				<th>리뷰내용</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		<%for(Review r : list) {%>
			<tr>
				<td style="font-size: 15px;"><%=r.getReviewNo() %></td>
				<td style="font-size: 15px;"><a href="/designerReviewView?reviewNo=<%=r.getReviewNo()%>"><%=r.getReviewContent() %></a></td>
				<td style="font-size: 15px;"><%=r.getCustomer().getCustomerName() %></td>
				<td style="font-size: 15px;"><%=r.getReviewDate() %></td>
			</tr>
			<%} %> 
		
		</table>
	</div>
	</section>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>