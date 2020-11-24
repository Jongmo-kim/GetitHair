<%@page import="style.controller.Hairshop"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Hairshop> list = (ArrayList<Hairshop>)request.getAttribute("list");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>헤어샵 메인페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section>
		<div class="banner">
		</div>
		<div class="content">
			<%for(Hairshop shop : list){ %>
				<table>
					<tr>
						<th rowspan="3"><img src = <%=shop.getShopImg() %>></th>
						<td><a href="/hairshopDetail?shopNo=<%=shop.getShopNo() %>"><%=shop.getShopName() %></a></td>
						<td><%=shop.getShopRate() %><%=shop.getShopLikes() %></td>
					</tr>
					<tr>
						<td><%=shop.getShopAddr() %></td>
					</tr>
					<tr>
						<td><%=shop.getShopOpen() %> ~ <%=shop.getShopClose() %></td>
					</tr>
				</table>
			<%} %>
		</div>
	</section>
</body>
</html>