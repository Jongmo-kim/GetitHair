<%@page import="admin.model.vo.Admin"%>
<%@page import="hairshop.model.vo.Hairshop"%>
<%@page import="designer.model.vo.Designer"%>
<%@page import="customer.model.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		HttpSession sessions = request.getSession();
		String loginType = (String)session.getAttribute("loginType")==null?"" : (String)session.getAttribute("loginType");
		Customer loginCustomer = null;
		Designer loginDesigner = null;
		Hairshop loginHairshop = null;
		//Admin loginAdmin = null;
		boolean isLogined = false;
		
		switch(loginType) {
		case "customer":
			loginCustomer = (Customer)sessions.getAttribute("loginCustomer");
			isLogined = true;
			break;
		case "designer":
			loginDesigner = (Designer)session.getAttribute("loginDesigner");
			isLogined = true;
			break;
		case "hairshop":
			loginHairshop = (Hairshop)session.getAttribute("loginHairshop");
			isLogined = true;
			break;
		case "admin":
			Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
			isLogined = true;
			break;
	}

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
<link rel="stylesheet" href="/css/signUp/inputBox.css?v=<%=System.currentTimeMillis()%>">
<script type="text/javascript" src="/js/signUp/inputBox.js?v=<%=System.currentTimeMillis()%>"></script>
<link rel="stylesheet" href="/css/header/header.css?v=<%=System.currentTimeMillis()%>">

<header style="display:fixed">
	
<div class="container">	
<%if(isLogined){ %>
	<div class="modal fade" id="loginModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
        		<div class="modal-header">
          			<button type="button" class="close" data-dismiss="modal">&times;</button>
          			<h4 class="modal-title">로그인정보</h4>
        		</div>
			<div class="modal-body">
			
				<div class="btn btn-default"><a style="display:block; height:100%;"href="/custLogout">로그아웃</a></div>
			<%switch(loginType) {
				case "customer": %>
          			<div class="btn btn-default"><a  style="display:block; height:100%;" href="/updateCustomerFrm">마이페이지</a></div>
          			<%break;
			case "designer": %>
          			<div class="btn btn-default"><a  style="display:block; height:100%;" href="/updateCustomerFrm">디자이너마이페이지</a></div>
          			<%break;
			case "hairshop": %>
          			<div class="btn btn-default"><a  style="display:block; height:100%;" href="/updateCustomerFrm">헤어샵페이지</a></div>
          			<%break;
			case "admin": %>
          			<div class="btn btn-default"><a  style="display:block; height:100%;" href="/updateCustomerFrm">어드민페이지</a></div>
          			<%break;
          		} %>
			</div>
		</div>
	</div>
</div>
  <%} else{ %>
  
	
<div class="modal fade" id="loginModal" role="dialog">
		<div class="modal-dialog">
		<form action="/integratedLogin" method="post">
			<div class="modal-content">
        		<div class="modal-header">
        		<h4 class="modal-title">
          			<button type="button" class="close" data-dismiss="modal">&times;</button>
          			<span>
          				<input style="display:none;" id="loginCustomer" type="radio" name="loginType" checked value="customer">
          				<label class="myLabel" for="loginCustomer">손님</label>
          			</span>
          			<span>
          				<input style="display:none;" id="loginDesigner" type="radio" name="loginType" value="designer">
          				<label class="myLabel" for="loginDesigner">디자이너</label>
          			</span>
          			<span>
	          			<input style="display:none;" id="loginHairshop" type="radio" name="loginType" value="hairshop">
	          			<label class="myLabel" for="loginHairshop">헤어샵</label>
          			</span>
          			<span>
	          			<input style="display:none;" id="loginAdmin" type="radio" name="loginType" value="admin">
	          			<label class="myLabel" for="loginAdmin">관리자</label>
          			</span>
          			(으)로 로그인하기
          			</h4>
        		</div>
        	
        		<div class="modal-body">
	          			<div class="name inputBox">
		            		<input type="text" class="form-textbox" name="inputId">
	    	        		<span class="form-label">아이디</span>
		    	   		</div>
		       			<div class="name inputBox">
		            		<input type="text" class="form-textbox" name="inputPw">
		            		<span class="form-label">비밀번호</span>
		       			</div>
				</div>
				<div class="modal-footer">
          			<button type="button" id="searchId" class="btn btn-default">ID찾기</button>
          			<button type="button" id="searchPw" class="btn btn-default">PW찾기</button>
					<button type="submit" class="btn btn-default">제출</button>
					<button type="reset" class="btn btn-default">초기화</button>
				</div>
			</div>
		</form>
	</div>
</div>
  <%} %>
</div>
	<div class="container">
		<ul class="nav nav-pills" role="tablist">
		<%if(isLogined){ %>
			<li style="cursor:pointer"><a data-toggle="modal" data-target="#loginModal">마이페이지</a></li>
		<%}else{  %>
			<li style="cursor:pointer"><a data-toggle="modal" data-target="#loginModal">로그인하기</a></li>
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
	<script>
			$("#searchId").attr("onclick","location.href='/searchCustomerIdForm'");
			$("#searchPw").attr("onclick","location.href='/searchCustomerPwForm'");
		 $("input[name='loginType']").change(function(){	
			 if($(this).val()=='designer'){
				$("#searchId").attr("onclick","location.href='/searchDesignerIdForm'");
				$("#searchPw").attr("onclick","location.href='/searchDesignerPwForm'");
				$("#searchId").show();
				 $("#searchPw").show();
			 }else if($(this).val()=='customer'){
				$("#searchId").attr("onclick","location.href='/searchCustomerIdForm'");
				$("#searchPw").attr("onclick","location.href='/searchCustomerPwForm'");
				$("#searchId").show();
				$("#searchPw").show();
			 }else if($(this).val()=='hairshop'){
				 $("#searchId").hide();
				 $("#searchPw").hide();				 
			 }else if($(this).val()=='admin'){
				 $("#searchId").hide();
				 $("#searchPw").hide();
			 }		 	 
		 });			 
	</script>
</header>