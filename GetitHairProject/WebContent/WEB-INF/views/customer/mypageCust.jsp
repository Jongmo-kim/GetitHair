<%@page import="reserve.model.vo.Reserve"%>
<%@page import="java.util.ArrayList"%>
<%@page import="customer.model.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Reserve> reserveList = (ArrayList<Reserve>) request.getAttribute("reserveList");
	String pageNavi = (String) request.getAttribute("pageNavi");
	String selStatus = (String) request.getAttribute("selStatus");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<ul>
		<li><a href="/mypageCust?selStatus=전체&reqPage=1">회원관리 및 예약관리</a></li>
		<li><a href="/mypageCustReviewList?customerNo=<%=loginCustomer.getCustomerNo()%>&reqPage=1">리뷰관리</a></li>
		<li><a href="/mypageCustLikesList?customerNo=<%=loginCustomer.getCustomerNo()%>&reqPage=1">찜(좋아요)관리</a></li>
	</ul>
	<div id="reserveList" style="widtn: 80%;">
		<h1>회원관리 및 예약관리</h1>
		<ul>
			<p>
				[<%=loginCustomer.getCustomerName()%>]님 환영합니다.
			</p>
			<li>
				<button type="button" class="btn btn-primary"
					onclick="location.href='/updateAllCustomerFrm?customerNo=<%=loginCustomer.getCustomerNo()%>'">정보수정</button>
				<button type="button" class="btn btn-danger"
					onclick="location.href='/deleteAllCustomer?customerNo=<%=loginCustomer.getCustomerNo()%>'">회원탈퇴</button>
			</li>
			<li>
				<div style="text-align: right;" class="tabs">
					<a class="btn btn-primary btn-lg"
						href="/mypageCust?selStatus=전체&reqPage=1">전체</a> <a
						class="btn btn-warning btn-lg"
						href="/mypageCust?selStatus=예약&reqPage=1">예약</a> <a
						class="btn btn-success btn-lg"
						href="/mypageCust?selStatus=완료&reqPage=1">완료</a> <a
						class="btn btn-danger btn-lg"
						href="/mypageCust?selStatus=취소&reqPage=1">취소</a>
				</div>
				<div class="tab_container">
					<h1>예약 <%=selStatus%> List
					</h1>
					<table class="table" border="1">
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
						<%	for (Reserve r : reserveList) {	%>
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
						<%}	%>
					</table>
					<div id="pageNavi"><%=pageNavi%></div>
				</div>
			</li>
		</ul>
	</div>
</body>

</html>