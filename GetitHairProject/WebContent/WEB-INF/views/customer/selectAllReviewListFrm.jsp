<%@page import="review.model.vo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   	 ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
     int start = (Integer)request.getAttribute("start");
     int end = (Integer)request.getAttribute("end");
     int reqPage = (Integer)request.getAttribute("reqPage");
     int maxPageSize = (Integer)request.getAttribute("maxPageSize");
     int customerNo = (Integer)request.getAttribute("customerNo");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer 리뷰 리스트</title>
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
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<h3>나의 리뷰 리스트</h3>
	<!-- 테이블부분 -->
	<table class="talbe" border="1">			
			<tr>				
				<th>리뷰번호</th>
				<th>작성일자</th>
				<th>미용실이름</th>				
				<th>디자이너 이름</th>
				<th>스타일 이름</th>
				<th>리뷰내용</th>
				<th>리뷰보기</th>				
			</tr>
				<%for(Review r : list) {%>
				<tr>
					<td><%=r.getReviewNo() %></td>
					<td><%=r.getReviewDate() %></td>
					<td><%=r.getShop().getShopName() %></td>
					<td><%=r.getDesigner().getDesignerName() %></td>
					<td><%=r.getStyle().getStyleName() %></td>
					<td><%=r.getReviewContent() %></td>					
					<td>
                        <button type="button" class="btn btn-primary reviewShowBtn"
                           data-toggle="modal" data-target="#reviewModal"
                           value="<%=r.getReviewNo()%>">상세보기</button>
                     </td>
					<td><%=r.getReviewDate() %></td>							
				</tr>
				<%} %>			
		</table>
		<!-- 테이블부분 -->
		<!-- 모달부분 -->
		<div class="modal fade" id="reviewModal" role="dialog">
      <div class="modal-dialog">
         <div class="modal-content">
            <form action="/updateReviewByCust" method="post">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title">나의 리뷰상세</h4>
               </div>
               <div class="modal-body">
                  <div class="review inputBox">
                     <input type="text"  id="reviewNo" class="form-textbox" name="reviewNo" readonly>
                     <span class="form-label label-focused">리뷰번호 </span>
                  </div>
                  <div class="review inputBox">
                     <input type="text"  id="reviewDate" class="form-textbox" name="reviewDate" readonly>
                     <span class="form-label label-focused">작성일자 </span>
                  </div>
                  <div class="review inputBox">
                     <input type="text"  id="shopName" class="form-textbox" name="shopName" readonly>
                     <span class="form-label label-focused">미용실이름 </span>
                  </div>
                  <div class="review inputBox">
                     <input type="text"  id="designerName" class="form-textbox" name="designerName" readonly>
                     <span class="form-label label-focused">다지이너이름 </span>
                  </div>
                  <div class="review inputBox">
                     <input type="text"  id="styleName" class="form-textbox" name="styleName" readonly>
                     <span class="form-label label-focused">스타일이름 </span>
                  </div>
                  <div class="review inputBox">                     
                     <textarea id="reviewContent;" class="form-textbox" name="reviewContent;" readonly></textarea>
                     <span class="form-label label-focused">리뷰내용 </span>
                  </div> 
                  
                  <!-- hidden영역 -->
                  <input type="hidden" class="form-textbox" name="shopNo" id="shopNo">
                  <input type="hidden" class="form-textbox" name="designerNo" id="designerNo">
                  <input type="hidden" class="form-textbox" name="customerNo" id="customerNo">
                  <input type="hidden" class="form-textbox" name="styleNo" id="styleNo">
                 
                  <!-- hidden영역 -->

               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default">리뷰 삭제 하기</button>
                  <button type="button" class="btn btn-default">리뷰 수정하기</button>
                  <button type="submit" class="btn btn-default">리뷰 수정완료</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
               </div>
            </form>
         </div>

      </div>
   </div>
		
		<!-- 모달부분 -->
		<!-- 네비게이션부분 -->
		<div>
			<%if(start!=1){ %>
				<a class="btn btn-primary" href="/selectAllReviewList?customerNo=<%=customerNo %>&reqPage=<%=(start-1) %>">이전</a>
			<%} %>
			<%for(int i = start ; i<= end ;i++){ %>
				<a class="btn btn-primary" href = "/selectAllReviewList?customerNo=<%=customerNo %>&reqPage=<%=i%>"> <%=i %></a>
			<%} %>
			<%if(end < maxPageSize){ %>
				<a class="btn btn-primary" href="/selectAllReviewList?customerNo=<%=customerNo %>&reqPage=<%=(end+1) %>">다음</a>
			<%} %>			
		</div>
		<!-- 네비게이션부분 -->
		
</body>
</html>