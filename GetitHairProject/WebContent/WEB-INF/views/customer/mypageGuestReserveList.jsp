<%@page import="reserve.model.vo.Reserve"%>
<%@page import="java.util.ArrayList"%>
<%@page import="customer.model.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String msg = "난메시지야";    	
    	Customer customer =  (Customer)request.getAttribute("customer");
    	String pageNavi = (String) request.getAttribute("pageNavi");
    	String selStatus = (String) request.getAttribute("selStatus");	
    	ArrayList<Reserve> list = (ArrayList<Reserve>) request.getAttribute("list");    	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<ul class="tabs">
			<li><a href="/mypageCust?selStatus=전체&reqPage=1">전체</a></li>
			<li><a href="/mypageCust?selStatus=예약&reqPage=1">예약</a></li>
			<li><a href="/mypageCust?selStatus=완료&reqPage=1">완료</a></li>
			<li><a href="/mypageCust?selStatus=취소&reqPage=1">취소</a></li>		
		</ul>
		<div class="tab_container">
			<div id="tab4" class="tab_content">
					<h1><%=selStatus%>영역</h1>			
				<table border="1">
					<tr>
						<th>1.예약번호</th>
						<th>2.손님번호</th>
						<th>3.디자이너번호</th>
						<th>4.미용실번호</th>
						<th>5.예약일시</th>
						<th>6.상태코드</th>
						<th>7.손님요청사항</th>
						<th>8.디자이너요청사항</th>
						<th>9.디자이너손님에 대한메모</th>
					</tr>					
					<%
						for (Reserve r : list) {
					%>
					<tr>
						<td><%=r.getReserveNo()%></td>
						<td><%=r.getCustomer().getCustomerNo()%></td>
						<td><%=r.getDesigner().getDesignerNo()%></td>
						<td><%=r.getShop().getShopNo()%></td>
						<td><%=r.getReserveDate()%></td>
						<td><%=r.getReserveStatus()%></td>
						<td><%=r.getReserveCustReq()%></td>
						<td><%=r.getReserveDesignerReq()%></td>
						<td><%=r.getReserveDesignerMemo()%></td>
					</tr>
					<%
						}
					%>				
				</table>
				<div id="pageNavi"><%=pageNavi%></div>		
			</div>
		</div>
	</div>
</body>
</html>