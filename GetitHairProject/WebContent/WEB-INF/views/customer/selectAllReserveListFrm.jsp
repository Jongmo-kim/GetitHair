<%@page import="customer.model.service.CustomerService"%>
<%@page import="reserve.model.vo.Reserve"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Reserve> list = (ArrayList<Reserve>)request.getAttribute("list");
   // Customer cust = new CustomerService().selectOneCustomer();
    		//cust.name
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/updateHairinfo?customerNo=10" method="post">
		<table>
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
				<%for(Reserve reser : list){ %>
					<%//if(reser.getCustomer().getCustomerNo()==loginCusterNo) {%>
					<tr>
						<td>1.<%=reser.getReserveNo() %></td>
						<td>2.<%=reser.getCustomer() %></td>
						<td>3.<%=reser.getDesigner() %></td>
						<td>4.<%=reser.getShop() %></td>
						<td>5.<%=reser.getReserveDate() %></td>
						<td>6.<%=reser.getReserveStatus() %></td>
						<td>7.<%=reser.getReserveCustReq() %></td>
						<td>8.<%=reser.getReserveDesignerReq() %></td>
						<td>9.<%=reser.getReserveDesignerMemo()%></td>
					</tr>
					<%//} %>
				<%} %>
			
		</table>
	</form>
</body>
</html>