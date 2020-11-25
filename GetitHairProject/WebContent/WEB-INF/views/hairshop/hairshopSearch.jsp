<%@page import="common.DebugTemplate"%>
<%@page import="hairshop.model.vo.Hairshop"%>
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
<title>헤어샵 검색 후 페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section>
		<form action="/search" method="get" id="search">
			<input type="search" name="search">
			<button type="submit">검색</button>
		</form>
		<div class="content">
		<%if(list.size() != 0){ %>
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
		<%}else{ %>
			<h1>검색하신 헤어샵이 존재하지 않습니다.</h1>
			<a href="/hairshop">메인으로</a>
		<%} %>
		</div>
	</section>
</body>
</html>