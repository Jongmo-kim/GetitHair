<%@page import="likes.model.vo.Likes"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Likes> list = (ArrayList<Likes>) request.getAttribute("list");
	String pageNavi = (String) request.getAttribute("pageNavi");
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
			<th>1.좋아요번호</th>
			<th>2.회원번호</th>
			<th>3.좋아요타입</th>
			<th>4.타입번호</th>
		</tr>
		<%
			for (Likes likes : list) {
		%>
		<tr>
			<td><%=likes.getLikesNo()%></td>
			<td><%=likes.getCustomer().getCustomerNo()%></td>
			<td><%=likes.getLikesType().getLikesType()%></td>
			<td><%=likes.getLikesType().getLikesTypeNo()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<div id="pageNavi"><%=pageNavi%></div>
</body>
</html>