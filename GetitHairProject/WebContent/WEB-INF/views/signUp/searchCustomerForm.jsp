<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String msg = "";
		if((String)request.getAttribute("msg")==null){
			msg = "";
		}else{
			msg = (String)request.getAttribute("msg");
		}
		//암호 autofocus용
		int option = -1;
		if(request.getAttribute("option")==null){
			option = -1;
		}else{
			option = (Integer)request.getAttribute("option");
		}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 아이디 암호 찾기</title>
<style>
.btnDiv {
	margin: 0 auto;
	padding: 0px;
	text-align: center;
}
.btnDiv > *{
	width : 50%;
}

</style>
<script type="text/javascript">
	window.onload = function() {
		var print= '<%=msg %>';
		if(print!=''){
			alert(print);
		}	
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
	<h1>Customer ID/PW찾기</h1>
		<form method="post" action="/searchCustmerId">			
			<table class="table">
				<tr>
					<th colspan="2"><p>ID찾기</p></th>
				</tr>
				<tr>
					<td>
						<div class="name inputBox">
						<% if(option ==-1){ %>
							<input autofocus type="text" class="form-textbox"
								name="customerName"> 
						<%} else{%>
							<input type="text" class="form-textbox"
								name="customerName">
						<%} %>
						<span class="form-label label-focused">이름</span>
						</div>
					</td>					
				</tr>
				<tr>
					<td>
						<div class="inputBox">
							<input type="text" class="form-textbox phoneInput"
								name="customerPhone"> <span class="form-label">전화번호</span>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="inputBox btnDiv"
							style="width: 100%; height: 100%;">
							<input class="btn btn-primary" type="submit"
								value="ID 찾기">
						</div>
					</td>
				</tr>
			</table>			
		</form>
		<form method="post" action="/searchCustmerPw">			
			<table class="table">
				<tr>
					<th colspan="2"><p>PW찾기</p></th>
				</tr>
				<tr>
					<td>
						<div class="id inputBox">
							<% if(option ==-1){ //암호 autofocus 용%>
							<input type="text" class="form-textbox"
								name="customerId"> 
							<%} else{%>
							<input autofocus type="text" class="form-textbox"
								name="customerId">
							<%} %>
								<span class="form-label label-focused">아이디</span>
						</div>
					</td>					
				</tr>
				<tr>
					<td>
						<div class="inputBox">
							<input type="text" class="form-textbox phoneInput"
								name="customerPhone"> <span class="form-label">전화번호</span>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="inputBox btnDiv"
							style="width: 100%; height: 100%;">
							<input class="btn btn-primary" type="submit"
								value="PW 찾기">
						</div>
					</td>
				</tr>
			</table>			
		</form>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>