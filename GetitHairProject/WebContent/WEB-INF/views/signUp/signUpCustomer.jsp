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
	    <div class="container">
        <div class="name inputBox">
            <input type="text" class="form-textbox">
            <span class="form-label">이름</span>
        </div>
        <div class="addr inputBox">
            <input type="text" class="form-textbox dateOfBirth">
            <span class="form-label">생년월일</span>
        </div>

    </div>
	
</body>
</html>