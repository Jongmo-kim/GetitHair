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
			<form action="/insertDesignerPortfolio" method="post" enctype="multipart/form-data">
				<table class="table">
					<tr>
						<th colspan="2">포트폴리오 작성</th>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<%-- <%=d.getDesignerId() %> --%>
							<input type="hidden" name="portfolioWriter" value="">
						</td>
					</tr>
					<tr>
						<th>File</th>
						<td>
							<input type="file" name="filename" onchange="loadImg(this)">
						</td>
					</tr>
					<tr>
						<th colspan="2">Image Preview</th>
					</tr>
					<tr>
						<td colspan="2">
							<div id="img-viewer">
								<img id="img-view" width="350">
							</div>
						</td>
					</tr>
					<tr>
						<th>Style Type</th>
						<td>
							<%-- <%=d.getDesignerId() %> --%>
							<input type="hidden" name="portfolioWriter" value="">
						</td>
					</tr>
					<tr>
						<th colspan="2">Content</th>
					</tr>
					<tr>
						<td colspan="2">
							<textarea rows="3" name="designerPortfolioContent" class="form-control"></textarea>
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