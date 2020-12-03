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
<title>디자이너 아이디 암호 찾기</title>
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
	<link rel="stylesheet" href="/css/signUp/signUpCustomer.css?v=<%=System.currentTimeMillis()%>">
	<div class="container">
	<h1>Designer ID/PW찾기</h1>
		<form method="post" action="/searchDesignerId">			
			<table class="table">
				<tr>
					<th colspan="2"><p>ID찾기</p></th>
				</tr>
				<tr>
					<td>
						<div class="name inputBox">
						<% if(option ==-1){ %>
							<input autofocus type="text" class="form-textbox"  id="nameInput"
								name="designerName"> 
						<%} else{%>
							<input type="text" class="form-textbox"  id="nameInput"
								name="designerName">
						<%} %>
						<span class="form-label label-focused">이름</span>
						<span id="nameInfo"></span>
						</div>
					</td>					
				</tr>
				<tr>
					<td>
						<div class="inputBox">
							<input type="text" class="form-textbox phoneInput"  id="phoneInput1"
								name="designerPhone"> <span class="form-label">전화번호</span>
								<span id="phoneInfo1"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="inputBox btnDiv" id="submitBtn1"
							style="width: 100%; height: 100%;">
							<input class="btn btn-primary" type="submit"
								value="ID 찾기">
						</div>
					</td>
				</tr>
			</table>			
		</form>
		<form method="post" action="/searchDesignerPw">			
			<table class="table">
				<tr>
					<th colspan="2"><p>PW찾기</p></th>
				</tr>
				<tr>
					<td>
						<div class="id inputBox">
							<% if(option ==-1){ //암호 autofocus 용%>
							<input type="text" class="form-textbox" id="idInput"
								name="designerId"> 
							<%} else{%>
							<input type="text" class="form-textbox" id="idInput" autofocus
								name="designerName">
							<%} %>
								<span class="form-label label-focused">아이디</span>
								<span id="idInfo"></span>
						</div>
					</td>					
				</tr>
				<tr>
					<td>
						<div class="inputBox">
							<input type="text" class="form-textbox phoneInput" id="phoneInput2"
								name="designerPhone"> <span class="form-label">전화번호</span>
								<span id="phoneInfo2"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="inputBox btnDiv"
							style="width: 100%; height: 100%;">
							<input class="btn btn-primary" type="submit" id="submitBtn2"
								value="PW 찾기">
						</div>
					</td>
				</tr>
			</table>			
		</form>
	</div>
	<script>
	$(function () {
		$('#nameInput').on('blur',nameInputRegFunc);
		$('#idInput').on('blur',idInputRegFunc);
		$('#phoneInput1').on('blur',phoneInputRegFunc);
		$('#phoneInput2').on('blur',phoneInputRegFunc2);
		$('#submitBtn1').on('click',submitBtnFunc1);
		$('#submitBtn2').on('click',submitBtnFunc2);
    });
	 function nameInputRegFunc(){
			var Regexp = /^[가-힣]{2,4}$/i;
			var inputVal = $('#nameInput').val();
			if(Regexp.test(inputVal)){
				$('#nameInput').removeClass('form-textbox-wrong');
				$('#nameInfo').html('');
				return true;
			 }else {
				$('#nameInput').addClass('form-textbox-wrong');
				$('#nameInfo').html('🚫 한글 2~4글자만 입력해주세요.');
				return false;
			}
			
		};
		function phoneInputRegFunc(){
			var inputVal = $('#phoneInput1').val();
			var regexp = /^\d{3}-\d{4}-\d{4}$/g;
			if(regexp.test(inputVal)){
				$('#phoneInput1').removeClass('form-textbox-wrong');
				$('#phoneInfo1').html('');
				return true;
			} else {
				$('#phoneInput1').addClass('form-textbox-wrong');
				$('#phoneInfo1').html('🚫 입력하지 않은 값이 있습니다.');
				return false;
			}
		}
		function idInputRegFunc(){
			var regexp = /^[a-z]+[a-z0-9]{5,19}$/g;
			var inputVal = $('#idInput').val();
	        if(regexp.test(inputVal)){
				if(isIdNested()){
					$('#idInput').addClass('form-textbox-wrong');
					$('#idInfo').html("🚫 중복된 ID입니다.");
					return false;
				} else {
					$('#idInput').removeClass('form-textbox-wrong');
					$('#idInfo').html("");
					return true;
				}
	        }else {
				$('#idInput').addClass('form-textbox-wrong');
				$('#idInfo').html("🚫 아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
				return false;
			}
		}
		function phoneInputRegFunc2(){
			var inputVal = $('#phoneInput2').val();
			var regexp = /^\d{3}-\d{4}-\d{4}$/g;
			if(regexp.test(inputVal)){
				$('#phoneInput2').removeClass('form-textbox-wrong');
				$('#phoneInfo2').html('');
				return true;
			} else {
				$('#phoneInput2').addClass('form-textbox-wrong');
				$('#phoneInfo2').html('🚫 입력하지 않은 값이 있습니다.');
				return false;
			}
		}
		
	 function submitBtnFunc1(e){
			if(isAllPassed1()){				
			} else {
				window.scrollTo(0, 0);
				return false;
			}
	}
	 function submitBtnFunc2(e){
			if(isAllPassed2()){				
			} else {
				window.scrollTo(0, 0);
				return false;
			}
	}
	 function isAllPassed1(){		
		 return (nameInputRegFunc() && phoneInputRegFunc());
			}
	 function submitBtnFunc2(e){
			if(isAllPassed2()){
				
			} else {
				window.scrollTo(0, 0);
				return false;
			}
	}
	 function isAllPassed2(){		
		 return (idInputRegFunc() && phoneInputRegFunc2());
			}
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>