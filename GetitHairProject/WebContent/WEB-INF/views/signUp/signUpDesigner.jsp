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
	<form action="/signUpDesigner" method="post" enctype="multipart/form-data">
		<input type="hidden" name="designerNo" value="-1">
	    <div class="container">
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="designerId">
	            <span class="form-label">아이디</span>
	        </div>
	        <div class="date inputBox">
	            <input type="password" class="form-textbox" name="designerPw">
	            <span class="form-label">비밀번호</span>
	        </div>
			
			<div class="name inputBox">
	            <input type="text" class="form-textbox" name="designerName">
	            <span class="form-label">이름</span>
	        </div>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox phoneInput" name="designerPhone">
	            <span class="form-label">전화번호</span>
	        </div>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="designerYear">
	            <span class="form-label">경력(년)</span>
	        </div>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="designerRank">
	            <span class="form-label">직급</span>
	        </div>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="designerIntro">
	            <textarea></textarea>
	            <span class="form-label">소개글</span>
	        </div>
	        <div class="name inputBox">
	        	이미지
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