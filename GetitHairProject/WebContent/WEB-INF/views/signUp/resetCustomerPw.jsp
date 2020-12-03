<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		Customer customer = (Customer)request.getAttribute("customer");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer암호설정</title>
<!-- jQuery 호출 -->
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
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
						<input autofocus type="password" class="form-textbox" id ="pwInput"
							name="customerPw"> <span class="form-label label-focused">암호
							설정</span>
							<span id="pwInfo"></span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="password inputBox">
						<input type="password" class="form-textbox" id ="pwreInput"
							name="customerPwRe"> <span class="form-label">암호
							설정</span>
							<span id="pwreInfo"></span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="inputBox btnDiv" style="width: 100%; height: 100%;">
						<input class="btn btn-primary" type="submit" value="설정 완료" id="submitBtn">
					</div>
				</td>
			</tr>
		</table>
	</form>
	<script>
	 $(function () {
			$('#pwInput').on('blur',pwInputRegFunc);
			$('#pwreInput').on('blur',pwreInputRegFunc);
			$('#submitBtn').on('click',submitBtnFunc);
	    });
	 function submitBtnFunc(e){
			if(isAllPassed()){
				
			} else {
				window.scrollTo(0, 0);
				return false;
			}
	}
	function pwInputRegFunc(){
		var inputVal = $('#pwInput').val();
		var regexp = /(?=^.{6,255}$)((?=.*\d)(?=.*[A-Z])(?=.*[a-z])|(?=.*\d)(?=.*[^A-Za-z0-9])(?=.*[a-z])|(?=.*[^A-Za-z0-9])(?=.*[A-Z])(?=.*[a-z])|(?=.*\d)(?=.*[A-Z])(?=.*[^A-Za-z0-9]))^.*/g;
		if(regexp.test(inputVal)){
			$('#pwInput').removeClass('form-textbox-wrong');
			$('#pwInfo').html('');
			return true;
		} else{
			$('#pwInput').addClass('form-textbox-wrong');
			$('#pwInfo').html('🚫 최소 1개 이상의 영어 대소문자, 특수문자, 숫자를입력해주세요. 최소 6문자이상을 입력해주세요.');
			return false;
		}
	}
	function pwreInputRegFunc(){
		var inputVal = $('#pwreInput').val();
		var pwVal = $('#pwInput').val();
		if(inputVal == pwVal){
			$('#pwreInput').removeClass('form-textbox-wrong');
			$('#pwreInfo').html('');
			return true;
		} else{
			$('#pwreInput').addClass('form-textbox-wrong');
			$('#pwreInfo').html('🚫 비밀번호가 일치하지 않습니다.');
			return false;
		}
	}
	function isAllPassed(){		
		return (pwreInputRegFunc() && pwInputRegFunc() );
		}
	</script>
</body>
</html>