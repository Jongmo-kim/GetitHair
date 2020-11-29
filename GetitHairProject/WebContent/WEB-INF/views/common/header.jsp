<%@page import="customer.model.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		HttpSession sessions = request.getSession();
		Customer loginCustomer = (Customer)sessions.getAttribute("loginCustomer");
	%>
<!-- 글꼴 호출 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!-- //글꼴 호출 -->

<!-- 부트스트랩 호출 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- //부트스트랩 호출 -->

<!-- jQuery 호출 -->
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<!-- //jQuery 호출 -->
<link rel="stylesheet" href="/css/header/header.css">
<link rel="stylesheet" href="/css/signUp/inputBox.css">
<script type="text/javascript" src="/js/signUp/inputBox.js"></script>
<header>
	<h1>header입니다</h1>
	<style>
		.myLabel:hover{
			color:var(--wine);
		}
		input[name='loginType']:checked label {
			display:none;
		}
	</style>
<div class="container">	
<%if(loginCustomer==null){ %>

	<div class="modal fade" id="loginModal" role="dialog">
		<div class="modal-dialog">
		<form action="/integratedLogin" method="post">
			<div class="modal-content">
        		<div class="modal-header">
        		<h4 class="modal-title">
          			<button type="button" class="close" data-dismiss="modal">&times;</button>
          			<span><label class="myLabel" for="loginCustomer">손님</label><input style="" id="loginCustomer" type="radio" name="loginType" checked value="customer"></span>
          			<span><label class="myLabel" for="loginDesigner">디자이너</label><input style="display:block;" id="loginDesigner" type="radio" name="loginType" value="designer"></span>
          			<span><label class="myLabel" for="loginHairshop">헤어샵</label><input style="display:block;" id="loginHairshop" type="radio" name="loginType" value="hairshop"></span>
          			<span><label class="myLabel" for="loginAdmin">관리자</label><input style="display:block;" id="loginAdmin" type="radio" name="loginType" value="admin"></span>
          			으로 로그인하기
          			</h4>
        		</div>
        	
        		<div class="modal-body">
          			<p>로그인</p>
	          			<div class="name inputBox">
		            		<input type="text" class="form-textbox" name="customerId">
	    	        		<span class="form-label">아이디</span>
		    	   		</div>
		       			<div class="name inputBox">
		            		<input type="text" class="form-textbox" name="customerPw">
		            		<span class="form-label">비밀번호</span>
		       			</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">제출</button>
					<button type="reset" class="btn btn-default">초기화</button>
				</div>
			</div>
		</form>
	</div>
</div>
  <%} else{ %>
  
	<div class="modal fade" id="loginModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
        		<div class="modal-header">
          			<button type="button" class="close" data-dismiss="modal">&times;</button>
          			<h4 class="modal-title">손님 마이페이지</h4>
        		</div>
        	<form action="/custLogin" method="post">
        		<div class="modal-body">
          			<div class="btn btn-default"><a style="display:block; height:100%" href="/custLogout">로그아웃</a></div>
				</div>
			</form>
			<div class="modal-body">
          			<div class="btn btn-default"><a style="display:block; height:100%" href="/updateCustomerFrm">마이페이지</a></div>
				</div>
		</div>
	</div>
</div>
  <%} %>
</div>
	<div class="container">
		<ul class="nav nav-pills" role="tablist">
		<%if(loginCustomer==null){ %>
			<li style="cursor:pointer"><a data-toggle="modal" data-target="#loginModal">로그인하기</a></li>
		<%}else{  %>
				<li style="cursor:pointer"><a data-toggle="modal" data-target="#loginModal">마이페이지</a></li>
		<%} %>
			<li class="active"><a href="/">Home</a></li>
			
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">디버그모드 활성화<span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="/debugMode?isDebugmode='true'">디버그모드 켜기</a></li>
					<li><a href="/debugMode?isDebugmode='false'">디버그모드 끄기</a></li>
					<li><a href="/showUsingDebug">디버그모드 객체넣어 테스트</a></li>
					<li><a href="/showUsingDebug">서블렛테스트버튼</a></li>
					<li><a href="/testForm">testJsp</a></li>
				</ul>
			</li>
			
			<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">회원가입 목록<span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="/signUpCustomerForm">고객회원가입</a></li>
					<li><a href="/signupDesignerForm">디자이너가입</a></li>
					<li><a href="#">헤어샵등록</a></li>
				</ul>
			</li>
			

			
			<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">관리자<span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="/mypageAdmin">관리자페이지</a></li>
				</ul>
			</li>
			
			<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">손님<span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="/mypageCust?selStatus=전체&reqPage=1">손님페이지</a></li>
				</ul>
			</li>
			
			<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">디자이너<span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="/mypageDesigner">디자이너페이지</a></li>
				</ul>
			</li>
			
			<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">상세페이지<span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
	        		<li><a href="/hairshopDeta">헤어샵 상세보기</a></li>
				</ul>
			</li>
			<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">헤어샵<span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
	        		<li><a href="/">관리자페이지</a></li>
				</ul>
			</li>
		</ul>
	</div>
</header>