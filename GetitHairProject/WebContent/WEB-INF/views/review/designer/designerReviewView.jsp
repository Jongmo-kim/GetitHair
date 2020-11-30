<%@page import="review.model.vo.ReviewComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="review.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Review r = (Review)request.getAttribute("r");
    	ArrayList<ReviewComment> list = (ArrayList<ReviewComment>)request.getAttribute("list");
    	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<h1>리뷰 수정중</h1>
	<section>
		<div style="width:80%; margin:0 auto;">
			<table class="table table-bordered">
				<tr>
					<th>작성자</th>
					<td><%=r.getCustomer() == null ? "탈퇴한 회원" : r.getCustomer().getCustomerName() %></td>
				</tr>
				<!-- 시술 이미지 수정중 -->
				<%-- <tr>
					<th>시술이미지</th>
					<td>
						<%if(r.getReviewImg() != null) {%>
						<img src='/upload/photo/"+<%=r.getReviewImg() %>+"' width='100%'>
						<%} %>
					</td>
				</tr> --%>
				<tr>
					<th>내용</th>
					<td><%=r.getReviewContentBr() %></td>
				</tr>
				<tr style="text-align:center">
					<th colspan="2">
						<a href="javascript:history.go(-1)">목록으로</a>
					</th>
				</tr>
			</table>
			<!-- 디자이너 로그인 구현 시 주석 제거  -->
			<%-- <%if(d != null) {%> --%>
			<div class="inputComment">
				<form action="/insertDesignerReviewComment" method="post">
					<ul>
						<li>
							<%-- <input type="hidden" name="reviewCommentWriter" value="<%=d.getDesignerId() %>"> --%>
							<input type="hidden" name="reviewRef" value="<%=r.getReviewNo() %>">
							<input type="hidden" name="reviewCommentRef" value="0">
							<textarea class="form-control" name="reviewCommentContent"></textarea>
						</li>
						<li>
							<button type="submit">등록</button>
						</li>
					</ul>
				</form>
			</div>
			<%-- <%} %> --%>
			<div class="commentList">
				<%for(ReviewComment rc : list) {	// for문을 통해서 댓글을 출력하는 로직%>
						<ul>
							<li>
								<p><%=rc.getReviewCommentWriter() %></p>
								<p><%=rc.getReviewCommentDate() %></p>
							</li>
							<li>
							<!-- 줄바꿈 오류 못잡음 (강사님한테 질문 한번 해보기) -->
								<p><%=rc.getReviewCommentContent()%>
								</p>
								<textarea name="reviewCommentContent" class="form-control changeComment" style="display:none;"><%=rc.getReviewCommentContent() %></textarea>
								<%-- <%if(d!=null) {%> --%>
								<p class="linkBox">
									<%-- <%if(d.getDesignerId().equals(rc.getReviewCommentWriter())) {	// 작성자일때 보임%> --%>
									<a href="javascript:void(0)" onclick="modifyComment(this,'<%=rc.getReviewCommentNo()%>','<%=r.getReviewNo()%>')">수정</a>
									<a href="javascript:void(0)" onclick="deleteComment(this,'<%=rc.getReviewCommentNo()%>','<%=r.getReviewNo()%>')">삭제</a>
									<%-- <%} %> --%>
								</p>
							</li>
						</ul>
					<%-- <%} %> --%>
					
				<%} // 댓글 for문 종료 지점%>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
	
	function modifyComment(obj,commentNo,reviewNo){
		$(obj).parent().prev().show();		// textarea를 보여주는 코드
		$(obj).parent().prev().prev().hide();	// p태그 숨기는 코드
		// 수정버튼 -> 수정완료
		$(obj).html('수정완료');
		$(obj).attr('onclick','modifyComplete(this,"'+commentNo+'","'+reviewNo+'")');
		// 삭제버튼 -> 수정취소
		$(obj).next().html('취소');
		$(obj).next().attr('onclick','modifyCancel(this,"'+commentNo+'","'+reviewNo+'")');
		$(obj).next().next().hide();	// 답글 버튼 숨김
		
	}
	function modifyCancel(obj,commentNo,reviewNo){
		$(obj).parent().prev().hide();		// textarea를 숨기는 코드
		$(obj).parent().prev().prev().show();	// p태그 보여주는 코드
		// 수정버튼 -> 수정완료
		$(obj).prev().html('수정');
		$(obj).prev().attr('onclick','modifyComment(this,"'+commentNo+'","'+reviewNo+'")')
		// 취소 -> 삭제
		$(obj).html('삭제');
		$(obj).attr('onclick','deleteComment(this,"'+commentNo+'","'+reviewNo+'")');
		$(obj).next().show();	// 답글 버튼 보임
	}
	function modifyComplete(obj,commentNo,reviewNo){
		var form = $("<form action='/designerReviewCommentUpdate' method='post'></form>");
		form.append($("<input type='text' name='reviewCommentNo' value='"+commentNo+"'>")); // append 자식으로 추가
		form.append($("<input type='text' name='reviewNo' value='"+reviewNo+"'>"));
		form.append($(obj).parent().prev());
		// ↑ 아직 자바스크립트로만 있어서, ↓ body태그에 추가해줌
		$("body").append(form);
		form.submit();
	}
	
	function deleteComment(obj,commentNo,reviewNo){
		if(confirm("댓글을 삭제하시겠습니까?")){
			location.href="/designerReviewCommentDelete?reviewCommentNo="+commentNo+"&reviewNo="+reviewNo;
		}
	}
	</script>
	
</body>
</html>