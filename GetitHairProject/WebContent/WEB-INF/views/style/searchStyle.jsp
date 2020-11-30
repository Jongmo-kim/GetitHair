<%@page import="style.model.vo.Style"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Style> list = (ArrayList<Style>)request.getAttribute("list");
    	String searchStyle = (String)request.getAttribute("searchStyle");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스타일로 검색</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section>
		<form action="/searchStyle" method="get">
			<input type="search" name="searchStyle" value="<%=searchStyle%>">
			<button type="submit">검색</button>
		</form>
		<div class="content">
		<%if(list.size() != 0){ %>
				<%for(Style style : list){ %>
					<div class="styleList">
						<!-- <img src = > -->
						<a href="/styleDetail?styleNo=<%=style.getStyleNo() %>"><%=style.getStyleName() %>
						<%=style.getStyleLikes() %>
					</div>
				<%} %>
		<%}else{ %>
			<h1>검색하신 스타일이 존재하지 않습니다.</h1>
			<a href="/hairshop">메인으로</a>
		<%} %>
		</div>
	</section>
</body>
</html>