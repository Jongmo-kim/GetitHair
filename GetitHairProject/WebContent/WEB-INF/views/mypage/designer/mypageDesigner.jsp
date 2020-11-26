<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<h1>디자이너 마이페이지</h1>
	<a href="/designerReserve">예약</a>
	<a href="/designerProfile">프로필</a>
	<a href="/designerPortfolio">포트폴리오</a>
	<a href="/designerReviewList">리뷰</a>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>