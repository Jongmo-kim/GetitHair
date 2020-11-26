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
	<h1>포트폴리오 리스트</h1>
	<%-- <section>
		<div class="photo-container" style="width:80%; margin:0 auto; text-align:center;">
			<h1>사진게시판</h1>
			<div id="photo-wrapper" style="padding:100px;"></div>
			<div id="photo-btn-container">
				<button class="btn btn-outline-info" currentCount="0" value="" totalCount="<%=totalCount %>" id="more-btn">더보기</button>
				<%if(d != null) {%>
				<a class="btn btn-outline-info" href="/photoWriteFrm">글쓰기</a>
				<%} %>
			</div>
		</div>
	</section>
	<script>
		$(function(){
			photoMore(1);
		});
		$("#more-btn").click(function(){
			photoMore($(this).val());
		});
		function photoMore(start){
			$.ajax({
				url : "/photoMore",
				data : {start:start},
				type : "post",
				dataType : "json",
				success : function(data){
					var html = "";
					for(var i in data){
						var p = data[i];
						html += "<div class='photo border border-dark' style='width:600px; margin:0 auto; margin-bottom:10px;'>";
						html += "<img src='/upload/photo/"+p.filepath+"' width='100%'>";
						html += "<p class='caption'>"+p.photoContent+"</p></div>";
					}
					$("#photo-wrapper").append(html);
					// 추가완료 후 더보기버튼 value -> 값 조정(start+5)
					$("#more-btn").val(Number(start)+5);
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
	</script> --%>
</body>
</html>