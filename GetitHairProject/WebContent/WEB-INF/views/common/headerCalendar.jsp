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
	
<link rel="stylesheet" href="/css/header/headerdemo.css">
<link rel="stylesheet" href="/css/header/headermultilevelnav.css">
<header>
	<nav>
		<div class='MultiLevelMenu depth-1'>
			<ul class='menu con'>
				<li class='MultiItem'><a class="MultiLink" href='#'>HOME</a></li>
				<li class='MultiItem'><a class="MultiLink" href='#'>STYLE</a></li>
				<li class='MultiItem'><a class="MultiLink" href='#'>MY PAGE</a>

					<div class='MultiLevelMenu depth-2'>
						<ul class='menu'>
							<li class='MultiItem'>
								<a class="MultiLink" href='#'>예약관리</a>
							</li>
							<li class='MultiItem'>
								<a class="MultiLink" href='#'>포트폴리오</a>
							</li>
							<li class='MultiItem'>
								<a class="MultiLink" href='#'>리뷰관리</a>
							</li>
							<li class='MultiItem'>
								<a class="MultiLink" href='#'>내 정보</a>
							</li>
						</ul>
					</div></li>
				<li class='MultiItem'>
					<a class="MultiLink" href='#'>LOGOUT</a>
				</li>
			</ul>
		</div>
	</nav>
</header>