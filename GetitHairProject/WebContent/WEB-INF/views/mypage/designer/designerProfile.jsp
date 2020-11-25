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
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section>
		<form action="/updateDesigner" method="post">
			<h1>마이페이지</h1>
			<table>
				<tr>
					<th>프로필 이미지</th>
					<td><input type="text" name="designerImg" value="<%=designer.getDesignerImg() %>"></td>
				</tr>
				<tr>
					<th>디자이너 회원번호</th>
					<td><input type="text" name="designerNo"value="<%=designer.getDesignerNo() %>" readonly></td>
				</tr>
				<tr>
					<th>소속 헤어샵 번호</th>
					<td><input type="text" name="shopNo"value="<%=designer.getDesignerNo() %>" readonly></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="designerId" value="<%=designer.getDesignerId() %>" readonly></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="designerPw" value="<%=designer.getDesignerPw() %>"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="designerNeme" value="<%=designer.getDesignerName() %>" readonly></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="designerEmail" value="<%=designer.getDesignerEmail() %>"></td>
				</tr>
				<tr>
					<!-- 소속 헤어샵 처리 어떻게 하더라? -->
					<th>소속 헤어샵</th>
					<td><input type="text" name="shopName" value=""></td>
				</tr>
				<tr>
					<th>경력</th>
					<td><input type="text" name="designerYear" value="<%=designer.getDesignerYear() %>"></td>
				</tr>
				<tr>
					<th>직급</th>
					<td><input type="text" name="designerRank" value="<%=designer.getDesignerRank() %>"></td>
				</tr>
				<tr>
					<th>소개글</th>
					<td><input type="text" name="designerIntro" value="<%=designer.getDesignerIntro() %>"></td>
				</tr>
				<tr>
					<th>스타일키워드</th>
					<td><input type="text" name="designerKeyword" value="<%=designer.getDesignerKeyword() %>"></td>
				</tr>
				<tr>
					<th colspan="2" style="text-align: center">
					<button type="submit">수정하기</button>
					<!-- 디자이너 회원탈퇴부분 수정해야함 -->
					<button type="button" onclick="location.href='/deleteMember?designerId=<%=designer.getDesignerId()%>'">회원탈퇴</button>
					</th>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>