
<%@page import="hairinfo.model.vo.Hairinfo"%>
<%@page import="customer.model.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Customer customer = (Customer) request.getAttribute("customer");
	Hairinfo hairinfo = (Hairinfo) request.getAttribute("hairinfo");
	String msg = (String) request.getAttribute("msg");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
<!-- jQuery 호출 -->
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var print= '<%=msg %>';
		if(print!=''){
			alert(print);
		}	
	}
</script>
<style>
	input[type="radio"] {
		display:none;
	}
	input[type="radio"] + label{
		width: 90px;
		text-align: center;
		border-radius: 5px;
		font-size:17px;
	}
	input[type="radio"]:checked + label {
		background-color: var(--black);
		color: white;
	}
	
	.infoTable,.btnTd{
		text-align: center;
	}
	.btnTd>*{
		display:block;
		float:left;
		width:40%;
		margin: 20px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
	<h1>회원정보수정</h1>
	<form action="/updateAllCustomer" method="post">
		<table class="table infoTable" style="width:70%;text-align:left;">
			<tr>
				<th>회원번호</th>
				<td><input type="text" name="customerNo"
					value="<%=customer.getCustomerNo()%>" readonly></td>
					<td></td>
			</tr>
			<tr>
				<th>회원아이디</th>
				<td><input type="text" id="idInput"
								name="customerId" value="<%=customer.getCustomerId() %>" readonly>				
					</td>
			</tr>
			<tr>
				<th>회원암호</th>
				<td><input type="password" id ="pwInput"
							name="customerPw" value="<%=customer.getCustomerPw()%>">
					<span id="pwInfo"></span>				
				</td>
			</tr>
			<tr>
				<th>회원암호 확인</th>
				<td><input type="password" id ="pwreInput"
							name="customerPwRe" value="<%=customer.getCustomerPw()%>">
					<span id="pwreInfo"></span>
							</td>
			</tr>
			<tr>
				<th>회원생년월일</th>
				<td><input type="text" name="customerBirthdate"
					value="<%=customer.getCustomerBirthdate()%>" readonly></td>
			</tr>
			<tr>
				<th>회원성별</th>
				<td>
				<div class="name inputBox">
				<%if (customer.getCustomerGen().equals("남성")){ %>					
				<input type="radio" id="signupMale" name="customerGen" value="남성"readonly checked >
				<label for="signupMale">남자</label>
				<input type="radio" id="signupFemale" name="customerGen" value="여성" readonly>
				<label for="signupFemale">여자</label>		      		
				<% }else{ %>
				<input type="radio" id="signupMale" name="customerGen" value="남성" readonly>
				<label for="signupMale">남자</label>
				<input type="radio" id="signupFemale" name="customerGen" value="여성" readonly checked>
				<label for="signupFemale">여자</label>	
				<% } %>
				 </div>
				</td>
			</tr>
			<tr>
				<th>회원이름</th>
				<td><input type="text" name="customerName"
					value="<%=customer.getCustomerName()%>" readonly>
					
					</td>
			</tr>
			<tr>
				<th>회원이메일</th>
				<td><input type="text" name="customerEmail" id ="emailInput"
					value="<%=customer.getCustomerEmail()%>">
					<span id="emailInfo"></span>
					</td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="customerAddr" id ="addrInput"
					value="<%=customer.getCustomerAddr()%>">
					<span id="addrInfo"></span>
					</td>
			</tr>
			<tr>
				<th>회원휴대전화번호</th>
				<td><input type="text" name="customerPhone" id="phoneInput" class="phoneInput"
					value="<%=customer.getCustomerPhone()%>">
					<span id="phoneInfo"></span>
				</td>
			</tr>			
			<tr>
				<th>상세주소</th>
				<td><input type="text" name="addrPostcode"
					value="<%=customer.getAddrDetail()%>"></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="addrDetail"
					value="<%=customer.getAddrPostcode()%>" readonly></td>
			</tr>
			<tr>
				<th>회원가입일</th>
				<td><input type="text" name="customerEnrolldate"
					value="<%=customer.getCustomerEnrolldate()%>" readonly></td>
			</tr>
			<tr>
				<th>1.두피상태</th>
				<td>
					<%
						if (hairinfo.getMyhairScalp().equals("")) {
					%> <input type="radio"
					id="oilySkinScalp" name="myhairScalp" value="지성"> <label
					for="oilySkinScalp">지성</label> <input type="radio"
					id="drySkinScalp" name="myhairScalp" value="건성"> <label
					for="drySkinScalp">건성</label> <input type="radio"
					id="dandruffSkinScalp" name="myhairScalp" value="비듬"> <label
					for="dandruffSkinScalp">비듬/지루성</label> <input type="radio"
					id="sensitiveSkinScalp" name="myhairScalp" value="민감성"> <label
					for="sensitiveSkinScalp">민감성</label> <input type="radio"
					id="normalSkinScalp" name="myhairScalp" value="중성"> <label
					for="normalSkinScalp">중성</label> <input type="radio"
					id="scalpNotKnowScalp" name="myhairScalp" value="모름"> <label
					for="scalpNotKnowScalp">모름</label> <%
 	} else if (hairinfo.getMyhairScalp().equals("지성")) {
 %>
					<input type="radio" id="oilySkinScalp" name="myhairScalp"
					value="지성" checked> <label for="oilySkinScalp">지성</label> <input
					type="radio" id="drySkinScalp" name="myhairScalp" value="건성">
					<label for="drySkinScalp">건성</label> <input type="radio"
					id="dandruffSkinScalp" name="myhairScalp" value="비듬"> <label
					for="dandruffSkinScalp">비듬/지루성</label> <input type="radio"
					id="sensitiveSkinScalp" name="myhairScalp" value="민감성"> <label
					for="sensitiveSkinScalp">민감성</label> <input type="radio"
					id="normalSkinScalp" name="myhairScalp" value="중성"> <label
					for="normalSkinScalp">중성</label> <input type="radio"
					id="scalpNotKnowScalp" name="myhairScalp" value="모름"> <label
					for="scalpNotKnowScalp">모름</label> <%
 	} else if (hairinfo.getMyhairScalp().equals("건성")) {
 %>
					<input type="radio" id="oilySkinScalp" name="myhairScalp"
					value="지성"> <label for="oilySkinScalp">지성</label> <input
					type="radio" id="drySkinScalp" name="myhairScalp" value="건성"
					checked> <label for="drySkinScalp">건성</label> <input
					type="radio" id="dandruffSkinScalp" name="myhairScalp" value="비듬">
					<label for="dandruffSkinScalp">비듬/지루성</label> <input type="radio"
					id="sensitiveSkinScalp" name="myhairScalp" value="민감성"> <label
					for="sensitiveSkinScalp">민감성</label> <input type="radio"
					id="normalSkinScalp" name="myhairScalp" value="중성"> <label
					for="normalSkinScalp">중성</label> <input type="radio"
					id="scalpNotKnowScalp" name="myhairScalp" value="모름"> <label
					for="scalpNotKnowScalp">모름</label> <%
 	} else if (hairinfo.getMyhairScalp().equals("비듬")) {
 %>
					<input type="radio" id="oilySkinScalp" name="myhairScalp"
					value="지성"> <label for="oilySkinScalp">지성</label> <input
					type="radio" id="drySkinScalp" name="myhairScalp" value="건성">
					<label for="drySkinScalp">건성</label> <input type="radio"
					id="dandruffSkinScalp" name="myhairScalp" value="비듬" checked>
					<label for="dandruffSkinScalp">비듬/지루성</label> <input type="radio"
					id="sensitiveSkinScalp" name="myhairScalp" value="민감성"> <label
					for="sensitiveSkinScalp">민감성</label> <input type="radio"
					id="normalSkinScalp" name="myhairScalp" value="중성"> <label
					for="normalSkinScalp">중성</label> <input type="radio"
					id="scalpNotKnowScalp" name="myhairScalp" value="모름"> <label
					for="scalpNotKnowScalp">모름</label> <%
 	} else if (hairinfo.getMyhairScalp().equals("민감성")) {
 %>
					<input type="radio" id="oilySkinScalp" name="myhairScalp"
					value="지성"> <label for="oilySkinScalp">지성</label> <input
					type="radio" id="drySkinScalp" name="myhairScalp" value="건성">
					<label for="drySkinScalp">건성</label> <input type="radio"
					id="dandruffSkinScalp" name="myhairScalp" value="비듬"> <label
					for="dandruffSkinScalp">비듬/지루성</label> <input type="radio"
					id="sensitiveSkinScalp" name="myhairScalp" value="민감성" checked>
					<label for="sensitiveSkinScalp">민감성</label> <input type="radio"
					id="normalSkinScalp" name="myhairScalp" value="중성"> <label
					for="normalSkinScalp">중성</label> <input type="radio"
					id="scalpNotKnowScalp" name="myhairScalp" value="모름"> <label
					for="scalpNotKnowScalp">모름</label> <%
 	} else if (hairinfo.getMyhairScalp().equals("중성")) {
 %>
					<input type="radio" id="oilySkinScalp" name="myhairScalp"
					value="지성"> <label for="oilySkinScalp">지성</label> <input
					type="radio" id="drySkinScalp" name="myhairScalp" value="건성">
					<label for="drySkinScalp">건성</label> <input type="radio"
					id="dandruffSkinScalp" name="myhairScalp" value="비듬"> <label
					for="dandruffSkinScalp">비듬/지루성</label> <input type="radio"
					id="sensitiveSkinScalp" name="myhairScalp" value="민감성"> <label
					for="sensitiveSkinScalp">민감성</label> <input type="radio"
					id="normalSkinScalp" name="myhairScalp" value="중성" checked>
					<label for="normalSkinScalp">중성</label> <input type="radio"
					id="scalpNotKnowScalp" name="myhairScalp" value="모름"> <label
					for="scalpNotKnowScalp">모름</label> <%
 	} else if (hairinfo.getMyhairScalp().equals("모름")) {
 %>
					<input type="radio" id="oilySkinScalp" name="myhairScalp"
					value="지성"> <label for="oilySkinScalp">지성</label> <input
					type="radio" id="drySkinScalp" name="myhairScalp" value="건성">
					<label for="drySkinScalp">건성</label> <input type="radio"
					id="dandruffSkinScalp" name="myhairScalp" value="비듬"> <label
					for="dandruffSkinScalp">비듬/지루성</label> <input type="radio"
					id="sensitiveSkinScalp" name="myhairScalp" value="민감성"> <label
					for="sensitiveSkinScalp">민감성</label> <input type="radio"
					id="normalSkinScalp" name="myhairScalp" value="중성"> <label
					for="normalSkinScalp">중성</label> <input type="radio"
					id="scalpNotKnowScalp" name="myhairScalp" value="모름" checked>
					<label for="scalpNotKnowScalp">모름</label> <%
 	}
 %>
				</td>
			</tr>
			<tr>
				<th>2.곱슬정도</th>
				<td>
					<%
						if (hairinfo.getMyhairCurly().equals("")) {
					%> <input type="radio"
					id="nomalCurly" name="myhairCurly" value="곱슬"> <label
					for="nomalCurly">곱슬</label> <input type="radio" id="semiCurly"
					name="myhairCurly" value="반곱슬"> <label for="semiCurly">반곱슬</label>
					<input type="radio" id="straightCurly" name="myhairCurly"
					value="직모"> <label for="straightCurly">직모</label> <input
					type="radio" id="curlyNotKnow" name="myhairCurly" value="모름">
					<label for="curlyNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairCurly().equals("곱슬")) {
 %>
					<input type="radio" id="nomalCurly" name="myhairCurly" value="곱슬"
					checked> <label for="nomalCurly">곱슬</label> <input
					type="radio" id="semiCurly" name="myhairCurly" value="반곱슬">
					<label for="semiCurly">반곱슬</label> <input type="radio"
					id="straightCurly" name="myhairCurly" value="직모"> <label
					for="straightCurly">직모</label> <input type="radio"
					id="curlyNotKnow" name="myhairCurly" value="모름"> <label
					for="curlyNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairCurly().equals("반곱슬")) {
 %>
					<input type="radio" id="nomalCurly" name="myhairCurly" value="곱슬">
					<label for="nomalCurly">곱슬</label> <input type="radio"
					id="semiCurly" name="myhairCurly" value="반곱슬" checked> <label
					for="semiCurly">반곱슬</label> <input type="radio" id="straightCurly"
					name="myhairCurly" value="직모"> <label for="straightCurly">직모</label>
					<input type="radio" id="curlyNotKnow" name="myhairCurly" value="모름">
					<label for="curlyNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairCurly().equals("직모")) {
 %>
					<input type="radio" id="nomalCurly" name="myhairCurly" value="곱슬">
					<label for="nomalCurly">곱슬</label> <input type="radio"
					id="semiCurly" name="myhairCurly" value="반곱슬"> <label
					for="semiCurly">반곱슬</label> <input type="radio" id="straightCurly"
					name="myhairCurly" value="직모" checked> <label
					for="straightCurly">직모</label> <input type="radio"
					id="curlyNotKnow" name="myhairCurly" value="모름"> <label
					for="curlyNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairCurly().equals("모름")) {
 %>
					<input type="radio" id="nomalCurly" name="myhairCurly" value="곱슬">
					<label for="nomalCurly">곱슬</label> <input type="radio"
					id="semiCurly" name="myhairCurly" value="반곱슬"> <label
					for="semiCurly">반곱슬</label> <input type="radio" id="straightCurly"
					name="myhairCurly" value="직모"> <label for="straightCurly">직모</label>
					<input type="radio" id="curlyNotKnow" name="myhairCurly" value="모름"
					checked> <label for="curlyNotKnow">모름</label> <%
 	}
 %>
				</td>
			</tr>
			<tr>
				<th>3.머리숱</th>
				<td>
					<%
						if (hairinfo.getMyhairRich().equals("")) {
					%> <input type="radio"
					id="heavyRich" name="myhairRich" value="많음"> <label
					for="heavyRich">많음</label> <input type="radio" id="MediumRich"
					name="myhairRich" value="보통"> <label for="MediumRich">보통</label>
					<input type="radio" id="LessRich" name="myhairRich" value="적음">
					<label for="LessRich">적음</label> <input type="radio" id="LossRich"
					name="myhairRich" value="탈모"> <label for="LossRich">탈모</label>
					<input type="radio" id="richNotKnow" name="myhairRich" value="모름">
					<label for="richNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairRich().equals("많음")) {
 %>
					<input type="radio" id="heavyRich" name="myhairRich" value="많음"
					checked> <label for="heavyRich">많음</label> <input
					type="radio" id="MediumRich" name="myhairRich" value="보통">
					<label for="MediumRich">보통</label> <input type="radio"
					id="LessRich" name="myhairRich" value="적음"> <label
					for="LessRich">적음</label> <input type="radio" id="LossRich"
					name="myhairRich" value="탈모"> <label for="LossRich">탈모</label>
					<input type="radio" id="richNotKnow" name="myhairRich" value="모름">
					<label for="richNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairRich().equals("보통")) {
 %>
					<input type="radio" id="heavyRich" name="myhairRich" value="많음">
					<label for="heavyRich">많음</label> <input type="radio"
					id="MediumRich" name="myhairRich" value="보통" checked> <label
					for="MediumRich">보통</label> <input type="radio" id="LessRich"
					name="myhairRich" value="적음"> <label for="LessRich">적음</label>
					<input type="radio" id="LossRich" name="myhairRich" value="탈모">
					<label for="LossRich">탈모</label> <input type="radio"
					id="richNotKnow" name="myhairRich" value="모름"> <label
					for="richNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairRich().equals("적음")) {
 %>
					<input type="radio" id="heavyRich" name="myhairRich" value="많음">
					<label for="heavyRich">많음</label> <input type="radio"
					id="MediumRich" name="myhairRich" value="보통"> <label
					for="MediumRich">보통</label> <input type="radio" id="LessRich"
					name="myhairRich" value="적음" checked> <label for="LessRich">적음</label>
					<input type="radio" id="LossRich" name="myhairRich" value="탈모">
					<label for="LossRich">탈모</label> <input type="radio"
					id="richNotKnow" name="myhairRich" value="모름"> <label
					for="richNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairRich().equals("탈모")) {
 %>
					<input type="radio" id="heavyRich" name="myhairRich" value="많음">
					<label for="heavyRich">많음</label> <input type="radio"
					id="MediumRich" name="myhairRich" value="보통"> <label
					for="MediumRich">보통</label> <input type="radio" id="LessRich"
					name="myhairRich" value="적음"> <label for="LessRich">적음</label>
					<input type="radio" id="LossRich" name="myhairRich" value="탈모"
					checked> <label for="LossRich">탈모</label> <input
					type="radio" id="richNotKnow" name="myhairRich" value="모름">
					<label for="richNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairRich().equals("모름")) {
 %>
					<input type="radio" id="heavyRich" name="myhairRich" value="많음">
					<label for="heavyRich">많음</label> <input type="radio"
					id="MediumRich" name="myhairRich" value="보통"> <label
					for="MediumRich">보통</label> <input type="radio" id="LessRich"
					name="myhairRich" value="적음"> <label for="LessRich">적음</label>
					<input type="radio" id="LossRich" name="myhairRich" value="탈모">
					<label for="LossRich">탈모</label> <input type="radio"
					id="richNotKnow" name="myhairRich" value="모름" checked> <label
					for="richNotKnow">모름</label> <%
 	}
 %>
				</td>
			</tr>
			<tr>
				<th>4.모발굵기</th>
				<td>
					<%
						if (hairinfo.getMyhairBold().equals("")) {
					%> <input type="radio"
					id="thinHairBold" name="myhairBold" value="가는모발"> <label
					for="thinHairBold">가는모발</label> <input type="radio"
					id="mediumhairBold" name="myhairBold" value="중간모발"> <label
					for="mediumhairBold">중간모발</label> <input type="radio"
					id="thickhairBold" name="myhairBold" value="두꺼운모발"> <label
					for="thickhairBold">두꺼운모발</label> <input type="radio"
					id="boldnotknow" name="myhairBold" value="모름"> <label
					for="boldnotknow">모름</label> <%
 	} else if (hairinfo.getMyhairBold().equals("가는모발")) {
 %>
					<input type="radio" id="thinHairBold" name="myhairBold"
					value="가는모발" checked> <label for="thinHairBold">가는모발</label>
					<input type="radio" id="mediumhairBold" name="myhairBold"
					value="중간모발"> <label for="mediumhairBold">중간모발</label> <input
					type="radio" id="thickhairBold" name="myhairBold" value="두꺼운모발">
					<label for="thickhairBold">두꺼운모발</label> <input type="radio"
					id="boldnotknow" name="myhairBold" value="모름"> <label
					for="boldnotknow">모름</label> <%
 	} else if (hairinfo.getMyhairBold().equals("중간모발")) {
 %>
					<input type="radio" id="thinHairBold" name="myhairBold"
					value="가는모발"> <label for="thinHairBold">가는모발</label> <input
					type="radio" id="mediumhairBold" name="myhairBold" value="중간모발"
					checked> <label for="mediumhairBold">중간모발</label> <input
					type="radio" id="thickhairBold" name="myhairBold" value="두꺼운모발">
					<label for="thickhairBold">두꺼운모발</label> <input type="radio"
					id="boldnotknow" name="myhairBold" value="모름"> <label
					for="boldnotknow">모름</label> <%
 	} else if (hairinfo.getMyhairBold().equals("두꺼운모발")) {
 %>
					<input type="radio" id="thinHairBold" name="myhairBold"
					value="가는모발"> <label for="thinHairBold">가는모발</label> <input
					type="radio" id="mediumhairBold" name="myhairBold" value="중간모발">
					<label for="mediumhairBold">중간모발</label> <input type="radio"
					id="thickhairBold" name="myhairBold" value="두꺼운모발" checked>
					<label for="thickhairBold">두꺼운모발</label> <input type="radio"
					id="boldnotknow" name="myhairBold" value="모름"> <label
					for="boldnotknow">모름</label> <%
 	} else if (hairinfo.getMyhairBold().equals("모름")) {
 %>
					<input type="radio" id="thinHairBold" name="myhairBold"
					value="가는모발"> <label for="thinHairBold">가는모발</label> <input
					type="radio" id="mediumhairBold" name="myhairBold" value="중간모발">
					<label for="mediumhairBold">중간모발</label> <input type="radio"
					id="thickhairBold" name="myhairBold" value="두꺼운모발"> <label
					for="thickhairBold">두꺼운모발</label> <input type="radio"
					id="boldnotknow" name="myhairBold" value="모름" checked> <label
					for="boldnotknow">모름</label> <%
 	}
 %>
				</td>
			</tr>
			<tr>
				<th>5.모발볼륨상태</th>
				<td>
					<%
						if (hairinfo.getMyhairVol().equals("")) {
					%> <input type="radio"
					id="lackVol" name="myhairVol" value="볼륨부족"> <label
					for="lackVol">볼륨부족</label> <input type="radio" id="floatingVol"
					name="myhairVol" value="뜨는머리"> <label for="floatingVol">뜨는머리</label>
					<input type="radio" id="noWorriesVol" name="myhairVol" value="고민없음">
					<label for="noWorriesVol">고민없음</label> <input type="radio"
					id="volNotKnow" name="myhairVol" value="모름"> <label
					for="volNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairVol().equals("볼륨부족")) {
 %>
					<input type="radio" id="lackVol" name="myhairVol" value="볼륨부족"
					checked> <label for="lackVol">볼륨부족</label> <input
					type="radio" id="floatingVol" name="myhairVol" value="뜨는머리">
					<label for="floatingVol">뜨는머리</label> <input type="radio"
					id="noWorriesVol" name="myhairVol" value="고민없음"> <label
					for="noWorriesVol">고민없음</label> <input type="radio" id="volNotKnow"
					name="myhairVol" value="모름"> <label for="volNotKnow">모름</label>
					<%
						} else if (hairinfo.getMyhairVol().equals("뜨는머리")) {
					%> <input
					type="radio" id="lackVol" name="myhairVol" value="볼륨부족"> <label
					for="lackVol">볼륨부족</label> <input type="radio" id="floatingVol"
					name="myhairVol" value="뜨는머리" checked> <label
					for="floatingVol">뜨는머리</label> <input type="radio"
					id="noWorriesVol" name="myhairVol" value="고민없음"> <label
					for="noWorriesVol">고민없음</label> <input type="radio" id="volNotKnow"
					name="myhairVol" value="모름"> <label for="volNotKnow">모름</label>
					<%
						} else if (hairinfo.getMyhairVol().equals("고민없음")) {
					%> <input
					type="radio" id="lackVol" name="myhairVol" value="볼륨부족"> <label
					for="lackVol">볼륨부족</label> <input type="radio" id="floatingVol"
					name="myhairVol" value="뜨는머리"> <label for="floatingVol">뜨는머리</label>
					<input type="radio" id="noWorriesVol" name="myhairVol" value="고민없음"
					checked> <label for="noWorriesVol">고민없음</label> <input
					type="radio" id="volNotKnow" name="myhairVol" value="모름"> <label
					for="volNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairVol().equals("모름")) {
 %>
					<input type="radio" id="lackVol" name="myhairVol" value="볼륨부족">
					<label for="lackVol">볼륨부족</label> <input type="radio"
					id="floatingVol" name="myhairVol" value="뜨는머리"> <label
					for="floatingVol">뜨는머리</label> <input type="radio"
					id="noWorriesVol" name="myhairVol" value="고민없음"> <label
					for="noWorriesVol">고민없음</label> <input type="radio" id="volNotKnow"
					name="myhairVol" value="모름" checked> <label
					for="volNotKnow">모름</label> <%
 	}
 %>
				</td>
			</tr>
			<tr>
				<th>6.모발상태</th>
				<td>
					<%
						if (hairinfo.getMyhairStatus().equals("")) {
					%> <input type="radio"
					id="cuttingHairStatus" name="myhairStatus" value="끊기는모발"> <label
					for="cuttingHairStatus">끊기는모발</label> <input type="radio"
					id="looseHairStatus" name="myhairStatus" value="푸석한모발"> <label
					for="looseHairStatus">푸석한모발</label> <input type="radio"
					id="healthyHairStatus" name="myhairStatus" value="건강한모발"> <label
					for="healthyHairStatus">건강한모발</label> <input type="radio"
					id="statusNotKnow" name="myhairStatus" value="모름"> <label
					for="statusNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairStatus().equals("끊기는모발")) {
 %>
					<input type="radio" id="cuttingHairStatus" name="myhairStatus"
					value="끊기는모발" checked> <label for="cuttingHairStatus">끊기는모발</label>
					<input type="radio" id="looseHairStatus" name="myhairStatus"
					value="푸석한모발"> <label for="looseHairStatus">푸석한모발</label> <input
					type="radio" id="healthyHairStatus" name="myhairStatus"
					value="건강한모발"> <label for="healthyHairStatus">건강한모발</label>
					<input type="radio" id="statusNotKnow" name="myhairStatus"
					value="모름"> <label for="statusNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairStatus().equals("푸석한모발")) {
 %>
					<input type="radio" id="cuttingHairStatus" name="myhairStatus"
					value="끊기는모발"> <label for="cuttingHairStatus">끊기는모발</label>
					<input type="radio" id="looseHairStatus" name="myhairStatus"
					value="푸석한모발" checked> <label for="looseHairStatus">푸석한모발</label>
					<input type="radio" id="healthyHairStatus" name="myhairStatus"
					value="건강한모발"> <label for="healthyHairStatus">건강한모발</label>
					<input type="radio" id="statusNotKnow" name="myhairStatus"
					value="모름"> <label for="statusNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairStatus().equals("건강한모발")) {
 %>
					<input type="radio" id="cuttingHairStatus" name="myhairStatus"
					value="끊기는모발"> <label for="cuttingHairStatus">끊기는모발</label>
					<input type="radio" id="looseHairStatus" name="myhairStatus"
					value="푸석한모발"> <label for="looseHairStatus">푸석한모발</label> <input
					type="radio" id="healthyHairStatus" name="myhairStatus"
					value="건강한모발" checked> <label for="healthyHairStatus">건강한모발</label>
					<input type="radio" id="statusNotKnow" name="myhairStatus"
					value="모름"> <label for="statusNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairStatus().equals("모름")) {
 %>
					<input type="radio" id="cuttingHairStatus" name="myhairStatus"
					value="끊기는모발"> <label for="cuttingHairStatus">끊기는모발</label>
					<input type="radio" id="looseHairStatus" name="myhairStatus"
					value="푸석한모발"> <label for="looseHairStatus">푸석한모발</label> <input
					type="radio" id="healthyHairStatus" name="myhairStatus"
					value="건강한모발"> <label for="healthyHairStatus">건강한모발</label>
					<input type="radio" id="statusNotKnow" name="myhairStatus"
					value="모름" checked> <label for="statusNotKnow">모름</label> <%
 	}
 %>
				</td>
			</tr>
			<tr>
				<th>7.모발노화상태</th>
				<td>
					<%
						if (hairinfo.getMyhairOld().equals("")) {
					%> <input type="radio"
					id="littleOld" name="myhairOld" value="새치조금"> <label
					for="littleOld">새치조금</label> <input type="radio" id="muchOld"
					name="myhairOld" value="새치많음"> <label for="muchOld">새치많음</label>
					<input type="radio" id="noneOld" name="myhairOld" value="새치없음">
					<label for="noneOld">새치없음</label> <input type="radio"
					id="oldNotKnow" name="myhairOld" value="모름"> <label
					for="oldNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairOld().equals("새치조금")) {
 %>
					<input type="radio" id="littleOld" name="myhairOld" value="새치조금"
					checked> <label for="littleOld">새치조금</label> <input
					type="radio" id="muchOld" name="myhairOld" value="새치많음"> <label
					for="muchOld">새치많음</label> <input type="radio" id="noneOld"
					name="myhairOld" value="새치없음"> <label for="noneOld">새치없음</label>
					<input type="radio" id="oldNotKnow" name="myhairOld" value="모름">
					<label for="oldNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairOld().equals("새치많음")) {
 %>
					<input type="radio" id="littleOld" name="myhairOld" value="새치조금">
					<label for="littleOld">새치조금</label> <input type="radio"
					id="muchOld" name="myhairOld" value="새치많음" checked> <label
					for="muchOld">새치많음</label> <input type="radio" id="noneOld"
					name="myhairOld" value="새치없음"> <label for="noneOld">새치없음</label>
					<input type="radio" id="oldNotKnow" name="myhairOld" value="모름">
					<label for="oldNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairOld().equals("새치없음")) {
 %>
					<input type="radio" id="littleOld" name="myhairOld" value="새치조금">
					<label for="littleOld">새치조금</label> <input type="radio"
					id="muchOld" name="myhairOld" value="새치많음"> <label
					for="muchOld">새치많음</label> <input type="radio" id="noneOld"
					name="myhairOld" value="새치없음" checked> <label for="noneOld">새치없음</label>
					<input type="radio" id="oldNotKnow" name="myhairOld" value="모름">
					<label for="oldNotKnow">모름</label> <%
 	} else if (hairinfo.getMyhairOld().equals("모름")) {
 %>
					<input type="radio" id="littleOld" name="myhairOld" value="새치조금">
					<label for="littleOld">새치조금</label> <input type="radio"
					id="muchOld" name="myhairOld" value="새치많음"> <label
					for="muchOld">새치많음</label> <input type="radio" id="noneOld"
					name="myhairOld" value="새치없음"> <label for="noneOld">새치없음</label>
					<input type="radio" id="oldNotKnow" name="myhairOld" value="모름"
					checked> <label for="oldNotKnow">모름</label> <%
 	}
 %>
				</td>
			</tr>
			<tr>
				<td class="btnTd" colspan="2">
					<input type="submit" class="btn btn-outline-primary" id="submitBtn" value="회원수정">	
					<input type="button" class="btn btn-outline-primary" value="이전화면으로" onClick="history.go(-1)">  
				</td>
				
			</tr>
		</table>
			
	</form>
	</div>
	<script>
	$(function () {
		$('#phoneInput').on('blur',phoneInputRegFunc);
		$('#pwInput').on('blur',pwInputRegFunc);
		$('#pwreInput').on('blur',pwreInputRegFunc);
		$('#emailInput').on('blur',emailInputRegFunc);
		$('#addrInput').on('blur',addrInputFunc);
		$('#submitBtn').on('click',submitBtnFunc);
    });		
	
	function phoneInputRegFunc(){
		var inputVal = $('#phoneInput').val();
		var regexp = /^\d{3}-\d{4}-\d{4}$/g;
		if(regexp.test(inputVal)){
			$('#phoneInput').removeClass('form-textbox-wrong');
			$('#phoneInfo').html('');
			return true;
		} else {
			$('#phoneInput').addClass('form-textbox-wrong');
			$('#phoneInfo').html('🚫 입력하지 않은 값이 있습니다.');
			return false;
		}
	}
	

	function pwInputRegFunc(){
		var inputVal = $('#pwInput').val();
		var regexp = /(?=^.{6,255}$)((?=.*\d)(?=.*[A-Z])(?=.*[a-z])|(?=.*\d)(?=.*[^A-Za-z0-9])(?=.*[a-z])|(?=.*[^A-Za-z0-9])(?=.*[A-Z])(?=.*[a-z])|(?=.*\d)(?=.*[A-Z])(?=.*[^A-Za-z0-9]))^.*/g;
		if(regexp.test(inputVal)){
			$('#pwInput').removeClass('form-textbox-wrong');
			$('#pwInfo').html('');
			return true;
		} else{
			$('#pwInput').addClass('form-textbox-wrong');
			$('#pwInfo').html('🚫 최소 1개 이상의 영어 대소문자, 특수문자, 숫자를입력해주세요. 최소 6문자이상을 입력해주세요.');
			return false;
		}
	}
	function pwreInputRegFunc(){
		var inputVal = $('#pwreInput').val();
		var pwVal = $('#pwInput').val();
		if(inputVal == pwVal){
			$('#pwreInput').removeClass('form-textbox-wrong');
			$('#pwreInfo').html('');
			return true;
		} else{
			$('#pwreInput').addClass('form-textbox-wrong');
			$('#pwreInfo').html('🚫 비밀번호가 일치하지 않습니다.');
			return false;
		}
	}
	function emailInputRegFunc(){
		var regexp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.\+]+[0-9a-zA-Z]@[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/g
		var inputVal = $('#emailInput').val();
		if(regexp.test(inputVal)){
			$('#emailInfo').html('');
			$('#emailInput').removeClass('form-textbox-wrong');
			return true;
		} else {
			$('#emailInfo').html('🚫 양식에 맞게 이메일을 입력해주세요');
			$('#emailInput').addClass('form-textbox-wrong');
			return false;
		}
	}
	function addrInputFunc(){
			if($('#addrInput').val()!=" "){
				$('#addrInfo').html('');
				$('#addrInput').removeClass('form-textbox-wrong');
				return true;				
			} else{
				$('#addrInfo').html('🚫 주소를 입력해주세요.');
				$('#addrInput').addClass('form-textbox-wrong');
				return false;				
			}	
	}
	function genderInputFunc(){
		var input = $('input[name="customerGen"]');
		var isChecked = $(input).is(':checked');
		
		if(isChecked){
			$('#genInfo').html('');
			return true;
		} else {
			$('#genInfo').html('🚫 성별을 입력해주세요.');
			return false;
		}
	}
	function isEmpty(str){
       
      if(typeof str == "undefined" || str == null || str == "")
          return true;
      else
          return false ;
  	}
	function submitBtnFunc(e){
		if(isAllPassed()){
			
		} else {
			window.scrollTo(0, 0);
			return false;
		}
	}
	function isAllPassed(){				
		return (emailInputRegFunc() 
				 && pwreInputRegFunc()
				 && phoneInputRegFunc()
				 && pwInputRegFunc()
				 && addrInputFunc());
	}
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>