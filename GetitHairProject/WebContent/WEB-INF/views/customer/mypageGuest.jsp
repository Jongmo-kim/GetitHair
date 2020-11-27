<%@page import="reserve.model.vo.Reserve"%>
<%@page import="java.util.ArrayList"%>
<%@page import="customer.model.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Customer loginCustomer = (Customer) request.getAttribute("loginCustomer");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
			<ul>
				<li><a
					href="/updateReserveFrm?customerNo=<%=loginCustomer.getCustomerNo()%>&selStatus=전체&reqPage=1">예약폼으로가기</a>
				</li>
				<li><button>예약리스트보기</button></li>
				<li><button>예약취소하기</button></li>
				<li><button>예약수정하기</button></li>
			</ul>			
		<li>리뷰관리
			<ul>
				<li><a
					href="/selectAllReviewList?customerNo=<%=loginCustomer.getCustomerNo()%>&reqPage=1">리뷰리스트보기</a>
				</li>				
			</ul>
		</li>
		<li>찜목록
			<ul>
				<li><a
					href="/selectAllLikesList?customerNo=<%=loginCustomer.getCustomerNo()%>&reqPage=1">찜리스트보기</a>
				</li>
				<li><button>찜목록보기</button></li>
				<li><button>찜취소하기</button></li>
				<li><button>찜수정?할게있어?없는거같은데?</button></li>
			</ul>
		</li>
	</ul>
	
</body>

</html>