<%@page import="java.util.ArrayList"%>
<%@page import="hairshop.model.service.HairshopService"%>
<%@page import="designer.model.dao.DesignerDao"%>
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
	<link rel="stylesheet" href="/css/signUp/signUpDesigner.css?v=<%=System.currentTimeMillis()%>">
	<script type="text/javascript" src="/js/signUp/signUpDesigner.js?v=<%=System.currentTimeMillis()%>"></script>
	<form action="/signUpDesigner" method="post" enctype="multipart/form-data">
		<input type="hidden" name="designerNo" value="-1">
	   	<div class="container">
	   	<hr>
	   	<br>
	   	<br>
	    <h2>Get it hair</h2>
	    <h3>회원가입</h3>
	    <p>이미 Get it hair의 디자이너이신가요? 
	    <%if(loginDesigner == null){%>
	    <a href="/searchDesignerIdForm">ID</a> / <a href="/searchDesignerPwForm">PW</a>찾기</p>
	    <%} %>
	    <p style="font-size:14px;">가입을 하면 Get it hair의 이용약관, <a href="/views/signup/terms.jsp">개인정보취급방침</a> 및 <a href="/views/signup/privacy.jsp">개인정보3자제공</a>에 동의하게 됩니다.<p>
	    <br>
	    <hr>
	   		<div class="name inputBox">
	            <input type="text" class="form-textbox" id="nameInput" name="designerName">
	            <span class="form-label">이름</span>
	            <span class="additional-info" id="nameInfo"></span>
	        </div>
	        <hr>
	        <br>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" id="idInput" name="designerId">
	            <span class="form-label">아이디</span>
	            <span class="additional-info" id="idInfo"></span>
	        </div>
	        <hr>
	        <br>
	        <div class="date inputBox">
	            <input type="password" class="form-textbox" id="pwInput"name="designerPw">
	            <span class="form-label">비밀번호</span>
	            <span class="additional-info" id="pwInfo"></span>
	        </div>
	          <div class="date inputBox">
	            <input type="password" class="form-textbox" id="pwreInput"name="designerPw">
	            <span class="form-label">비밀번호 확인</span>
	            <span class="additional-info" id="pwreInfo"></span>
	        </div>
			<hr>
	        <br>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox phoneInput" id="phoneInput" name="designerPhone">
	            <span class="form-label">전화번호</span>
	            <span class="additional-info" id="phoneInfo"></span>
	        </div>
	        <hr>
	        <br>
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
	        <hr>
	        <br>
	        <div class="name inputBox"> 대표 이미지
	            <input type="file" name="filename">
	        </div>
	        <div class="name">
		        <button class="btn" id="submitBtn">제출</button>
		        <button class="btn resetBtn" type="reset">초기화</button>
	        </div>
	   </div>
	   </form>
</body>
</html>