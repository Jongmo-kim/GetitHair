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
<!-- jQuery 호출 -->
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
	<style>
		p{
			text-align : center;
		}
		#pageNavi{
   		margin:0 auto;
   		padding: 0;
   		text-align:center;
   }
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
	<h1>나의 리뷰 리스트</h1>
	<!-- 테이블부분 -->
	<table class="table" style="width:100%;text-align:center;" border="1">			
			<tr>				
				<th><p>리뷰번호</p></th>
				<th><p>작성일자</p></th>
				<th><p>미용실이름</p></th>				
				<th><p>디자이너 이름</p></th>
				<th><p>스타일 이름</p></th>
				<th><p>리뷰내용</p></th>
				<th><p>리뷰보기</p></th>				
			</tr>
				<%for(Review r : list) {%>
				<tr>
					<td><%=r.getReviewNo() %></td>
					<td><%=r.getReviewDate() %></td>
					<td><%=r.getShop().getShopName() %></td>
					<td><%=r.getDesigner().getDesignerName() %></td>
					<td><%=r.getStyle().getStyleName() %></td>
					<td><%=r.getReviewContent() %></td>					
					<td><button type="button" class="btn btn-primary showReviewBtn"
                           data-toggle="modal" data-target="#reviewModal" style="width:100%;"
                           value="<%=r.getReviewNo()%>">상세보기</button>
                    </td>							
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
                     <span class="form-label label-focused">디자이너이름 </span>
                  </div> 
                  <div class="review inputBox">
                     <input type="text"  id="styleName" class="form-textbox" name="styleName" readonly>
                     <span class="form-label label-focused">스타일이름 </span>
                  </div>             
                  <div class="review inputBox">
                     <textarea class="form-textbox" id="reviewContent" name="reviewContent" readonly></textarea>
                     <span id="reviewContentSpan" class="form-label label-focused">리뷰내용 </span>
                  </div>             
                  
                  <!-- hidden영역 -->
                  <input type="hidden" class="form-textbox" name="customerNo" id="customerNo" value="<%=customerNo%>">
                 	<input type="hidden" class="form-textbox" name="reqPage" id="reqPage" value="<%=reqPage%>">
                  <!-- hidden영역 -->

               </div>
               <div class="modal-footer">                 
                  <button type="button" class="btn btn-default" id="updateOnBtn">수정하기</button>
                  <button type="button" class="btn btn-default" id="updateCancelBtn">수정취소</button>
                  <button type="submit" class="btn btn-default" id="updateCompleteBtn">수정완료</button>
                  <button type="button" class="btn btn-default" id="deleteBtn">삭제하기</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
               </div>
            </form>
         </div>

      </div>
   </div>
		
		<!-- 모달부분 -->
		<!-- 네비게이션부분 -->
		<div id="pageNavi">
			<%if(start!=1){ %>
				<a class="btn btn-primary" href="/mypageCustReviewList?customerNo=<%=customerNo %>&reqPage=<%=(start-1) %>">이전</a>
			<%} %>
			<%for(int i = start ; i<= end ;i++){ %>
				<a class="btn btn-primary" href = "/mypageCustReviewList?customerNo=<%=customerNo %>&reqPage=<%=i%>"> <%=i %></a>
			<%} %>
			<%if(end < maxPageSize){ %>
				<a class="btn btn-primary" href="/mypageCustReviewList?customerNo=<%=customerNo %>&reqPage=<%=(end+1) %>">다음</a>
				<a class="btn btn-primary" href="/mypageCustReviewList?customerNo=<%=customerNo %>&reqPage=<%=maxPageSize %>">끝으로</a>
			<%} %>
						
		</div>
		<!-- 네비게이션부분 -->
</div>
		<script>
		 $(function(){    
			 $("#updateCancelBtn").hide();
		      $("#updateCompleteBtn").hide();
		      $("#updateOnBtn").show();
		      var reviewContent ;
		      $(".showReviewBtn").click(function(){   
		         var reviewNo = $(this).val();  
		         var reqPage = <%=reqPage %>;
		         var customerNo =  <%=customerNo %>;
		         console.log("reviewNo = "+reviewNo);         
		         $.ajax({
		            url: "/mypageCustReviewAjax",
		            type: "get",            
		            data : {reviewNo:reviewNo},
		            dataType : "JSON",
		               success : function(data){
		                  var reviewNo = data.reviewNo;
		                  var reviewDate = decodeURIComponent(data.reviewDate);
		                  var shopName = decodeURIComponent(data.shopName);
		                  var designerName = decodeURIComponent(data.designerName);
		                  var styleName = decodeURIComponent(data.styleName);
		                  reviewContent = decodeURIComponent(data.reviewContent);           

		                  $("#reviewNo").attr('value',reviewNo);
		                  $("#reviewDate").attr('value',reviewDate);
		                  $("#shopName").attr('value',shopName);
		                  $("#designerName").attr('value',designerName);
		                  $("#styleName").attr('value',styleName);
		                  //$("#reviewContent").attr('value',reviewContent);
		                  $("#reviewContent").html("\n"+reviewContent);
		                  //btn에 링크넣기
		                  $("#deleteBtn").attr('onclick',"location.href='/deleteReviewByCust?reviewNo="+reviewNo+"&customerNo="+customerNo+"&reqPage="+reqPage+"'");
		                  //$("#updateCompleteBtn").attr('onclick',"location.href='/updateReviewByCust?reviewNo="+reviewNo+"&customerNo="+customerNo+"&reqPage="+reqPage+"'");
		               }		               
		         });
		      });
		      $("#updateOnBtn").click(function(){
		    	$("#updateOnBtn").hide();
		      	$("#updateCancelBtn").show();
		      	$("#updateCompleteBtn").show();
		      	$("#reviewContent").attr('readonly',false);
		      	$("#reviewContent").focus();
		      });
		      $("#updateCompleteBtn").click(function(){
		    	  $("#updateOnBtn").show();
		    	  $("#updateCancelBtn").hide();
			      $("#updateCompleteBtn").hide();
			      $("#reviewContent").attr('readonly',true);
		      });
		  	  $("#updateCancelBtn").click(function(){
		  		 console.log("수정취소클릭!");
		  		console.log("reviewContent = "+reviewContent);
		  		$("#updateOnBtn").show();
		  		$("#updateCancelBtn").hide();
		      	$("#updateCompleteBtn").hide();		      
		      	$("#reviewContent").attr('readonly',true);
		    	$("#reviewContent").html("\n"+reviewContent);
		    	$("#reviewContent").val("\n"+reviewContent);
		    	//console.log($("#reviewContent").val());
		    	//console.log($("#reviewContent").html());		    	
		      	//$(".showReviewBtn").click();
			  });
		 });
		</script>	
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>	
</body>
</html>