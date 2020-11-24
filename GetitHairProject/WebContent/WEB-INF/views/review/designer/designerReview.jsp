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
	<section>
		<h1>리뷰관리</h1>
		<div>
			<h3>리뷰제목</h3>
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">관리<span class="caret"></span></a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="javascript:void(0)" class="recShow">답글달기</a></li>
				<li><a href="#">신고하기</a></li>
			</ul>
			<p>리뷰내용 내용 내용</p>
			<img src="#"> <span>★ 0.0</span>
			<!-- 재예약시에만 노출되게 수정해야함 -->
			<span>재예약</span> <span>0시간 전</span>
		</div>
		<div>
			<h4>답글작성</h4>
		</div>
		<div class="commentList">
				<%for(reviewComment rc : list) {	// 댓글 출력 로직%>
					<%if(rc.getNoticeCommentLevel() == 1) {%>
						<ul>
							<li>
								<p><%=rc.getReviewCommentWriter() %></p>
								<p><%=rc.getReviewCommentDate() %></p>
							</li>
							<li>
								<p><%=rc.getReviewCommentContentBr() %></p>
								<textarea name="reviewCommentContent" class="form-control changeComment" style="display:none;"><%=rc.getReviewCommentContent() %></textarea>
								
								<p class="linkBox">
									<a href="javascript:void(0)" onclick="modifyComment(this,'<%=rc.getReviewCommentNo()%>','<%=r.getReviewNo()%>')">수정</a>
									<a href="javascript:void(0)" onclick="deleteComment(this,'<%=rc.getReviewCommentNo()%>','<%=r.getReviewNo()%>')">삭제</a>
									<!-- javascript:void(0) -> a태그 링크 무효화 -->
									<a href="javascript:void(0)" class="recShow">답글달기</a>
								</p>
							</li>
						</ul>
						
					<%} // level==1 if문 종료지점%>
					
				<%} // 댓글 for문 종료 지점%>
			</div>
	</section>
	<script>
	$(".recShow").click(function(){
		$(this).hide();
		var idx = $(".recShow").index(this);
		$(".recCancel").eq(idx).parents("div").css("display","block");
	});
	$(".recCancel").click(function(){
		var idx = $(".recCancel").index(this);
		$(this).parents(".re").css("display","none");
		$(".recShow").eq(idx).show();
	});
	
	function modifyComment(obj,commentNo,noticeNo){
		$(obj).parent().prev().show();		// textarea를 보여주는 코드
		$(obj).parent().prev().prev().hide();	// p태그 숨기는 코드
		// 수정버튼 -> 수정완료
		$(obj).html('수정완료');
		$(obj).attr('onclick','modifyComplete(this,"'+commentNo+'","'+noticeNo+'")');
		// 삭제버튼 -> 수정취소
		$(obj).next().html('취소');
		$(obj).next().attr('onclick','modifyCancel(this,"'+commentNo+'","'+noticeNo+'")');
		$(obj).next().next().hide();	// 답글 버튼 숨김
		
	}
	function modifyCancel(obj,commentNo,noticeNo){
		$(obj).parent().prev().hide();		// textarea를 숨기는 코드
		$(obj).parent().prev().prev().show();	// p태그 보여주는 코드
		// 수정버튼 -> 수정완료
		$(obj).prev().html('수정');
		$(obj).prev().attr('onclick','modifyComment(this,"'+commentNo+'","'+noticeNo+'")')
		// 취소 -> 삭제
		$(obj).html('삭제');
		$(obj).attr('onclick','deleteComment(this,"'+commentNo+'","'+noticeNo+'")');
		$(obj).next().show();	// 답글 버튼 보임
	}
	function modifyComplete(obj,commentNo,noticeNo){
		var form = $("<form action='/noticeCommentUpdate' method='post'></form>");
		form.append($("<input type='text' name='noticeCommentNo' value='"+commentNo+"'>")); // append 자식으로 추가
		form.append($("<input type='text' name='noticeNo' value='"+noticeNo+"'>"));
		form.append($(obj).parent().prev());
		// ↑ 아직 자바스크립트로만 있어서, ↓ body태그에 추가해줌
		$("body").append(form);
		form.submit();
	}
	
	function deleteComment(obj,commentNo,noticeNo){
		if(confirm("댓글을 삭제하시겠습니까?")){
			location.href="/noticeCommentDelete?noticeCommentNo="+commentNo+"&noticeNo="+noticeNo;
		}
	}
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>