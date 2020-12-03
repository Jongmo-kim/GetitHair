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

<!-- 글꼴 호출 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- jQuery, bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>

<!-- CSS inputBox -->
<link rel="stylesheet" href="/css/signUp/inputBox.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="/css/header/header2.css">
<script type="text/javascript" src="/js/signUp/inputBox.js?v=<%=System.currentTimeMillis()%>"></script>
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

<nav class="navbar navbar-expand-sm navbar-light">
        <div class="container">
            <a class="navbar-brand" href="/">GET IT HAIR</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsExample07">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/hairshop">HOME<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">STYLE</a>
                    </li>
                    <%if(loginDesigner!=null) { %>
                    <!-- 디자이너 -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="/mypageDesigner" id="dropdown07" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MY PAGE</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown07">
                            <a class="dropdown-item" href="/designerReserve?DesignerNo=<%=loginDesigner.getDesignerNo()%>">예약관리</a>
                            <a class="dropdown-item" href="/designerPortfolioList">포트폴리오</a>
                            <a class="dropdown-item" href="/designerReviewList?designerNo=<%=loginDesigner.getDesignerNo()%>">리뷰관리</a>
                            <a class="dropdown-item" href="/designerProfile?designerId=<%=loginDesigner.getDesignerId()%>">내 정보</a>
                        </div>
                    </li>
                    <%} %>
                    <%if(loginCustomer!=null){ %>
                    <!-- 일반손님 -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="/mypageCust?selStatus=전체&reqPage=1" id="dropdown07" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MY PAGE</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown07">
                            <a class="dropdown-item" href="#">예약관리</a>
                            <a class="dropdown-item" href="#">리뷰관리</a>
                            <a class="dropdown-item" href="#">내 정보</a>
                        </div>
                    </li>
                    <%} %>
                    <%if(loginAdmin!=null){ %>
                    <!-- 관리자 -->
                    <li class="nav-item">
                        <a class="nav-link" href="/mypageAdmin">ADMIN</a>
                    </li>
                    <%} %>
                </ul>
                <form class="form-inline my-2 my-md-0">
                	<%if(loginType!=null){ %>
                    <button class="btn my-2 my-sm-0" type="button" data-toggle="modal" data-target="#loginModal">LOGIN</button>
                    <!-- Single button -->
                    <div class="btn-group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            SIGN UP <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a class="dropdown-item" href="#">일반회원가입</a></li>
                            <li><a class="dropdown-item" href="#">디자이너회원가입</a></li>
                        </ul>
                    </div>
                    <%} %>
                    <%if(loginType==null){ %>
                    <button class="btn my-2 my-sm-0" type="button">LOGOUT</button>
                    <%} %>
                </form>
            </div>
        </div>
    </nav>


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