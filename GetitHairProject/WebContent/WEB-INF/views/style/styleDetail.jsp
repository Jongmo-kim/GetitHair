<%@page import="image.model.vo.Image"%>
<%@page import="designerportfolio.model.vo.DesignerPortfolio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="stylelist.model.vo.Stylelist"%>
<%@page import="style.model.vo.Style"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Stylelist stylelist = (Stylelist)request.getAttribute("stylelist");
    	ArrayList<DesignerPortfolio> pflist = (ArrayList<DesignerPortfolio>)request.getAttribute("pflist");
    	Image image = (Image)request.getAttribute("image");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스타일 상세 페이지</title>
<style>
	.mid{
		width: 1480px;
		margin: 0 auto;
	}
	.content>img:first-child{
		width: 500px;
		height: 500px;
	}
	.content{
		width: 500px;
		margin: 100px auto;
		margin-top : 50px;
	}
	input[type="search"]{
    	width : 700px;
    	height: 50px;
    	border-radius : 10px;
    	outline: none;
    }
    .mid>form{
    	text-align: center;
    	margin-top: 10px;
    	display: none;
    }
    body button{
    	height: 50px;
    	width : 80px;
    	border: none;
    	border-radius: 10px;
    	background: #260101;
    	color: white;
    }
    button:hover{
    	background: #D9ABA0;
    	transition-duration: 0.2s;
    }
    .tab{
    	width: 50%;
    	height: 70px;
    	margin: 0 auto;
    	display: flex;
    	align-items: flex-end;
    	justify-content: flex-end;
    }
    .tab>img{
    	cursor: pointer;
    }
    .content span{
    	font-size: 18px;
    }
    .content>div{
    	height: 250px;
    	overflow: hidden;
    }
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section>
		<div class="mid">
			<div class="tab"><img src="/img/main/searchbig.png"></div>
			<form action="/searchStyle" method="get">
				<input type="search" name="searchStyle">
				<button type="submit">검색</button>
			</form>
			<div class="content">
				<img src="/upload/style/<%=image.getFilepath()%>">
				<h1><%=stylelist.getStyle().getStyleName() %></h1>
				<img src="/img/main/heartbig.png" style="height: 25px"> <span><%=stylelist.getStyle().getStyleLikes() %></span>
				<br><br>
				<h2 style="display:inline-block"><%=stylelist.getDesigner().getDesignerName() %> 디자이너</h2><span> <%=stylelist.getDesigner().getDesignerRank() %> <%=stylelist.getDesigner().getDesignerYear() %>년</span>
				<br><br>
				<div>
					<h3>추천 스타일</h3>
					<%for(DesignerPortfolio pf : pflist){ %>
						<p><%=pf.getStyleName() %></p>
					<%} %>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
		$(".tab>img").click(function(){
			$("form").slideToggle();
		});
		$("button:submit").click(function(){
			if($(this).prev().val() == ""){
				return false;
			}
		});
	</script>
</body>
</html>