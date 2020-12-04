<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function addrSearch(){
    new daum.Postcode({
        oncomplete: function(data) {
        	$('input[name="customerAddr"]').val(data.address);
        	$('input[name="addrPostcode"]').val(data.zonecode);
        }
    }).open();
	}

</script>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<link rel="stylesheet" href="/css/signUp/signUpCustomer.css?v=<%=System.currentTimeMillis()%>">
	<script type="text/javascript" src="/js/signUp/signUpCustomer.js?v=<%=System.currentTimeMillis()%>"></script>
	
	<form action="/signUpCustomer" method="post">
	    <div class="container">
	    <h2>Get it hair</h2>
	    <h3>회원가입</h3>
	    <p>이미 Get it hair의 회원이신가요? 
	    <%if(loginCustomer == null){%>
	    <a href="/searchCustomerIdForm">ID</a> / <a href="/searchCustomerPwForm">PW</a>찾기</p>
	    <% } %>
	      <p style="font-size:14px;">가입을 하면 Get it hair의 이용약관, <a href="/views/signup/terms.jsp">개인정보취급방침</a> 및 <a href="/views/signup/privacy.jsp">개인정보3자제공에 동의하게 됩니다.</a><p>
	    <br>
	    <hr>
	        <div class="name inputBox">
	            <input autofocus type="text" class="form-textbox" id="nameInput"name="customerName">
	            <span class="form-label label-focused">이름</span>
	            <span class="additional-info" id="nameInfo"></span>
	        </div>
	        <hr>
	        <br>
	        <div class="date inputBox">
	            <input type="text" class="form-textbox dateOfBirth" id="dateInput" name="customerBirthdate">
	            <span class="form-label">생년월일</span>
	            <span class="additional-info" id="dateInfo"></span>
	        </div>
	        <hr>
	        <br>
	        <div class="inputBox">
	            <input type="text" class="form-textbox phoneInput" id="phoneInput"name="customerPhone">
	            <span class="form-label">전화번호</span>
	            <span class="additional-info" id="phoneInfo"></span>
	        </div>
			<hr>
	        <br>
			<div class="name inputBox">
	            <input type="text" class="form-textbox" id="idInput" name="customerId">
	            <span class="form-label">아이디</span>
	            <span class="additional-info" id="idInfo"></span>
	        </div>
	        
	        <div class="name inputBox">
	            <input type="password" class="form-textbox" id="pwInput" name="customerPw">
	            <span class="form-label">비밀번호</span>
	            <span class="additional-info" id="pwInfo"></span>
	        </div>
	        <div class="name inputBox">
	            <input type="password" class="form-textbox" id="pwreInput">
	            <span class="form-label">비밀번호확인</span>
	            <span class="additional-info" id="pwreInfo"></span>
	        </div>
	        <hr>
	        <br>
	        
	        <div class="name inputBox">
				<input type="radio" id="signupMale" name="customerGen" value="남" >
				<label for="signupMale">남자</label>
				<input type="radio" id="signupFemale" name="customerGen" value="여" >
				<label for="signupFemale">여자</label>
	            <span class="additional-info" id="genInfo"></span>
				
	        </div>
	        <hr>
	        <br>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" id="emailInput" name="customerEmail">
	            <span class="form-label">이메일</span>
	            <span class="additional-info" id="emailInfo"></span>
	            
	        </div>
	        <hr>
	        <br>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox readonly"value=" " readonly id="addrInput" name="customerAddr">
	            <span class="form-label label-focused">주소</span>
	            <span class="additional-info" id="addrInfo"></span>
	        </div>
	        
	        <div class="name inputBox">
	            <input type="text" class="form-textbox readonly" value=" "readonly name="addrPostcode">
	            <span class="form-label label-focused">Zipcode</span>
	            <button class="btn btn-primary" id="searchBtn" type="button" onclick="addrSearch()">주소검색</button>
	        </div>
	        
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="addrDetail">
	            <span class="form-label">상세주소</span>
	        </div>
	        <hr>
	        <br>
	        <h2>추가 모발 정보</h2>
	        <br>
	        <table class="table table-hover">
			<tr >
				<th>두피상태</th>
				<td>
						<input type="radio" id="oilySkinScalp" name="myhairScalp" value="지성">
						<label for="oilySkinScalp">지성</label> 
						<input type="radio" id="drySkinScalp" name="myhairScalp" value="건성">
						<label for="drySkinScalp">건성</label>
						<input type="radio" id="dandruffSkinScalp" name="myhairScalp" value="비듬">
						<label for="dandruffSkinScalp">비듬/지루성</label>
						<input type="radio"	id="sensitiveSkinScalp" name="myhairScalp" value="민감성">
						<label for="sensitiveSkinScalp">민감성</label>
						<input type="radio" id="normalSkinScalp" name="myhairScalp" value="중성">
						<label for="normalSkinScalp">중성</label>
						<input type="radio" id="scalpNotKnowScalp" name="myhairScalp" value="모름" checked>
						<label for="scalpNotKnowScalp">모름</label>
				</td>
			</tr>
			<tr>
				<th>곱슬정도</th>
				<td>
						<input type="radio" id="nomalCurly" name="myhairCurly" value="곱슬">
						<label for="nomalCurly">곱슬</label>
						<input type="radio" id="semiCurly" name="myhairCurly" value="반곱슬">
						<label for="semiCurly">반곱슬</label>
						<input type="radio" id="straightCurly" name="myhairCurly" value="직모">
						<label for="straightCurly">직모</label>
						<input type="radio" id="curlyNotKnow" name="myhairCurly" value="모름" checked>
						<label for="curlyNotKnow">모름</label> 
				</td>
			</tr>
			<tr>
				<th>머리숱</th>
				<td>
						<input type="radio" id="heavyRich" name="myhairRich" value="많음" >
						<label for="heavyRich">많음</label>
						<input type="radio" id="MediumRich" name="myhairRich" value="보통">
						<label for="MediumRich">보통</label>
						<input type="radio" id="LessRich" name="myhairRich" value="적음">
						<label for="LessRich">적음</label>
						<input type="radio" id="LossRich" name="myhairRich" value="탈모">
						<label for="LossRich">탈모</label>
						<input type="radio" id="richNotKnow" name="myhairRich" value="모름" checked>
						<label for="richNotKnow">모름</label>
				</td>
			</tr>
			<tr>
				<th>모발굵기</th>
				<td>
						<input type="radio" id="thinHairBold" name="myhairBold" value="가는모발">
						<label for="thinHairBold">가는모발</label>
						<input type="radio" id="mediumhairBold" name="myhairBold" value="중간모발">
						<label for="mediumhairBold">중간모발</label>
						<input type="radio" id="thickhairBold" name="myhairBold" value="두꺼운모발">
						<label for="thickhairBold">두꺼운모발</label>
						<input type="radio" id="boldnotknow" name="myhairBold" value="모름" checked>
						<label for="boldnotknow">모름</label>
				</td>
			</tr>
			<tr>
				<th>모발볼륨상태</th>
				<td>
						<input type="radio" id="lackVol" name="myhairVol" value="볼륨부족">
						<label for="lackVol">볼륨부족</label>
						<input type="radio" id="floatingVol" name="myhairVol" value="뜨는머리">
						<label for="floatingVol">뜨는머리</label>
						<input type="radio" id="noWorriesVol" name="myhairVol" value="고민없음">
						<label for="noWorriesVol">고민없음</label>
						<input type="radio" id="volNotKnow" name="myhairVol" value="모름" checked>
						<label for="volNotKnow">모름</label>
				</td>
			</tr>
			<tr>
				<th>모발상태</th>
				<td>
						<input type="radio" id="cuttingHairStatus" name="myhairStatus" value="끊기는모발">
						<label for="cuttingHairStatus">끊기는모발</label>
						<input type="radio" id="looseHairStatus" name="myhairStatus" value="푸석한모발">
						<label for="looseHairStatus">푸석한모발</label>
						<input type="radio" id="healthyHairStatus" name="myhairStatus" value="건강한모발">
						<label for="healthyHairStatus">건강한모발</label>
						<input type="radio" id="statusNotKnow" name="myhairStatus" value="모름" checked>
						<label for="statusNotKnow">모름</label> 
				</td>
			</tr>
			<tr>
				<th>모발노화상태</th>
				<td>
						<input type="radio" id="littleOld" name="myhairOld" value="새치조금">
						<label for="littleOld">새치조금</label>
						<input type="radio" id="muchOld" name="myhairOld" value="새치많음">
						<label for="muchOld">새치많음</label>
						<input type="radio" id="noneOld" name="myhairOld" value="새치없음">
						<label for="noneOld">새치없음</label>
						<input type="radio" id="oldNotKnow" name="myhairOld" value="모름" checked>
						<label for="oldNotKnow">모름</label>
				</td>
			</tr>
		</table>
        <button id="submitBtn" class="btn">제출</button>
        <button class="btn resetBtn" type="reset">초기화</button>
        <p></p>
    </div>
	</form>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>