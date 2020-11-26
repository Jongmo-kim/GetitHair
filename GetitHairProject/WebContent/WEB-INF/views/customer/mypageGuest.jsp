<%@page import="reserve.model.vo.Reserve"%>
<%@page import="java.util.ArrayList"%>
<%@page import="customer.model.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Customer loginCustomer = (Customer) request.getAttribute("loginCustomer");
	ArrayList<Reserve> list = (ArrayList<Reserve>)request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	border-bottom: 1px solid #999;
	width: 100%;
}

ul.tabs li {
	float: right;
	margin: 0;
	padding: 0;
	height: 31px;
	line-height: 31px;
	border: 1px solid #999;
	margin-bottom: -1px;
	overflow: hidden;
	position: relative;
	background: #e0e0e0;
}

ul.tabs li a {
	text-decoration: none;
	color: #000;
	display: block;
	font-size: 1.2em;
	padding: 0 20px;
	border: 1px solid #fff;
	outline: none;
}

ul.tabs li a:hover {
	background: #ccc;
}

html ul.tabs li.active, html ul.tabs li.active a:hover {
	background: #fff;
	border-bottom: 1px solid #fff;
}

.tab_container {
	border: 1px solid #999;
	border-top: none;
	overflow: hidden;
	clear: both;
	float: left;
	width: 100%;
	background: #fff;
}

.tab_content {
	padding: 20px;
	font-size: 1.2em;
}
</style>
</head>

<body>
	<ul>
		<li>프로필관리
			<ul>
				<li><a
					href="/updateCustomerFrm?customerNo=<%=loginCustomer.getCustomerNo()%>">Customer프로필보기</a>
				</li>
				<li><a
					href="/updateHairinfoFrm?customerNo=<%=loginCustomer.getCustomerNo()%>">HairInfo프로필보기</a>
				</li>
			</ul>
		</li>
		<li>예약관리
			<div id="wrapper">
		<ul class="tabs">
			<li><a href="#tab1">취소</a></li>
			<li><a href="#tab2">완료</a></li>
			<li><a href="#tab3">예약</a></li>
			<li><a href="#tab4">전체</a></li>
		</ul>
		<div class="tab_container">
			<div id="tab1" class="tab_content">
				<h1>취소영역</h1>
			</div>

			<div id="tab2" class="tab_content">
				<h1>완료영역</h1>				
			</div>
			<div id="tab3" class="tab_content">
				<h1>예약영역</h1>
			</div>
			<div id="tab4" class="tab_content">
				<h1>전체영역</h1>
				<table border="1">
					<tr>
						<th>1.예약번호</th>
						<th>2.손님번호</th>
						<th>3.디자이너번호</th>
						<th>4.미용실번호</th>
						<th>5.예약일시</th>
						<th>6.상태코드</th>
						<th>7.손님요청사항</th>
						<th>8.디자이너요청사항</th>
						<th>9.디자이너손님에 대한메모</th>
					</tr>
					<%for(Reserve r : list) {%>
					<tr>
						<td><%=r.getReserveNo() %></td>
						<td><%=r.getCustomer().getCustomerNo() %></td>
						<td><%=r.getDesigner().getDesignerNo() %></td>
						<td><%=r.getShop().getShopNo() %></td>
						<td><%=r.getReserveDate() %></td>
						<td><%=r.getReserveStatus() %></td>
						<td><%=r.getReserveCustReq() %></td>
						<td><%=r.getReserveDesignerReq() %></td>
						<td><%=r.getReserveDesignerMemo()%></td>
					</tr>
					<%} %>
				</table>
			</div>
		</div>
	</div>
		</li>
		<li>리뷰관리
			<ul>
				<li><a
					href="/selectAllReviewList?customerNo=<%=loginCustomer.getCustomerNo()%>">리뷰리스트보기</a>
				</li>
				<li><button>리뷰보기</button></li>
				<li><button>리뷰삭제하기</button></li>
				<li><button>리뷰수정하기</button></li>
			</ul>
		</li>
		<li>찜목록
			<ul>
				<li><button>찜목록보기</button></li>
				<li><button>찜취소하기</button></li>
				<li><button>찜수정?할게있어?없는거같은데?</button></li>
			</ul>
		</li>
	</ul>	
	<script>
        $(document).ready(function() {
            $(".tab_content").hide();
            $("ul.tabs li:last").addClass("active").show();
            $(".tab_content:last").show();
            $("ul.tabs li").click(function() {
                $("ul.tabs li").removeClass("active");
                $(this).addClass("active");
                $(".tab_content").hide();
                var activeTab = $(this).find("a").attr("href");
                $(activeTab).fadeIn();
                return false;
            });
        });
    </script>
</body>

</html>