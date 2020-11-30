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
<title>Insert title here</title>
<!-- 글꼴 호출 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
<!-- //글꼴 호출 -->

<!-- 부트스트랩 호출 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- //부트스트랩 호출 -->

<!-- jQuery 호출 -->
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<!-- //jQuery 호출 -->
<link rel="stylesheet" href="/css/header/header.css">
<link rel="stylesheet" href="/css/signUp/inputBox.css">
<script type="text/javascript" src="/js/signUp/inputBox.js"></script>
</head>
<body>
   <%@ include file="/WEB-INF/views/common/header.jsp"%>

   <div class="modal fade" id="reReserveModal" role="dialog">
      <div class="modal-dialog">
         <div class="modal-content">
            <form
               action="/insertReReserve?selStatus=<%=selStatus%>&reqPage=<%=reqPage%>"
               method="post">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title">다시 예약하기</h4>
               </div>
               <div class="modal-body">
                  <div class="reserve inputBox">
                     <input id="reserveNo" type="text" class="form-textbox" name="reserveNo"
                         readonly>
                     <span class="form-label label-focused">예약번호 </span>
                  </div>               
                  <div class="reserve inputBox">
                     <input type="text" id="reserveShopName" class="form-textbox" name="reserveShopName"
                        readonly> <span class="form-label label-focused">미용실이름
                     </span>
                  </div>
                  <div class="reserve inputBox">
                     <input type="text" id="reserveStatus" class="form-textbox" name="reserveStatus"
                        readonly> <span class="form-label label-focused">예약상태
                     </span>
                  </div>
                  <div class="reserve inputBox">
                     <input type="text" id="reserveDesignerReq" class="form-textbox" name="reserveDesignerReq"
                        readonly> <span class="form-label label-focused">디자이너
                        요청사항 </span>
                  </div>
                  <div class="reserve inputBox">
                     <input type="text" id="reserveDate" class="form-textbox reserveInput updateAction"
                        name="reserveDate">
                     <span class="form-label label-focused updateActionSpan">예약일정
                     </span>
                  </div>
                  <div class="reserve inputBox">
                     <input type="text" class="form-textbox reserveInput updateAction"
                        name="reserveCustReq" id="reserveCustReq">
                     <span class="form-label label-focused updateActionSpan">손님요청사항
                     </span>
                  </div>
                  <!-- hidden영역 -->
                  <input type="hidden" class="form-textbox" name="customerNo" id="customerNo"
                     >
                  <input type="hidden" class="form-textbox" name="designerNo" id="designerNo"
                     >
                  <input type="hidden" class="form-textbox" name="shopNo" id="shopNo"
                     >
                  <input type="hidden" class="form-textbox" name="styleNo" id="styleNo" value="1">
                  <input type="hidden" class="form-textbox"
                     name="reserveDesignerMemo" id="reserveDesignerMemo"
                     >
                  <!-- hidden영역 -->

               </div>
               <div class="modal-footer">
                  <button type="submit" class="btn btn-default">다시예약 하기</button>
                  <button type="button" class="btn btn-default"
                     onclick="location.href='/cancelReserveByCust?reserveNo=1&selStatus=<%=selStatus%>&reqPage=<%=reqPage%>'">
                     예약 취소 하기</button>
                  <button type="reset" class="btn btn-default resetBtn">초기화</button>
                  <button type="button" class="btn btn-default reserveCustUpdateOn">예약
                     수정하기</button>
                  <button type="button"
                     class="btn btn-default reserveCustUpdateComplete">예약
                     수정완료</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
               </div>
            </form>
         </div>

      </div>
   </div>
   <ul>
      <li><a href="/mypageCust?selStatus=전체&reqPage=1">회원관리 및 예약관리</a></li>
      <li><a
         href="/mypageCustReviewList?customerNo=<%=loginCustomer.getCustomerNo()%>&reqPage=1">리뷰관리</a></li>
      <li><a
         href="/mypageCustLikesList?customerNo=<%=loginCustomer.getCustomerNo()%>&reqPage=1">찜(좋아요)관리</a></li>
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
               <h1><%=selStatus%>
                  List
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
                     <th>손님요청사항 요청사항</th>
                     <th>디자이너 요청사항</th>
                     <th>상태코드</th>
                     <th>기능버튼1</th>
                     <th>기능버튼2</th>
                     <th>기능버튼3</th>
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
                        <button type="button" class="btn btn-primary reReserveBtn"
                           data-toggle="modal" data-target="#reReserveModal"
                           value="<%=r.getReserveNo()%>">예약보기</button>
                     </td>
                     <td><button
                           onclick="location.href='/deleteReserveByCust?reserveNo=<%=r.getReserveNo()%>&selStatus=<%=selStatus%>&reqPage=<%=reqPage%>'"
                           type="button" class="btn btn-primary">예약 삭제하기</button></td>
                           
                     <td><button   type="button" onclick="location.href='/writeReviewByCust?reserveNo=<%=r.getReserveNo()%>&selStatus=<%=selStatus %>&reqPage=<%=reqPage %>'" class="btn btn-primary">리뷰작성하기</button></td>
                  </tr>
                  <%
                     }
                  %>
               </table>
               <div id="pageNavi"><%=pageNavi%></div>
            </div>
         </li>
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
                  var rReserveStatus = decodeURIComponent(data.reserveStatus);
                  var rReserveDesignerReq = decodeURIComponent(data.reserveDesignerReq);
                  var rReserveDate = decodeURIComponent(data.reserveDate);
                  var rReserveCustReq = decodeURIComponent(data.reserveCustReq);   
                  //hidden영역
                  var rCustomerNo = data.customerNo;
                  var rDesignerNo = decodeURIComponent(data.designerNo);
                  var rShopNo = decodeURIComponent(data.shopNo);
                  //var rStyleNo = decodeURIComponent(data.styleNo); //스타일객체수정시 보여주기
                  var rReserveDesignerMemo = decodeURIComponent(data.reserveDesignerMemo);                  
                  //show영역
                  $("#reserveNo").attr('value',rRserveNo);
                  $("#reserveShopName").attr('value',rReserveShopName);
                  $("#reserveStatus").attr('value',rReserveStatus);
                  $("#reserveDesignerReq").attr('value',rReserveDesignerReq);
                  $("#reserveDate").attr('value',rReserveDate);
                  $("#reserveCustReq").attr('value',rReserveCustReq);                  
                  //hidden영역                  
                  $("#customerNo").attr('value',rCustomerNo);
                  $("#designerNo").attr('value',rDesignerNo);
                  $("#shopNo").attr('value',rShopNo);
                  //$("#styleNo").attr('value',rStyleNo); //스타일객체수정시 보여주기
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
         $(".resetBtnCust").click(function() {
            $(".updateAction").attr("readonly", false);
            $(".updateAction").attr('value', '');
         });
         $(".reserveCustUpdateComplete").hide();
         $(".reserveCustUpdateOn").click(function() {
            console.log("수정하기 버튼클릭함");
            $(this).hide();
            $(".reserveCustUpdateComplete").show();
            $(".updateAction").attr("readonly", false);
            $(".updateAction").attr('value', '');
            $(".updateActionSpan").removeClass("label-focused");
         });
         $(".reserveCustUpdateComplete").click(function() {
            console.log("수정하기 완료 버튼클릭함");
            $(this).hide();
            $(".reserveCustUpdateOn").show();
            $(".updateAction").attr("readonly", true);
            for (var i = 0; i < $(".updateAction").length; i++) {
               if ($(".updateAction").eq(i).val() == '') {
                  console.log("여기공백이에요");
                  $(".updateAction").eq(i).removeClass("label-focused");
               } else {
                  console.log("여기공백아니에요");
                  $(".updateAction").eq(i).addClass("label-focused");
               }
            }
         });
      });
   </script>
</body>
</html>