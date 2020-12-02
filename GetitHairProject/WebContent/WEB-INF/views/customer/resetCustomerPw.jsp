<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		Customer customer = (Customer)request.getAttribute("customer");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>암호설정</title>
<style>
.btnDiv {
	margin: 0 auto;
	padding: 0px;
	text-align: center;
}

.btnDiv>* {
	width: 50%;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<h1>인증이 완료되었습니다. 암호를 다시설정해주세요.</h1>
	<form method="post" action="/customerResetPw">
		<input type="hidden" name="customerNo" value="<%= customer.getCustomerNo()%>">
		<input type="hidden" name="customerId" value="<%= customer.getCustomerId()%>">
		<table class="table">
			<tr>
				<td>
					<div class="password inputBox">
						<input autofocus type="password" class="form-textbox"
							name="customerPw"> <span class="form-label label-focused">암호
							설정</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="password inputBox">
						<input type="password" class="form-textbox"
							name="customerPwRe"> <span class="form-label">암호
							설정</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="inputBox btnDiv" style="width: 100%; height: 100%;">
						<input class="btn btn-primary" type="submit" value="설정 완료">
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>