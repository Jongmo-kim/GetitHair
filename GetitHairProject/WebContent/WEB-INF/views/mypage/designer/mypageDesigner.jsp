<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
<style>
.mypage-wrap {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 50px;
	margin-bottom: 100px;
}

.mypage-btn-container {
	width: 500px;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.mypage-btn {
	display: block;
	width: 200px;
	height: 150px;
	border: 1px solid #8C2E40;
	color: #8C2E40;
	text-align: center;
	line-height: 150px;
	text-decoration: none;
	border-radius: 10px;
	font-size: 20px;
	font-weight: bold;
	margin: 5px;
}

.mypage-btn:hover {
	background-color: #8C2E40;
    text-decoration: none;
	color: white;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="mypage-wrap">
		<h2>My Page</h2><br>
		<div class="mypage-btn-container">
			<a class="mypage-btn" href="/designerReserve?DesignerNo=<%=loginDesigner.getDesignerNo()%>">예약관리</a> 
			<a class="mypage-btn" href="/designerProfile?designerId=<%=loginDesigner.getDesignerId()%>">프로필</a> 
			<a class="mypage-btn" href="/designerPortfolioList">포트폴리오</a>
			<a class="mypage-btn" href="/designerReviewList?designerNo=<%=loginDesigner.getDesignerNo()%>">리뷰</a>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>