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
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		var print= '<%=msg %>';
		if(print!=''){
			alert(print);
		}	
	}
</script>

</head>
<body>
	<h1>회원정보수정</h1>
	<form action="/updateAllCustomer" method="post">
		<table>
			<tr>
				<th>회원번호</th>
				<td><input type="text" name="customerNo"
					value="<%=customer.getCustomerNo()%>" readonly></td>
			</tr>
			<tr>
				<th>회원아이디</th>
				<td><input type="text" name="customerId"
					value="<%=customer.getCustomerId()%>" readonly></td>
			</tr>
			<tr>
				<th>회원암호</th>
				<td><input type="password" name="customerPw"
					value="<%=customer.getCustomerPw()%>"></td>
			</tr>
			<tr>
				<th>회원성별</th>
				<td><input type="text" name="customerGen"
					value="<%=customer.getCustomerGen()%>" readonly></td>
			</tr>
			<tr>
				<th>회원이름</th>
				<td><input type="text" name="customerName"
					value="<%=customer.getCustomerName()%>" readonly></td>
			</tr>
			<tr>
				<th>회원이메일</th>
				<td><input type="text" name="customerEmail"
					value="<%=customer.getCustomerEmail()%>"></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="customerAddr"
					value="<%=customer.getCustomerAddr()%>"></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="addrDetail"
					value="<%=customer.getAddrPostcode()%>" readonly></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type="text" name="addrPostcode"
					value="<%=customer.getAddrDetail()%>"></td>
			</tr>
			<tr>
				<th>회원휴대전화번호</th>
				<td><input type="text" name="customerPhone"
					value="<%=customer.getCustomerPhone()%>"></td>
			</tr>
			<tr>
				<th>회원생년월일</th>
				<td><input type="text" name="customerBirthdate"
					value="<%=customer.getCustomerBirthdate()%>" readonly></td>
			</tr>
			<tr>
				<th>회원가입일</th>
				<td><input type="text" name=customerEnrolldate
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
		</table>
		<input type="submit" value="회원수정">		
	</form>
</body>
</html>