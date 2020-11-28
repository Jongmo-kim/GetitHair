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
    <link rel="stylesheet" href="/css/mypage/admin/container.css">
    <link rel="stylesheet" href="/css/mypage/admin/pagenavi.css">
    <style>
        .modal-overlay {
            display: none;
            position: fixed;
            width: 100%;
            height: 100%;

            background-color: gray;
            opacity: 0.5;
        }

        .review-container {
            display: none;
            position: fixed;
            width: 1000px;
            height: 800px;
            top: 50%;
            left: 50%;
            margin-top: -400px;
            margin-left: -500px;
            background-color: white;
            box-shadow: 0px 0px 5px 0px gray;
            border-radius: 3px;
        }

        .admin-content {
            margin-top: 10px;
            width: 100%;
            height: 800px;
            box-shadow: 0px 0px 5px 0px gray;
            border-radius: 3px;
        }

        .customer-list,
        .review-list {
            width: 100%;
            border-collapse: collapse;
        }

        .customer-list>tbody>tr:hover,
        .review-list>tbody>tr:hover {
            background-color: rgb(235, 232, 232);
        }

        .customer-list th {
            border-bottom: 1px solid gray;
            height: 30px;
        }
    </style>
</head>

<body>
    <div class="modal-overlay">
    </div>
    <div class="review-container">
        <div class="header" style="width: 100%;text-align: right;">
            <span id="close-modal">닫기</span>
        </div>
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

                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="7">
                            <button>선택한 리뷰 삭제</button>
                            <button type="reset">전체 선택해제</button>
                        </th>
                    </tr>
                </tfoot>
            </table>
        </div>
        <div class="page-nav">

        </div>
    </div>
    <div class="admin-main-container">
        <header>
            <%@ include file="/WEB-INF/views/mypage/admin/common/header.jsp"%>
        </header>
        <section>
            <div class="admin-content">
                <form action="/mypageAdminCustomer" method="GET">
                    <%@ include file="/WEB-INF/views/mypage/admin/common/search-nav.jsp"%>
                </form>
                <form action="/adminDeleteCustomer" method="POST">
                    <div class="customer-list-wrap">
                        <table class="customer-list">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>번호</th>
                                    <th>아이디</th>
                                    <th>성별</th>
                                    <th>이름</th>
                                    <th>가입일</th>
                                    <th>기능</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${not empty list}">
                                    <c:forEach var="c" items="${list}">
                                        <tr>
                                            <th width="30"><input type="checkbox" name="customerNo"
                                                    value="${c.customerNo}">
                                            </th>
                                            <th>${c.customerNo}</th>
                                            <th>${c.customerId}</th>
                                            <th>${c.customerGen}</th>
                                            <th>${c.customerName}</th>
                                            <th>${c.customerEnrolldate}</th>
                                            <th>
                                                <button class="rvbtn" type="button">작성한 리뷰보기</button>
                                                <button class="del-one-btn">탈퇴</button>
                                            </th>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="7">
                                        <button class="btn-allcheck" type="button">전체선택</button>
                                        <button class="del-btn">선택회원 탈퇴</button>
                                        <button type="reset">전체 선택해제</button>
                                    </th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="page-nav">
                        <c:if test="${pageStart!=1}">
                            <a href="mypageAdminCustomer?reqPage=${pageStart-1}">이전</a>
                        </c:if>
                        <c:forEach var="i" begin="${pageStart}" end="${pageEnd}">
                            <a href="mypageAdminCustomer?reqPage=${i}"
                                style="${i==(not empty param.reqPage ? param.reqPage : 1) ? " color: black;" : ""
                                }">${i}</a>
                        </c:forEach>
                        <c:if test="${pageEnd<pageSize}">
                            <a href="mypageAdminCustomer?reqPage=${pageEnd+1}">다음</a>
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
        //리뷰목록 불러오기
        function reviewAjax(customerNo, reqPage) {
            $.ajax({
                url: "/adminSelectCustomerReview",
                type: "post",
                cache: false,
                dataType: "json",
                data: {
                    customerNo: customerNo,
                    reqPage: reqPage
                },
                success: function (data) {
                    if (data != null)
                        for (var i = 0; i < data.length; i++) {
                            var html = [
                                "<tr class='row-review'>",
                                "<th width='30'><input type='checkbox' name='chk' value='" + data[i]
                                .reviewNo + "'></th>",
                                "<th>" + data[i].reviewNo + "</th>",
                                "<th>" + data[i].shop.shopName + "</th>",
                                "<th>" + data[i].designer.designerName + "</th>",
                                "<th>" + data[i].customer.customerId + "</th>",
                                "<th>" + data[i].reviewContent + "</th>",
                                "<th><button class='delete-review' value='" + data[i].reviewNo +
                                "'data-customerNo='"+data[i].customer.customerNo+"'>삭제</button></th>",
                                "</tr>"
                            ];
                            $(".review-list").children('tbody').append(html.join());
                        }
                        reviewPagingAjax(customerNo,reqPage);
                }
            })
        }
        //리뷰목록 페이징
        function reviewPagingAjax(customerNo, reqPage) {
            $(".review-container .page-nav").empty();
            $.ajax({
                url: "/adminSelectReviewPaging",
                type: "post",
                cache: false,
                dataType: "json",
                data: {
                    customerNo: customerNo,
                    reqPage: reqPage
                },
                success: function (data) {
                    let html = [];

                    if (data.pageStart != 1) {
                        html.push('<a href="#">이전</a>');
                    }
                    for (let i = data.pageStart; i <= data.pageEnd; i++) {
                        html.push('<a href="#" class="page-no" style="' + (i == data.reqPage ?
                            "color: black;" : "") + '">' + i + '</a>');
                    }
                    if (data.pageEnd < data.maxPageSize) {
                        html.push('<a href="#">다음</a>');
                    }
                    $(".review-container .page-nav").append(html.join());
                }
            })
        }

        function toggleCheckbox(checkbox) {
            if ($(checkbox).prop("checked") == true)
                $(checkbox).prop("checked", false);
            else if ($(checkbox).prop("checked") == false)
                $(checkbox).prop("checked", true);
        }
        $(function () {
            $(".admin-nav a:eq(1)").css("background-color", "whitesmoke");

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
                console.log($(".customer-list tbody th>input:checkbox"));
                toggleCheckbox($(".customer-list tbody th>input:checkbox"));

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
            //리뷰 보기 버튼 클릭 이벤트
            $(".rvbtn").click(function (e) {
                $(".modal-overlay").css("display", "block");
                $(".review-container").css("display", "block");
                $(".review-list").children('tbody').empty();
                var customerNo = $(this).parent().siblings('th').eq(1).text();
                var reqPage = 1;
                reviewAjax(customerNo, reqPage); // ajax 실행

                setClickToReviewTr();
                setClickToChk()
                setClickToRemoveReviewBtn();

                setClickToPageNo(customerNo, reqPage);
                e.stopPropagation();
            })

        });
    </script>
</body>

</html>