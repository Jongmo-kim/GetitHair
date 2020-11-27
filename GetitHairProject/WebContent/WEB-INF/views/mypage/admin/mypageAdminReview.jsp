<%@page import="review.model.vo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    int pageSize = (Integer)request.getAttribute("pageSize");
    int reqPage = (Integer)request.getAttribute("reqPage");
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	int type = request.getAttribute("type") != null ? (Integer)request.getAttribute("type") : 0;
    String keyword = request.getAttribute("keyword") != null ? (String)request.getAttribute("keyword") : "";
    
    int maxSize = 6; //표시할 최대 페이지 개수
    int pageStart = (Integer)request.getAttribute("pageStart"); //표시되는 시작 페이지
    int pageEnd = (Integer)request.getAttribute("pageEnd"); // 표시되는 마지막 페이지
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/css/mypage/admin/container.css">
    <style>
        .admin-content {
            margin-top: 10px;
            width: 100%;
            
            box-shadow: 0px 0px 5px 0px gray;
            border-radius: 3px;
        }

        .review-list {
            width: 100%;
            border-collapse: collapse;
        }

        .review-list>tbody>tr:hover {
            background-color: rgb(235, 232, 232);
        }

        .review-list th {
            border-bottom: 1px solid gray;
            height: 30px;
        }
    </style>
</head>

<body>
    <div class="admin-main-container">
        <header>
            <%@ include file="/WEB-INF/views/mypage/admin/common/header.jsp"%>
        </header>
        <section>
            <div class="admin-content">
                <form action="/mypageAdminReview" method="GET">
                    <div class="review-search">
                        <select name="searchType">
                            <option value="1" >아이디</option>
                        </select>
                        <input type="text" name="keyword" value="<%=keyword%>">
                        <button>검색</button>
                    </div>
                </form>
                <form action="/adminDeleteReview">
                    <div class="review-list-wrap">
                        <table class="review-list">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>번호</th>
			                        <th>샵</th>
			                        <th>디자이너</th>
			                        <th>작성자</th>
			                        <th>내용</th>
			                        <th>기능</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%if(list != null){%>
                                <%
                                        for (Review rv : list) {
                                            %>
                                <tr>
                                    <th width="30"><input type="checkbox" name="chk" value="<%=rv.getReviewNo() %>">
                                    </th>
                                    <input type="hidden" name="reviewNo" value="<%=rv.getReviewNo() %>">
                                    <th><%=rv.getReviewNo() %></th>
                                    <th><%=rv.getShop().getShopName() %></th>
                                    <th><%=rv.getDesigner().getDesignerName() %></th>
                                    <th><%=rv.getCustomer().getCustomerId() %></th>
                                    <th><%=rv.getReviewContent() %></th>
                                    <th>
                                        <button id="rvbtn" type="button">작성한 리뷰보기</button>
                                        <button>삭제</button>
                                    </th>
                                </tr>
                                <%}
                                        %>
                                <%
                                    }
                                    %>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="7">
                                        <button>선택회원 탈퇴</button>
                                        <button type="reset">전체 선택해제</button>
                                    </th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="page-nav">
                        <%if(pageStart!=1){%>
                            <a href="mypageAdminReview?reqPage=<%=pageStart-1%>">이전</a>
                        <%}%>
                        <%for(int i = pageStart; i<=pageEnd;i++){%>
                            <a href="mypageAdminReview?reqPage=<%=i%>"><%=i%></a>
                        <%}%>
                        <%if(pageEnd<pageSize){%>
                            <a href="mypageAdminReview?reqPage=<%=pageEnd+1%>">다음</a>
                        <%}%>
                    </div>
                </form>
            </div>
        </section>
    </div>
    <script>
        function setClickToTr() {
            $("tr").off('click');
            $("tr").on("click",function (e) {
                var chk = $(this).children().eq(0).children('input');
                if (chk.is(":checked")) {
                    chk.prop("checked", false);
                } else {
                    chk.prop("checked", true);
                }
            });
        }
        function setClickToReviewTr() {
            $(document).off("click",".row-review");
            $(document).on("click",".row-review",function (e) {
                var chk = $(this).children().eq(0).children('input');
                if (chk.is(":checked")) {
                    chk.prop("checked", false);
                } else {
                    chk.prop("checked", true);
                }
            });
        }
        function setClickToChk(){
            $(document).off("click","[name=chk]");
            $(document).on("click","[name=chk]",function(e){
                if ($(this).is(":checked")) {
                    $(this).prop("checked", false);
                } else {
                    $(this).prop("checked", true);
                }
            });
        }
        $(function () {
            setClickToTr();
            setClickToChk()
            $(".modal-overlay").click(function (e) {
                $(".modal-overlay").css("display", "none");
                $(".review-container").css("display", "none");
            })
            $("#close-modal").click(function (e) {
                $(".modal-overlay").css("display", "none");
                $(".review-container").css("display", "none");
            })
            //리뷰 보기 버튼 클릭 이벤트
            $("#rvbtn").click(function (e) {
                $(".modal-overlay").css("display", "block");
                $(".review-container").css("display", "block");
                $(".review-list").children('tbody').empty();
                var customerNo = $(this).parent().siblings('th').eq(1).text();
                $.ajax({
                    url: "/adminSelectCustomerReview",
                    type: "post",
                    cache: false,
                    dataType: "json",
                    data: { customerNo: 1 },
                    success: function (data) {
                        for (var i = 0; i < data.length; i++) {
                            var html = [
                                "<tr class='row-review'>",
                                "<th width='30'><input type='checkbox' name='chk' value='" + data[i].reviewNo + "'></th>",
                                "<th>" + data[i].reviewNo + "</th>",
                                "<th>" + data[i].shop.shopName + "</th>",
                                "<input type='hidden' name='customerId' value='" + data[i].designer.designerNo + "'>",
                                "<th>" + data[i].designer.designerName + "</th>",
                                "<th>" + data[i].customer.customerId + "</th>",
                                "<th>" + data[i].reviewContent + "</th>",
                                "<th><button>삭제</button></th>",
                                "</tr>"];
                            $(".review-list").children('tbody').append(html.join());
                        }
                    }
                })
                setClickToReviewTr();
                setClickToChk()
                e.stopPropagation();
            })

        });
    </script>
</body>

</html>