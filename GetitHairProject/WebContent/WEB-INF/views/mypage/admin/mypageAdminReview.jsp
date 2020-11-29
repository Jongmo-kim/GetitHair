<%@page import="review.model.vo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String keyword = request.getAttribute("keyword") != null ? (String)request.getAttribute("keyword") : "";

%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/css/mypage/admin/container.css">
    <link rel="stylesheet" href="/css/mypage/admin/pagenavi.css">
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
                    <%@ include file="/WEB-INF/views/mypage/admin/common/search-nav.jsp"%>
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
                                <c:if test="${not empty list}">
                                    <c:forEach var="rv" items="${list}">
                                        <tr>
                                            <th width="30"><input type="checkbox" name="reviewNo" value="${rv.reviewNo}">
                                            </th>
                                            <th>${rv.reviewNo}</th>
                                            <th>${rv.shop.shopName}</th>
                                            <th>${empty rv.designer.designerName ? "탈퇴함" : rv.designer.designerName}</th>
                                            <th>${empty rv.customer.customerId ? "탈퇴한 회원" : rv.customer.customerId}</th>
                                            <th>${rv.reviewContent}</th>
                                            <th>
                                                <button class="del-one-btn">삭제</button>
                                            </th>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="7">
                                        <button class="btn-allcheck" type="button">전체선택</button>
                                        <button class="del-btn">선택리뷰 삭제</button>
                                        <button type="reset">전체 선택해제</button>
                                    </th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="page-nav">
                        <c:if test="${pageStart!=1}">
                            <a href="mypageAdminReview?reqPage=${pageStart-1}&list_num=${empty param.list_num ? 20 : param.list_num}">이전</a>
                        </c:if>
                        <c:forEach var="i" begin="${pageStart}" end="${pageEnd}">
                            <a href="mypageAdminReview?reqPage=${i}&list_num=${empty param.list_num ? 20 : param.list_num}"
                                style="${i==(not empty param.reqPage ? param.reqPage : 1) ? " color: black;" : ""
                                }">${i}</a>
                        </c:forEach>
                        <c:if test="${pageEnd<pageSize}">
                            <a href="mypageAdminReview?reqPage=${pageEnd+1}&list_num=${empty param.list_num ? 20 : param.list_num}">다음</a>
                        </c:if>
                    </div>
                </form>
            </div>
        </section>
    </div>
    <script>
        function setClickToTr() {
            $("tr").off('click');
            $("tr").on("click", function (e) {
                var chk = $(this).children().eq(0).children('input');
                if (chk.is(":checked")) {
                    chk.prop("checked", false);
                } else {
                    chk.prop("checked", true);
                }
            });
        }

        function setClickToReviewTr() {
            $(document).off("click", ".row-review");
            $(document).on("click", ".row-review", function (e) {
                var chk = $(this).children().eq(0).children('input');
                if (chk.is(":checked")) {
                    chk.prop("checked", false);
                } else {
                    chk.prop("checked", true);
                }
            });
        }

        function setClickToChk() {
            $(document).off("click", "[name=chk]");
            $(document).on("click", "[name=chk]", function (e) {
                if ($(this).is(":checked")) {
                    $(this).prop("checked", false);
                } else {
                    $(this).prop("checked", true);
                }
            });
        }
        function toggleCheckbox(checkbox) {
            if ($(checkbox).prop("checked") == true)
                $(checkbox).prop("checked", false);
            else if ($(checkbox).prop("checked") == false)
                $(checkbox).prop("checked", true);
        }
        $(function () {
            $(".admin-nav a:eq(2)").css("background-color", "whitesmoke");
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
            // 전체 선택 버튼 클릭 이벤트
            $(".btn-allcheck").on("click", function (e) {
                toggleCheckbox($(".admin-content tbody th>input:checkbox"));
                
            })
            //리뷰 삭제 버튼 클릭 이벤트
            $(".del-one-btn").on("click", function (e) {
                $("input:checkbox[name=customerId]").prop("checked", false);
                if (!confirm("정말 삭제하시겠습니까?")) {
                    return false; //취소 눌렀을 시 submit 이벤트 발생 방지
                }
            })
            //선택리뷰 삭제 버튼 클릭 이벤트
            $(".del-btn").on("click", function (e) {
                if (!confirm("정말 삭제하시겠습니까?")) {
                    return false; //취소 눌렀을 시 submit 이벤트 발생 방지
                }
            })

        });
    </script>
</body>

</html>