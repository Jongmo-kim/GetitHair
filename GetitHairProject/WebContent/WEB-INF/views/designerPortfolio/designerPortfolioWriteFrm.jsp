<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>포트폴리오 작성</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section>
		<div class="table-wrapper" style="width:70%; margin:0 auto;padding: 50px;">
		<h1>포트폴리오 작성</h1>
		<br>
			<form action="/insertDesignerPortfolio" method="post" enctype="multipart/form-data">
				<table class="table">
					<tr>
						<th>작성자</th>
						<td>
							<%=loginDesigner.getDesignerId() %>
							<input type="hidden" name="portfolioWriter" value="<%=loginDesigner.getDesignerId() %>">
							<input type="hidden" name="designerNo" value="<%=loginDesigner.getDesignerNo()%>">
						</td>
					</tr>
					<tr>
						<th>File</th>
						<td>
							<!-- 다중 선택 기능 사용 시 multiple="multiple" -->
							<input type="file" name="filename" onchange="loadImg(this)">
						</td>
					</tr>
					<tr>
						<th>Image Preview</th>
						<td>
							<div id="img-viewer">
								<img id="img-view" width="350">
							</div>
						</td>
					</tr>
					<tr>
						<th>Style Type</th>
						<td>
							<input class="form-control" type="text" name="styleType" value="">
						</td>
					</tr>
					<tr>
						<th colspan="2">Content</th>
					</tr>
					<tr>
						<td colspan="2">
							<textarea rows="3" name="portfolioContent" class="form-control"></textarea>
						</td>
					</tr>
					<tr style="text-align:center">
						<th colspan="2"><button type="submit" class="btn btn-dark">등록하기</button></th>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<script>
		function loadImg(f){
			if(f.files.length !=0 && f.files[0]!=0){
				var reader = new FileReader();
				reader.readAsDataURL(f.files[0]);
				reader.onload = function(e){
					$("#img-view").attr('src',e.target.result);
				}
			}else{
				$("#img-view").attr("src","");
			}
			
		}
	</script>
</body>
</html>