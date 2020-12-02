<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	String stringResult	;
    	if((String)request.getAttribute("stringResult") !=null){
    		stringResult = (String)request.getAttribute("stringResult");
    	}else{
    		stringResult = "-1";
    	}
    	int option = (Integer)request.getAttribute("option");
    	int intResult ;
    	if((Integer)request.getAttribute("intResult") !=null){
    		intResult = (Integer)request.getAttribute("intResult");
    	}else{
    		intResult = -1;
    	}    	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>찾기 성공</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
	 <% if(!stringResult.equals("-1")) {%>
	 	<h1>당신이 찾는 결과는  [ <%= stringResult%> ]입니다</h1>	 	
	 <% } %>
	  <% if(intResult>0) {%>
	 	<h1>당신이 찾는 결과는  [ <%= intResult%> ]입니다</h1>
	 <% } %>
	 <% if(option == 1) {%>
	 	<button class="btn btn-primary" onclick="location.href='/searchCustomeIdForm'">암호찾기</button>
	 <% } %>
	 	<button class="btn btn-primary" data-toggle="modal" data-target="#loginModal">로그인하기</button>
	 </div> 	
</body>
</html>