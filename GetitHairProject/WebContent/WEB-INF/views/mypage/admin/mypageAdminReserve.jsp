<%@page import="customer.model.vo.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        .reserve-list,
        .review-list {
            width: 100%;
            border-collapse: collapse;
        }

        .reserve-list>tbody>tr:hover,
        .review-list>tbody>tr:hover {
            background-color: rgb(235, 232, 232);
        }

        .reserve-list th {
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
                <form action="/mypageAdminReserve" method="GET">
                    <%@ include file="/WEB-INF/views/mypage/admin/common/search-nav.jsp"%>
                </form>
                <form action="/adminDeleteReserve" method="POST">
                    <div class="reserve-list-wrap">
                        <table class="reserve-list">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>번호</th>
                                    <th>미용실</th>
                                    <th>담당 디자이너</th>
                                    <th>예약자</th>
                                    <th>상태</th>
                                    <th>예약 접수일</th>
                                    <th>예약 종료일</th>
                                    <th>기능</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${not empty list}">
                                    <c:forEach var="rsv" items="${list}">
                                        <tr>
                                            <th width="30"><input type="checkbox" name="reserveNo"
                                                    value="${rsv.reserveNo}">
                                            </th>
                                            <th>${rsv.reserveNo}</th>
                                            <th>${rsv.shop.shopName}</th>
                                            <th>${rsv.designer.designerName}</th>
                                            <th>${rsv.customer.customerId}</th>
                                            <th>${rsv.reserveStatus}</th>
                                            <th>${rsv.reserveDate}</th>
                                            <th>${rsv.reserveEndDate}</th>
                                            <th>
                                                <button class="btn del-one-btn">삭제</button>
                                            </th>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="8">
                                        <button class="btn btn-allcheck" type="button">전체선택</button>
                                        <button class="btn del-btn">선택예약 삭제</button>
                                        <button class="btn"type="reset">전체 선택해제</button>
                                    </th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="page-nav">
                        <c:if test="${pageStart!=1}">
                            <a href="mypageAdminReserve?reqPage=${pageStart-1}">이전</a>
                        </c:if>
                        <c:forEach var="i" begin="${pageStart}" end="${pageEnd}">
                            <a href="mypageAdminReserve?reqPage=${i}"
                                style="${i==(not empty param.reqPage ? param.reqPage : 1) ? " color: black;" : ""
                                }">${i}</a>
                        </c:forEach>
                        <c:if test="${pageEnd<pageSize}">
                            <a href="mypageAdminReserve?reqPage=${pageEnd+1}">다음</a>
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

        function setClickToRemoveReviewBtn() {
            $(document).off("click", ".delete-review");
            $(document).on("click", ".delete-review", function (e) {
                if (confirm("정말 삭제하시겠습니까?")) {

                    let reviewNo = $(this).val();
                    let customerNo = $(this).attr("data-customerNo");
                    $.ajax({
                        url: "/adminDeleteReview",
                        type: "post",
                        cache: false,
                        dataType: "text",
                        data: {
                            reviewNo: reviewNo,
                            isAjax: true
                        },
                        success: function (data) {
                            alert(data);
                            //삭제후 리스트를 다시 불러옴.
                            $(".review-list").children('tbody').empty();
                            reviewAjax(customerNo, 1);
                        }
                    })
                }
                e.stopPropagation();
            });
        }

        function setClickToPageNo(customerNo, reqPage) {
            $(document).off("click", ".page-no");
            $(document).on("click", ".page-no", function (e) {
                $(".review-list").children('tbody').empty();
                reviewAjax(customerNo, reqPage);

            });
        }

        function toggleCheckbox(checkbox) {
            if ($(checkbox).prop("checked") == true)
                $(checkbox).prop("checked", false);
            else if ($(checkbox).prop("checked") == false)
                $(checkbox).prop("checked", true);
        }
        $(function () {
            $(".admin-nav a:eq(4)").css("background-color", "#F2C335");

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
                console.log($(".reserve-list tbody th>input:checkbox"));
                toggleCheckbox($(".reserve-list tbody th>input:checkbox"));

            })
            //한명 탈퇴 버튼 클릭 이벤트
            $(".del-one-btn").on("click", function (e) {
                $("input:checkbox[name=customerId]").prop("checked", false);
                if (!confirm("정말 탈퇴하시겠습니까?")) {
                    return false; //취소 눌렀을 시 submit 이벤트 발생 방지
                }
            })
            //선택회원 탈퇴 버튼 클릭 이벤트
            $(".del-btn").on("click", function (e) {
                if (!confirm("정말 탈퇴하시겠습니까?")) {
                    return false; //취소 눌렀을 시 submit 이벤트 발생 방지
                }
            })

        });
    </script>
</body>

</html>