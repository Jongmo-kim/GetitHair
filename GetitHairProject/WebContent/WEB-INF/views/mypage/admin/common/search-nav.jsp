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
		<button class="btn">검색</button>
		<select name="list_num">
			<option value=15 ${param.list_num == 15 ? "selected" : ""}>15개</option>
			<option value=20 ${param.list_num == 20 || empty param.list_num ? "selected" : ""}>20개</option>
			<option value=25 ${param.list_num == 25 ? "selected" : ""}>25개</option>
		</select>
	</div>
	<script>
		$(document).ready(function () {
			$("[name=list_num").on("change",function (e) {  
                $(this).parents('form').trigger("submit");
            })
		});
	</script>
</body>
</html>