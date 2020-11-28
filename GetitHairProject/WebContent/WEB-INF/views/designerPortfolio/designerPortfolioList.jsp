<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int totalCount = (Integer)request.getAttribute("totalCount");
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
		<div class="photo-container" style="width:1700px; margin:0 auto; text-align:center;">
			<h1>포트폴리오</h1>
			<div style="text-align:right">
				<a class="btn btn-outline-info" href="/designerPortfolioWriteFrm">글쓰기</a>
			</div>
			<div id="photo-wrapper" style="padding:100px;"></div>
			<div id="photo-btn-container">
				<button class="btn btn-outline-info" currentCount="0" value="" totalCount="<%=totalCount %>" id="more-btn">더보기</button>
			</div>
		</div>
	</section>
	<script>
		$(function(){
			designerPortfolioMore(1);
		});
		$("#more-btn").click(function(){
			designerPortfolioMore($(this).val());
		});
		function designerPortfolioMore(start){
			$.ajax({
				url : "/designerPortfolioMore",
				data : {start:start},
				type : "post",
				dataType : "json",
				success : function(data){
					var html = "";
					for(var i in data){
						var dp = data[i];
						// ul 태그로 묶거나  div felx box 사용해서 묶음
						// 일단 기능구현은 되니까 집가서 마무리...
						/* html += "<ul>"
						html += "<li></li>"
						html += "<div class='photo border border-dark' style='width:400px; height:400px; margin:0 auto; margin-bottom:10px; display: inline-block;'>";
						html += "<img src='/upload/designerPortfolio/"+dp.filepath+"' width='100%'>";
						html += "<p class='caption'>"+dp.styleName+"</p></div>"; */
						

						html += "<div class='photo border border-dark' style='width:300px; height: 300px; margin:0 auto; display: inline-block; padding: 7px;'>";
						html += "<img src='/upload/designerPortfolio/"+dp.filepath+"' width='100%'>";
						html += "<a href='#' style='background-image: url('/upload/designerPortfolio/"+dp.filepath+"');'>test</a>";
						//html += "<p class='caption'>"+dp.styleName+"</p>";
						html += "</div>"
					}
					$("#photo-wrapper").append(html);
					// 추가완료 후 더보기버튼 value -> 값 조정(start+5)
					$("#more-btn").val(Number(start)+4);
					// 현재 몇 번까지 가지고왔는지 체크
					var currCount = $("#more-btn").attr("currentCount");	// 0인 상태
					$("#more-btn").attr("currentCount",Number(currCount)+data.length);
					currCount = $("#more-btn").attr("currentCount");	// 더한 값
					var totalCount = $("#more-btn").attr("totalCount");
					if(currCount == totalCount){
						$("#more-btn").attr("disable",true);
						$("#more-btn").css("cursor","not-allowed");
					}
				}
			});
		}
	</script>

</body>
</html>