<%@page import="java.util.ArrayList"%>
<%@page import="style.model.service.StyleService"%>
<%@page import="style.model.dao.StyleDao"%>
<%@page import="style.model.vo.Style"%>
<%@page import="reserve.model.vo.Reserve"%>
<%@page import="hairshop.model.vo.Hairshop"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Hairshop hs = (Hairshop)request.getAttribute("hs");
    	ArrayList<Style> style = new StyleService().selectAllStyle();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<!-- 스타일 부분 -->
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  <style>
      .datePage{
        display: block;
        margin-left: 500px;
       	margin-top: 100px;
    }
  </style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- 미용실 이름/ 디자이너 이름 /예약일시 / 상태 /  -->
<div class="datePage">
	<div style="width: 800px; height: 500px;">
		<h2>예약하기</h2>
		<div>
		<form action="/reserVationOk?shopNo=<%=hs.getShopNo() %>" method="get">
		<br>
		<p>매장 : <%=hs.getShopName() %><input type="hidden" name="reserveShopName" value="<%=hs.getShopName() %>"></p>
		<p>
		시술 <select>
			<%for(int i=0; i<style.size(); i++){ %>
			<option value="<%=style.get(i).getStyleName() %>" name="reserve"><%=style.get(i).getStyleName() %></option>
			<%} %>
			</select>
		</p>
		<p>손님요청사항 : <input type="text" name="custReq"></p>
		<button type="submit">예약하기</button>
		</form>	
		</div>
	</div>
	</div>
</body>
</html>