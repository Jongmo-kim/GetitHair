<%@page import="reserve.model.service.ReserveService"%>
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
   int reqPage = (Integer) request.getAttribute("reqPage");
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer 마이페이지</title>
<!-- jQuery 호출 -->
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<style>
ul {
	list-style: none;
}

#pageNavi {
	margin: 0 auto;
	padding: 0;
	text-align: center;
}

.buttons {
	display: flex;
	align-items: center;
	justify-content: left;
	float: right;
	width: 100%;
}

.btn-group {
	width: 80%;
}

.tabButton {
	width: 15%;
}

.tabLable {
	width: 5%;
}
.table{
	border : 1px solid black;
}	
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="modal fade" id="reReserveModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<form
					action="/insertReReserve?selStatus=<%=selStatus%>&reqPage=<%=reqPage %>"
					method="poset">
					<div class="modal-header">
						<h4>나의예약</h4>
						<button type="button" class="close btn btn-outline-secondary" data-dismiss="modal">&times;</button>						
					</div>
					<div class="modal-body">
						<div class="reserve inputBox">
							<input id="reserveNo" type="text" class="form-textbox"
								name="reserveNo" readonly> <span
								class="form-label label-focused">예약번호 </span>
						</div>
						<div class="reserve inputBox">
							<input type="text" id="reserveShopName" class="form-textbox"
								name="reserveShopName" readonly> <span
								class="form-label label-focused">미용실이름 </span>
						</div>
						<div class="reserve inputBox">
							<input type="text" id="reserveDesignerName" class="form-textbox"
								name="reserveDesignerName" readonly> <span
								class="form-label label-focused">디자이너이름 </span>
						</div>
						<div class="reserve inputBox">
							<input type="text" id="reserveStatus" class="form-textbox"
								name="reserveStatus" readonly> <span
								class="form-label label-focused">예약상태 </span>
						</div>
						<div class="reserve inputBox">
							<input type="text" id="reserveDesignerReq" class="form-textbox"
								name="reserveDesignerReq" readonly> <span
								class="form-label label-focused">디자이너 요청사항 </span>
						</div>
						<!-- <input type="datetime-local" id="reserveDate"
								class="form-textbox reserveInput updateAction"
								name="reserveDate3"> -->
						<div class="reserve inputBox">
							<input type="date" id="reserveDate"
								class="form-textbox reserveInput updateAction"
								name="reserveDate1"> <span
								class="form-label label-focused updateActionSpan">예약일자 </span>
						</div>
						<div class="reserve inputBox">
							<input type="time" id="reserveTime"
								class="form-textbox reserveInput updateAction"
								name="reserveDate2"> <span
								class="form-label label-focused updateActionSpan">예약시간 </span>
						</div>

						<div class="reserve inputBox">
							<input type="text" class="form-textbox reserveInput updateAction"
								name="reserveCustReq" id="reserveCustReq"> <span
								class="form-label label-focused updateActionSpan">손님요청사항
							</span>
						</div>
						<!-- hidden영역 -->
						<input type="hidden" class="form-textbox" name="customerNo"
							id="customerNo"> <input type="hidden"
							class="form-textbox" name="designerNo" id="designerNo"> <input
							type="hidden" class="form-textbox" name="shopNo" id="shopNo">
						<input type="hidden" class="form-textbox" name="stylelistNo"
							id="stylelistNo"> <input type="hidden"
							class="form-textbox" name="styleNo" id="styleNo"> <input
							type="hidden" class="form-textbox" name="reserveDesignerMemo"
							id="reserveDesignerMemo">
						<!-- hidden영역 -->

					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-outline-secondary">다시예약 하기</button>
						<button type="button" class="btn btn-outline-secondary"
							onclick="location.href='/cancelReserveByCust?reserveNo=1&selStatus=<%=selStatus%>&reqPage=<%=reqPage%>'">
							예약 취소 하기(상태변경)</button>
						<button type="button" class="btn btn-info" data-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="container">
		<h1>회원관리 및 예약관리</h1>
		<ul>
			<p>
				[<%=loginCustomer.getCustomerName()%>]님 환영합니다.
			</p>
			<li>
				<button type="button" class="btn btn-outline-secondary"
					onclick="location.href='/updateAllCustomerFrm?customerNo=<%=loginCustomer.getCustomerNo()%>'">정보수정</button>
				<button type="button" class="btn btn-outline-secondary"
					onclick="location.href='/deleteAllCustomer?customerNo=<%=loginCustomer.getCustomerNo()%>'">회원탈퇴</button>
			</li>
			<br>
			<li><a class="btn btn-outline-secondary btn-lg"
				href="/mypageCustReviewList?customerNo=<%=loginCustomer.getCustomerNo()%>&reqPage=1">나의
					리뷰 리스트 확인</a> <br></li>

			<div class="tab_container">
				<h1><%=selStatus%>
					List
				</h1>
				<div class="buttons">
					<input type="checkBox" id="allCheck"><label
						class="tabLable" for="allCheck">전체</label>
					<button type="button" class="btn btn-outline-secondary btn-lg tabButton"
						id="allDelBtn">삭제</button>
					<div class="btn-group"
						style="display: flex; justify-content: flex-end;">
						<button type="button" class="btn btn-outline-secondary btn-lg tabButton"
							onclick="location.href='/mypageCust?selStatus=전체&reqPage=1'">전체</button>
						<button type="button" class="btn btn-outline-secondary btn-lg tabButton"
							onclick="location.href='/mypageCust?selStatus=예약&reqPage=1'">예약</button>
						<button type="button" class="btn btn-outline-secondary btn-lg tabButton"
							onclick="location.href='/mypageCust?selStatus=완료&reqPage=1'">완료</button>
						<button type="button" class="btn btn-outline-secondary btn-lg tabButton"
							onclick="location.href='/mypageCust?selStatus=취소&reqPage=1'">취소</button>
					</div>
				</div>
				<br>
				<table class="table table-striped table-hover" style="width: 100%;">
					<tr>
						<th>선택</th>
						<th>번호</th>
						<th>예약일시</th>
						<th>S.Name</th>
						<th>D.Name</th>
						<th>MyReq</th>
						<th>D.Req</th>
						<th>Status</th>
						<th>Read</th>
						<th>Delete</th>
						<th>Write</th>
					</tr>
					<%
                     for (Reserve r : reserveList) {
                 	 %>
						<tr>
						<td><input type="checkBox" class="subChk"
							value="<%=r.getReserveNo()%>"></td>
						<td><%=r.getReserveNo()%></td>
						<td><%=r.getReserveDate()%></td>
						<td><%=r.getShop().getShopName()%></td>
						<td><%=r.getDesigner().getDesignerName()%></td>
						<td><%=r.getReserveCustReq()%></td>
						<td><%=r.getReserveDesignerReq()%></td>
						<td><%=r.getReserveStatus()%></td>
						<td>
							<button type="button" class="btn btn-outline-secondary reReserveBtn" 
								data-toggle="modal" data-target="#reReserveModal"
								value="<%=r.getReserveNo()%>">예약 보기</button>
						</td>
						<td><button
								onclick="location.href='/deleteReserveByCust?reserveNo=<%=r.getReserveNo()%>&selStatus=<%=selStatus%>&reqPage=<%=reqPage%>'"
								type="button" class="btn btn-outline-secondary">예약 삭제</button></td>

						<td><button type="button"
								onclick="location.href='/writeReviewByCust?reserveNo=<%=r.getReserveNo()%>&selStatus=<%=selStatus %>&reqPage=<%=reqPage %>'"
								class="btn btn-outline-secondary" btn-sm>리뷰 작성</button></td>
					</tr>
					<%
                     }
                  	%>

				</table>
				<div id="pageNavi"><%=pageNavi%></div>
			</div>
		</ul>
	</div>
	<script>
   //document.getElementById('reserveDate').value = new Date().toISOString().substring(0, 10);;
   $(function(){
      $(".reReserveBtn").click(function(){   
         var reserveNo = $(this).val(); 
         
         console.log("reserveNo = "+reserveNo);         
         $.ajax({
            url: "/mypageCustAjax",
            type: "get",            
            data : {reserveNo:reserveNo},
            dataType : "JSON",
               success : function(data){
                  console.log("성공");
                  //여기서 servlet에서 보낸 값을 받는다.
                  //그후 그값을 형식에 맞춰 변환후 각각의 input에 value를 세팅한다.
                  //var rRserveNo = data;
                  //show영역
                  var rRserveNo = data.reserveNo;
                  var rReserveShopName = decodeURIComponent(data.reserveShopName);
                  var rReserveDesignerName = decodeURIComponent(data.reserveDesignerName);
                  var rReserveStatus = decodeURIComponent(data.reserveStatus);
                  var rReserveDesignerReq = decodeURIComponent(data.reserveDesignerReq);
                  var rReserveDate = decodeURIComponent(data.reserveDate);
                  var rReserveTime = decodeURIComponent(data.reserveTime);
                  var rReserveCustReq = decodeURIComponent(data.reserveCustReq);   
                  //hidden영역
                  var rCustomerNo = data.customerNo;
                  var rDesignerNo = data.designerNo;
                  var rShopNo = data.shopNo;
                  var rStyleNo = data.styleNo; //스타일객체수정시 보여주기
                  var rStylelistNo = data.stylelistNo; //스타일객체수정시 보여주기
                  var rReserveDesignerMemo = decodeURIComponent(data.reserveDesignerMemo);                  
                  //show영역
                  $("#reserveNo").attr('value',rRserveNo);
                  $("#reserveShopName").attr('value',rReserveShopName);
                  $("#reserveDesignerName").attr('value',rReserveDesignerName);
                  $("#reserveStatus").attr('value',rReserveStatus);
                  $("#reserveDesignerReq").attr('value',rReserveDesignerReq);
                  $("#reserveDate").attr('value',rReserveDate);
                  $("#reserveTime").attr('value',rReserveTime);
                  $("#reserveCustReq").attr('value',rReserveCustReq);                  
                  //hidden영역                  
                  $("#customerNo").attr('value',rCustomerNo);
                  $("#designerNo").attr('value',rDesignerNo);
                  $("#shopNo").attr('value',rShopNo);
                  $("#styleNo").attr('value',rStyleNo); //스타일객체수정시 보여주기
                  $("#stylelistNo").attr('value',rStylelistNo); //스타일객체수정시 보여주기
                  $("#reserveDesignerMemo").attr('value',rReserveDesignerMemo);               
               }               
         });
      });      
      $("#allDelBtn").click(function(){
         var chkList = new Array();
         var obj = $(".subChk");
         var selStatus = '<%=selStatus%>';
         var reqPage =<%=reqPage%>;
                  $("input:checkbox[class='subChk']:checked").each(
                        function() {
                           chkList.push(this.value);
                        });
                  if(chkList.length==0){
                	  alert("선택된 예약이 없습니다. 선택 후 삭제해주세요");
                	  return;
                  }
                  var JsonChkList = JSON.stringify(chkList);                  	
                  $.ajax({
                     url : "/deleteReserveList",
                     type : "get",
                     data : {
                        JsonChkList : JsonChkList,
                        selStatus : selStatus,
                        reqPage : reqPage
                     },
                     dataType : "JSON",
                     success : function(data) {
                        var result = data.result;
                        var reqPage2 = data.reqPage;
                        var selStatus2 = data.selStatus;
                        console.log("성공 호출");
                        alert("총  " + result + "개 삭제완료 되었습니다.");
                        console.log("result = " + result);
                        console.log("reqPage = " + reqPage2);
                        console.log("selStatus = " + selStatus2);
                        location.href = "/mypageCust?selStatus="
                              + selStatus2 + "&reqPage=" + reqPage2;
                     },
                     error : function(data) {
                        var result = data.result;
                        var reqPage2 = data.reqPage;
                        var selStatus2 = data.selStatus;
                        console.log("실패 호출");
                        alert("선택된 항목이 삭제되지 않았습니다.");
                        console.log("result = " + result);
                        console.log("reqPage = " + reqPage2);
                        console.log("selStatus = " + selStatus2);
                        location.href = "/mypageCust?selStatus="
                              + selStatus2 + "&reqPage=" + reqPage2;
                     }
                  });
               });
         $("#allCheck").click(function() {
            if ($("#allCheck").prop("checked")) {
               $(".subChk").prop("checked", true);
            } else {
               $(".subChk").prop("checked", false);
            }
         });              
      });
   </script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>