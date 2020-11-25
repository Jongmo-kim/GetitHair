<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
		 

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<link rel="stylesheet" href="/css/signUp/signUpCustomer.css">
	<script type="text/javascript" src="/js/signUp/signUpCustomer.js"></script>
	<form action="/signUpCustomer" method="post">
	    <div class="container">
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="customerName">
	            <span class="form-label">이름</span>
	        </div>
	        <div class="date inputBox">
	            <input type="text" class="form-textbox dateOfBirth" name="customerBirthDate">
	            <span class="form-label">생년월일</span>
	        </div>
	        <div class="inputBox">
	            <input type="text" class="form-textbox phoneInput" name="customerPhone">
	            <span class="form-label">전화번호</span>
	        </div>
			
			<div class="name inputBox">
	            <input type="text" class="form-textbox" name="customerId">
	            <span class="form-label">아이디</span>
	        </div>
	        
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="customerPw">
	            <span class="form-label">비밀번호</span>
	        </div>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="customerGen">
	            <span class="form-label">성별</span>
	        </div>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="customerName">
	            <span class="form-label">이름</span>
	        </div>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="customerEmail">
	            <span class="form-label">이메일</span>
	        </div>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="customerAddr">
	            <span class="form-label">주소</span>
	        </div>
	        
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="addrPostcode">
	            <span class="form-label">Zipcode</span>
	        </div>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="addrDetail">
	            <span class="form-label">상세표기</span>
	        </div>
        <button class="btn">제출</button>
        <button class="btn" type="reset">초기화</button>
    </div>
	</form>
</body>
</html>