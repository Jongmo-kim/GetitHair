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
		Admin loginAdmin = null;
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
			loginAdmin = (Admin)session.getAttribute("loginAdmin");
			isLogined = true;
			break;
	}

	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>메인페이지</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@1&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!-- 글꼴 호출 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<!-- jQuery, bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>

<!-- CSS inputBox -->
<link rel="stylesheet"
	href="/css/signUp/inputBox.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="/css/header/header2.css">
<script type="text/javascript"
	src="/js/signUp/inputBox.js?v=<%=System.currentTimeMillis()%>"></script>

<style>
/* navi bar css */
.index-nav {
	width: 100%;
	position: absolute;
	top: 0;
	display: flex;
	z-index: 1000;
}

.index-nav>.nav-wrap {
	width: 1200px;
	margin: 0 auto;
	display: flex;
	justify-content: flex-end;
}

.nav-menu {
	margin: 0 10px;
	width: 110px;
	height: 90px;
	text-align: center;
	line-height: 90px;
	font-size: 16px;
}

.nav-menu>a {
	display: block;
	text-decoration: none;
	color: #fff;
	width: 100%;
	text-shadow: 2px 2px 1px rgba(0, 0, 0, .1), 0 0 2px rgba(0, 0, 0, .2);
}

.nav-menu:hover {
	font-weight: bold;
}

.nav-logo {
	margin: 0 10px;
	width: 150px;
	height: 90px;
	text-align: center;
	line-height: 90px;
	font-size: 25px;
}

.nav-logo>a {
	display: block;
	text-decoration: none;
	color: #fff;
	width: 100%;
}

.index-nav>.nav-logo {
	justify-content: flex-start;
}

.nav-logo-wrap {
	height: 60px;
	line-height: 65px;
	justify-content: flex-start;
}

/****************************/
body {
	padding: 0;
	margin: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

.main {
	height: 100vh;
	width: 100vw;
	background-image: url(img/main/mainbg.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}

.wrap {
	background-color: rgba(0, 0, 0, 0.5);
	position: absolute;
	width: 100vw;
	height: 100vh;
	top: 0px;
	left: 0px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.start-btn {
	display: inline-block;
	width: 270px;
	height: 60px;
	text-decoration: none;
	color: white;
	font-size: 20px;
	background: #8C2E40;
	border-radius: 30px;
	text-align: center;
	line-height: 60px;
	margin: 20px;
	box-shadow: 2px 2px 6px rgba(0, 0, 0, .1), 0 0 2px rgba(0, 0, 0, .2);
	transition-duration: 0.5s;
}

.start-btn:hover {
	background-color: #D9ABA0;
}

.title {
	font-size: 120px;
	color: #D9ABA0;
	font-family: 'DM Serif Display', serif;
	margin: 0;
	text-shadow: 2px 2px 1px rgba(140, 46, 64, 0.5), 0 0 2px
		rgba(140, 46, 64, 0.2);
	/*text-shadow: 2px 2px 6px rgba(0, 0, 0, .1), 0 0 2px rgba(0, 0, 0, .2);*/
}

.comm-wrap {
	margin-bottom: 10px;
	padding-top: 0px;
}

.coment {
	text-align: center;
	color: #fff;
	margin: 8px;
	text-shadow: 2px 2px 1px rgba(0, 0, 0, .1), 0 0 2px rgba(0, 0, 0, .2);
}

.wrap>h1 {
	font-size: 50px;
	color: #D9ABA0;
	margin: 0;
}

.login-text {
	display: block;
	font-weight: bold;
	color: #D9ABA0;
}
</style>
</head>

<body>
	<div class="index-nav">
		<div class="nav-wrap">
			<div class="nav-menu">
				<a href="/hairshop">헤어샵</a>
			</div>
			<div class="nav-menu">
				<a href="/style">스타일</a>
			</div>
			<div class="nav-menu">
				<a style="color: #fff" data-toggle="modal" data-target="#loginModal">로그인</a>
			</div>
			<div class="nav-menu">
				<a href="/signUpCustomer">회원가입</a>
			</div>
		</div>
	</div>
	<div class="modal fade" id="loginModal" role="dialog">
		<div class="modal-dialog">
			<form action="/integratedLogin" method="post">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<span> <input style="display: none;" id="loginCustomer"
								type="radio" name="loginType" checked value="customer">
								<label class="myLabel" for="loginCustomer">손님</label>
							</span> <span> <input style="display: none;" id="loginDesigner"
								type="radio" name="loginType" value="designer"> <label
								class="myLabel" for="loginDesigner">디자이너</label>
							</span> <span> <input style="display: none;" id="loginHairshop"
								type="radio" name="loginType" value="hairshop"> <label
								class="myLabel" for="loginHairshop">헤어샵</label>
							</span> <span> <input style="display: none;" id="loginAdmin"
								type="radio" name="loginType" value="admin"> <label
								class="myLabel" for="loginAdmin">관리자</label>
							</span> (으)로 로그인하기
						</h4>
					</div>

					<div class="modal-body">
						<div class="name inputBox">
							<input type="text" class="form-textbox" name="inputId"> <span
								class="form-label">아이디</span>
						</div>
						<div class="name inputBox">
							<input type="text" class="form-textbox" name="inputPw"> <span
								class="form-label">비밀번호</span>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="searchId" class="btn btn-default">ID찾기</button>
						<button type="button" id="searchPw" class="btn btn-default">PW찾기</button>
						<button type="submit" class="btn btn-default">로그인</button>
						<button type="reset" class="btn btn-default">초기화</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!--
   #8C2E40 rgb(140, 46, 64)
#59362E rgb(89, 54, 46)
#A6756A rgb(166, 117, 106)
#D9ABA0 rgb(217, 171, 160)
#260101 rgb(38, 1, 1)
   -->
	<section>
	<div class="main"></div>
	<div class="wrap">
		<p class="title">Get it Hair</p>
		<div class="comm-wrap">
			<p class="coment">요즘 핫한 스타일링, 헤어샵, 디자이너를 한 곳에,</p>
			<p class="coment">당신이 원하는 스타일링을 지금 찾아보세요.</p>
		</div>

		<a href="/hairshop" class="start-btn">시작하기</a>
		<!-- <a href="#loginModal" class="login-text">로그인</a>
            <a href="#loginModal" class="login-text">회원가입</a> -->
	</div>
	</section>
	<script>
    $(function(){
    	//ID/PW찾기 버튼 기능
    	$("#searchId").attr("onclick","location.href='/searchCustomerIdForm'");
		$("#searchPw").attr("onclick","location.href='/searchCustomerPwForm'");
		$("")
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
    });					 
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>