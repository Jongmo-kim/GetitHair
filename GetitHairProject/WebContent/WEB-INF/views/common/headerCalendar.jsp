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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


<script src='calendarapi/lib/main.js'></script>
<link href='calendarapi/lib/main.css' rel='stylesheet' />

<!-- <link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' /> -->
<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
<link rel="stylesheet" href="https://bootswatch.com/4/lux/bootstrap.min.css">



<style>
.mymodal-dialog {
    max-width: 750px;
    margin: 1.75rem auto;
}
.ignoremargin{
	margin-right:0px;
	margin-left: 0px;
}
</style>

<nav class="navbar navbar-expand-sm navbar-light">
        <div class="container">
            <a class="navbar-brand" href="/">GET IT HAIR</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsExample07">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/hairshop">SHOP<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/style">STYLE</a>
                    </li>
                    <%switch(loginType) {
					case "customer": %>
          				
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="/mypageCust?selStatus=전체&reqPage=1" id="dropdown07" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MY PAGE</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown07">
                            <a class="dropdown-item" href="/mypageCust?selStatus=전체&reqPage=1">예약관리</a>
                            <a class="dropdown-item" href="/mypageCustReviewList?customerNo=<%=loginCustomer.getCustomerNo()%>&reqPage=1">리뷰관리</a>
                            <a class="dropdown-item" href="/updateAllCustomerFrm?customerNo=<%=loginCustomer.getCustomerNo()%>">내 정보수정</a>
                        </div>
                    </li>
          			<%break;
					case "designer": %>
          			   <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="/mypageDesigner" id="dropdown07" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MY PAGE</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown07">
                            <a class="dropdown-item" href="/designerReserve?DesignerNo=<%=loginDesigner.getDesignerNo()%>">예약관리</a>
                            <a class="dropdown-item" href="/designerPortfolioList">포트폴리오</a>
                            <a class="dropdown-item" href="/designerReviewList?designerNo=<%=loginDesigner.getDesignerNo()%>">리뷰관리</a>
                            <a class="dropdown-item" href="/designerProfile?designerId=<%=loginDesigner.getDesignerId()%>">내 정보</a>
                        </div>
                    </li>
          			<%break;
					case "hairshop": %>
          			<li class="nav-item"><a  style="display:block; height:100%;" href="#">헤어샵으로 로그인하셨습니다.</a></li>
          			<%break;
					case "admin": %>
          			<li class="nav-item">
                        <a class="nav-link" href="/mypageAdmin">ADMIN</a>
                    </li>
          			<%break;
          			} %>
          			
                </ul>
                <div class="form-inline my-2 my-md-0">
                	<%if(loginType.equals("")){ %>
                    <button class="btn my-2 my-sm-0" type="button" data-toggle="modal" data-target="#loginModal">LOGIN</button>
                    <!-- Single button -->
                    <div class="btn-group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            SIGN UP <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a class="dropdown-item" href="/signUpCustomerForm">일반회원가입</a></li>
                            <li><a class="dropdown-item" href="/signupDesignerForm">디자이너회원가입</a></li>
                        </ul>
                    </div>
                    <%} else {%>
	                	<a href="/integratedLogout" class="btn my-2 my-sm-0">LOGOUT</a>
                    <%} %>
                </div>
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