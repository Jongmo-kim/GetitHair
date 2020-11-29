<%@page import="java.util.List"%>
<%@page import="reserve.model.vo.Reserve"%>
<%@page import="java.util.ArrayList"%>
<%@page import="customer.model.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Reserve> reserveList = (ArrayList<Reserve>) request.getAttribute("reserveList");
	String pageNavi = (String) request.getAttribute("pageNavi");
	String selStatus = (String) request.getAttribute("selStatus");
	int reqPage= (Integer) request.getAttribute("reqPage");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<ul>
		<li><a href="/mypageCust?selStatus=전체&reqPage=1">회원관리 및 예약관리</a></li>
		<li><a href="/mypageCustReviewList?customerNo=<%=loginCustomer.getCustomerNo()%>&reqPage=1">리뷰관리</a></li>
		<li><a href="/mypageCustLikesList?customerNo=<%=loginCustomer.getCustomerNo()%>&reqPage=1">찜(좋아요)관리</a></li>
	</ul>
	<div id="reserveList" style="widtn: 80%;">
		<h1>회원관리 및 예약관리</h1>
		<ul>
			<p>
				[<%=loginCustomer.getCustomerName()%>]님 환영합니다.
			</p>
			<li>
				<button type="button" class="btn btn-primary"
					onclick="location.href='/updateAllCustomerFrm?customerNo=<%=loginCustomer.getCustomerNo()%>'">정보수정</button>
				<button type="button" class="btn btn-danger"
					onclick="location.href='/deleteAllCustomer?customerNo=<%=loginCustomer.getCustomerNo()%>'">회원탈퇴</button>
			</li>
			<li>
				<div style="text-align: right;" class="tabs">
					<a class="btn btn-primary btn-lg"
						href="/mypageCust?selStatus=전체&reqPage=1">전체</a> <a
						class="btn btn-warning btn-lg"
						href="/mypageCust?selStatus=예약&reqPage=1">예약</a> <a
						class="btn btn-success btn-lg"
						href="/mypageCust?selStatus=완료&reqPage=1">완료</a> <a
						class="btn btn-danger btn-lg"
						href="/mypageCust?selStatus=취소&reqPage=1">취소</a>
				</div>
				<div class="tab_container">
					<h1><%=selStatus%> List
					</h1>
					<input type="checkBox" id="allCheck"><label for="allCheck">전체선택</label>
					<button type="button" class="btn btn-primary" id="allDelBtn">삭제</button>
					<table class="table" border="1">
						<tr>							
							<th>선택</th>
							<th>예약번호</th>
							<th>예약일시</th>
							<th>미용실이름</th>
							<th>디자이너 이름</th>
							<th>디자이너 요청사항</th>
							<th>상태코드</th>
							<th>기능버튼1</th>
							<th>기능버튼2</th>							
						</tr>
						<%	for (Reserve r : reserveList) {	%>
						<tr>
							<td><input type="checkBox" class="subChk" value="<%=r.getReserveNo()%>"></td>
							<td><%=r.getReserveNo()%></td>
							<td><%=r.getReserveDate()%></td>
							<td><%=r.getShop().getShopName()%></td>
							<td><%=r.getDesigner().getDesignerName()%></td>
							<td><%=r.getReserveDesignerReq()%></td>
							<td><%=r.getReserveStatus()%></td>
							<td><button type="button" class="btn btn-primary">다시 예약하기</button></td>
							<td><button onclick = "location.href='/deleteReserve?reserveNo=<%=r.getReserveNo() %>&selStatus=<%=selStatus %>&reqPage=<%=reqPage %>'" type="button" class="btn btn-primary">예약 삭제하기</button></td>							
						</tr>
						<%}	%>
					</table>
					<div id="pageNavi"><%=pageNavi%></div>
				</div>
			</li>
		</ul>
	</div>
	<script>
	$(function(){
		$("#allDelBtn").click(function(){
			var chkList = new Array();
			var obj = $(".subChk");
			var selStatus = '<%=selStatus %>' ;
			var reqPage = <%=reqPage %>;
			$("input:checkbox[class='subChk']:checked").each(function(){
				chkList.push(this.value);				
			});				
			var JsonChkList = JSON.stringify(chkList);			
			$.ajax({
				url : "/deleteReserveList",
				type : "get",
				data : {JsonChkList:JsonChkList,
					selStatus:selStatus,
					reqPage:reqPage},				
				dataType: "JSON",
				success : function(data){
					var result=data.result;
					var reqPage2 =data.reqPage;
					var selStatus2 = data.selStatus;
					console.log("성공 호출");
					alert("총  "+result+"개 삭제완료 되었습니다.");
					console.log("result = "+result);
					console.log("reqPage = "+reqPage2);
					console.log("selStatus = "+selStatus2);
					location.href="/mypageCust?selStatus="+selStatus2+"&reqPage="+reqPage2;
				},
				error : function(data){
					var result=data.result;
					var reqPage2 =data.reqPage;
					var selStatus2 = data.selStatus;
					console.log("실패 호출");
					alert("선택된 항목이 삭제되지 않았습니다.");
					console.log("result = "+result);
					console.log("reqPage = "+reqPage2);
					console.log("selStatus = "+selStatus2);
					location.href="/mypageCust?selStatus="+selStatus2+"&reqPage="+reqPage2;
				}
			});
			
		});		
		$("#allCheck").click(function(){			
			if($("#allCheck").prop("checked")){
				$(".subChk").prop("checked",true);
			}else{
				$(".subChk").prop("checked",false);
			}
		});			
	});
	</script>
</body>
</html>