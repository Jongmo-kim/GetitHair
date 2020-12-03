<%@page import="designer.model.vo.Designer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Designer designer = (Designer)request.getAttribute("designer");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보</title>
<!-- 부트스트랩 테마 -->
<!-- <link rel="stylesheet" href="https://bootswatch.com/4/lux/bootstrap.min.css"> -->
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section>
	<div style="height: 920px; padding-top:90px;">
		<form action="/updateDesigner" style="width:800px;margin:0 auto;color:black;" method="post">
			<h1>프로필 관리</h1>
			<br>
			<table class="table">
				<input type="hidden" name="designerNo"value="<%=designer.getDesignerNo() %>" readonly>
				<tr>
					<th>아이디</th>
					<td><%=designer.getDesignerId() %></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" class="form-control" name="designerPw" value="<%=designer.getDesignerPw() %>"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=designer.getDesignerName() %></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" class="form-control" name="designerPhone" value="<%=designer.getDesignerPhone() %>"></td>
				</tr>
				<!-- <tr>
					<th>소속 헤어샵</th>
					<td><input type="text" class="form-control" name="shopName" value="" readonly></td>
				</tr>  -->
				<tr>
					<th>경력</th>
					<td><input type="text" class="form-control" name="designerYear" value="<%=designer.getDesignerYear() %>" style="width: 50px;display: inline-block;"> 년</td>
				</tr>
				<tr>
					<th>직급</th>
					<td><input type="text" class="form-control" name="designerRank" value="<%=designer.getDesignerRank() %>"></td>
				</tr>
				<tr>
					<th>소개글</th>
					<td><textarea class="form-control" name="designerIntro"><%=designer.getDesignerIntro() %></textarea></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><%=designer.getDesignerEnrolldate() %></td>
				</tr>
				<tr>
					<th colspan="2" style="text-align: center">
					<button style="margin: 10px;" class="btn btn-dark" type="submit">수정하기</button>
					<button style="margin: 10px" class="btn btn-dark" type="button" onclick="location.href='/deleteDesigner?designerId=<%=designer.getDesignerId()%>'">회원탈퇴</button>
					</th>
				</tr>
			</table>
		</form>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>