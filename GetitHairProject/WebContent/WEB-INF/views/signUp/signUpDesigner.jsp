<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너 회원가입페이지</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<link rel="stylesheet" href="/css/signUp/inputBox.css">
	<script type="text/javascript" src="/js/signUp/inputBox.js"></script>
	<form action="/signUpDesigner" method="post" enctype="multipart/form-data">
		<input type="hidden" name="designerNo" value="-1">
	    <div class="container">
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" id="idInput" name="designerId">
	            <span class="form-label">아이디</span>
	            <span class="additional-info" id="idInfo"></span>
	        </div>
	        <div class="date inputBox">
	            <input type="password" class="form-textbox" id="pwInput"name="designerPw">
	            <span class="form-label">비밀번호</span>
	            <span class="additional-info" id="pwInfo"></span>
	        </div>
			
			<div class="name inputBox">
	            <input type="text" class="form-textbox" id="nameInput" name="designerName">
	            <span class="form-label">이름</span>
	            <span class="additional-info" id="nameInfo"></span>
	        </div>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox phoneInput" id="phoneInput" name="designerPhone">
	            <span class="form-label">전화번호</span>
	            <span class="additional-info" id="phoneInfo"></span>
	        </div>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" id="yearInput" name="designerYear">
	            <span class="form-label">경력(년)</span>
	            <span class="additional-info" id="yearInfo"></span>
	        </div>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" id="rankInput" name="designerRank">
	            <span class="form-label">직급</span>
	            <span class="additional-info" id="rankInfo"></span>
	        </div>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="designerIntro">
	            <span class="form-label">소개글</span>
	        </div>
	        <div class="name inputBox">이미지
	            <input type="filename">
	        </div>
	        <div class="name">
		        <button class="btn btn-primary">제출</button>
		        <button class="btn btn-primary" type="reset">초기화</button>
	        </div>
	   </div>
	   </form>
</body>
</html>