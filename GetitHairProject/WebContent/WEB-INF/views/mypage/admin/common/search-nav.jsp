<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="search-nav">
		<select name="searchType">
			<option value="1" ${param.searchType==1 ? "selected" : "" }>아이디</option>
			<option value="2" ${param.searchType==2 ? "selected" : "" }>이름</option>
		</select> <input type="text" name="keyword" value="${empty keyword ? null : keyword}">
		<button>검색</button>
	</div>
</body>
</html>