<%@page import="hairshop.model.vo.Hairshop"%>
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
    <title>관리자 페이지: 관리자 관리</title>
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
        .shop-list,
        .review-list {
            width: 100%;
            border-collapse: collapse;
        }

        .shop-list>tbody>tr:hover,
        .review-list>tbody>tr:hover {
            background-color: rgb(235, 232, 232);
        }

        .shop-list th {
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
                <form action="/mypageAdminShop" method="GET">
                    <div class="shop-search">
                        <select name="searchType">
                            <option value="2" ${param.searchType==2 ? "selected" : "" }>이름</option>
                        </select>
                        <input type="text" name="keyword" value="<%=keyword%>">
                        <button>검색</button>
                    </div>
                </form>
                <form action="/adminDeleteShop">
                    <div class="shop-list-wrap">
                        <table class="shop-list">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>번호</th>
                                    <th>사업자 등록번호</th>
                                    <th>이름</th>
                                    <th>평점</th>
                                    <th>좋아요</th>
                                    <th>우편번호</th>
                                    <th>기능</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${not empty list}">
                                    <c:forEach var="hs" items="${list}">
                                        <tr>
                                            <th width="30"><input type="checkbox" name="shopNo" value="${hs.shopNo}">
                                            </th>
                                            <th>${hs.shopNo}</th>
                                            <th>${hs.shopCompNo}</th>
                                            <th>${hs.shopName}</th>
                                            <th>${hs.shopRate}</th>
                                            <th>${hs.shopLikes}</th>
                                            <th>${hs.addrPostcode}</th>
                                            <th>
                                                <button class="btn rvbtn" type="button">미용실 리뷰목록</button>
                                                <button class="btn btn-one-del">삭제</button>
                                            </th>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="8">
                                        <button class="btn btn-allcheck" type="button">전체선택</button>
                                        <button class="btn btn-del">선택한 샵 삭제</button>
                                        <button class="btn" type="reset">전체 선택해제</button>
                                    </th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="page-nav">
                        <c:if test="${pageStart!=1}">
                            <a href="mypageAdminShop?reqPage=${pageStart-1}">이전</a>
                        </c:if>
                        <c:forEach var="i" begin="${pageStart}" end="${pageEnd}">
                            <a href="mypageAdminShop?reqPage=${i}"
                                style="${i==(not empty param.reqPage ? param.reqPage : 1) ? " color: black;" : ""
                                }">${i}</a>
                        </c:forEach>
                        <c:if test="${pageEnd<pageSize}">
                            <a href="mypageAdminShop?reqPage=${pageEnd+1}">다음</a>
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
                    let shopNo = $(this).attr("data-shopNo");
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
                            console.log(data);
                            //삭제후 리스트를 다시 불러옴.
                            $(".review-list").children('tbody').empty();
                            reviewAjax(shopNo, 1);
                        }
                    })
                }
                e.stopPropagation();
            });
        }
        function setClickToPageNo(shopNo, reqPage) {
            $(document).off("click", ".page-no");
            $(document).on("click", ".page-no", function (e) {
                $(".review-list").children('tbody').empty();
                reviewAjax(shopNo, reqPage);

            });
        }
        //리뷰목록 불러오기
        function reviewAjax(shopNo, reqPage) {
            $.ajax({
                url: "/adminSelectShopReview",
                type: "post",
                cache: false,
                dataType: "json",
                data: {
                    shopNo: shopNo,
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
                                "'data-shopNo='"+data[i].shop.shopNo+"'>삭제</button></th>",
                                "</tr>"
                            ];
                            $(".review-list").children('tbody').append(html.join());
                        }
                        reviewPagingAjax(shopNo,reqPage);
                        console.log(data);
                }
            })
        }
        //리뷰목록 페이징
        function reviewPagingAjax(shopNo, reqPage) {
            $(".review-container .page-nav").empty();
            $.ajax({
                url: "/adminSelectReviewPaging",
                type: "post",
                cache: false,
                dataType: "json",
                data: {
                    shopNo: shopNo,
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
            $(".admin-nav a:eq(5)").css("background-color", "#F2C335");
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
            // 전체 선택 버튼 클릭 이벤트
            $(".btn-allcheck").on("click", function (e) {
                console.log($(".shop-list tbody th>input:checkbox"));
                toggleCheckbox($(".shop-list tbody th>input:checkbox"));

            })
            //미용실 리뷰 목록 버튼 클릭 이벤트
            $(".rvbtn").click(function (e) {
                $(".modal-overlay").css("display", "block");
                $(".review-container").css("display", "block");
                $(".review-list").children('tbody').empty();
                var shopNo = $(this).parent().siblings('th').eq(1).text();
                var reqPage = 1;
                reviewAjax(shopNo, reqPage); // ajax 실행

                setClickToReviewTr();
                setClickToChk()
                setClickToRemoveReviewBtn();

                setClickToPageNo(shopNo, reqPage);
                e.stopPropagation();
            })

        });
    </script>
</body>

</html>