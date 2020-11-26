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
	<section>
		<div class="table-wrapper" style="width:80%;text-align:center; margin:0 auto;">
			<form action="/insertPhoto" method="post" enctype="multipart/form-data">
				<table class="table table-bordered">
					<tr>
						<th colspan="2">포트폴리오</th>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<%-- <%=d.getDesignerId() %> --%>
							<input type="hidden" name="photoWriter" value="">
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="file" name="filename" onchange="loadImg(this)">
						</td>
					</tr>
					<tr>
						<th>이미지보기</th>
						<td>
							<div id="img-viewer">
								<img id="img-view" width="350">
							</div>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="3" name="photoContent" class="form-control"></textarea>
						</td>
					</tr>
					<tr style="text-align:center">
						<th colspan="2"><button type="submit" class="btn btn-outline-info">등록하기</button></th>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<script>
		function loadImg(f){	// f -> <input type="file">
			// 배열의 길이가 0인지 확인(첨부파일 갯수가 0인지 확인)
			// 배열에 담겨있는 파일의 크기가 0인지 확인 -> 파일업로드를 1개만 하기 때문에 0번 인덱스만 검사
			if(f.files.length !=0 && f.files[0]!=0){
				// 파일이 존재하면
				var reader = new FileReader();	// JS파일리더객체 -> 파일정보 확인
				// 현재 사용자가 선택한 파일의 경로를 읽어옴
				reader.readAsDataURL(f.files[0]);
				// 파일의 경로를 읽어오는 작업이 완료되면
				reader.onload = function(e){
					$("#img-view").attr('src',e.target.result);	// 파일경로를 src속성에 설정
				}
			}else{
				$("#img-view").attr("src","");
			}
			
		}
	</script>
</body>
</html>