<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style>
	.main{
		height : 100vh;
		width : 100vw;
		background-image : url(img/main/image_1067960081546071656800.jpg);
		background-repeat: no-repeat;
        background-size: cover;
	}
	.wrap{
		background-color: rgba(0,0,0,0.5);
		position : absolute;
		width: 100vw;
		height: 100vh;
		top: 100px;
		left: 0px;
		display: flex;
        justify-content : center;
        align-items : center;
        flex-direction: column;
	}
	.btn{
		display : inline-block;
		width : 200px;
		height : 50px;
		text-decoration : none;
		color : white;
		background : #D9ABA0;
		border-radius : 10px;
		text-align : center;
		line-height: 50px;
		margin: 50px;
		
	}
	.wrap>h1{
		font-size : 50px;
		color: #D9ABA0;
		margin: 0;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section>
		<div class="main">
		</div>
		<div class="wrap">
			<h1>환영합니다</h1>
			<div>
				<a href="/hairshop" class="btn">헤어샵</a>
				<a href="/hairmodel" class="btn">헤어모델</a>
			</div>
			<br>
			<a href="/login">로그인</a>
		</div>
	</section>
</body>
</html>