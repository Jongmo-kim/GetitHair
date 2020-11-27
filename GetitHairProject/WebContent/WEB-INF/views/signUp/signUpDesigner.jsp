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
	<link rel="stylesheet" href="/css/signUp/inputBox.css">
	<script type="text/javascript" src="/js/signUp/inputBox.js"></script>
	<form action="/signUpCustomer" method="post">
	    <div class="container">
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="designerId">
	            <span class="form-label">아이디</span>
	        </div>
	        <div class="date inputBox">
	            <input type="password" class="form-textbox" name="designerPw">
	            <span class="form-label">비밀번호</span>
	        </div>
	        <div class="inputBox">
	            <input type="text" class="form-textbox dateOfBirth" name="designerGen">
	            <span class="form-label">생년월일</span>
	        </div>
			
			<div class="name inputBox">
	            <input type="text" class="form-textbox" name="designerName">
	            <span class="form-label">이름</span>
	        </div>
	        
	        <div class="name inputBox">
	            <input type="email" class="form-textbox" name="designerEmail">
	            <span class="form-label">비밀번호</span>
	        </div>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox phone" name="customerGen">
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
	   </div>
	   </form>
	
</body>
</html>