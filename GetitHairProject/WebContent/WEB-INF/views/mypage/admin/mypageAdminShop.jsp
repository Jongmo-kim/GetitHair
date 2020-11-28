<%@page import="hairshop.model.vo.Hairshop"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    int pageSize = (Integer)request.getAttribute("pageSize");
    int reqPage = (Integer)request.getAttribute("reqPage");
	ArrayList<Hairshop> list = (ArrayList<Hairshop>) request.getAttribute("list");
	int type = request.getAttribute("type") != null ? (Integer)request.getAttribute("type") : 0;
	String keyword = request.getAttribute("keyword") != null ? (String)request.getAttribute("keyword") : "";
	
	String sel1 = type == 1 ? "selected" : "";
    String sel2 = type == 2 ? "selected" : "";
    
    int pageStart = (Integer)request.getAttribute("pageStart"); //표시되는 시작 페이지
    int pageEnd = (Integer)request.getAttribute("pageEnd"); // 표시되는 마지막 페이지
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
    </div>
    <div class="admin-main-container">
        <header>
            <%@ include file="/WEB-INF/views/mypage/admin/common/header.jsp"%>
        </header>
        <section>
            <div class="admin-content">
                <form action="/mypageAdminCustomer" method="GET">
                    <div class="customer-search">
                        <select name="searchType">
                            <option value="1" <%=sel1 %>>아이디</option>
                            <option value="2" <%=sel2 %>>이름</option>
                        </select>
                        <input type="text" name="keyword" value="<%=keyword%>">
                        <button>검색</button>
                    </div>
                </form>
                <form action="/adminDeleteCustomer">
                    <div class="customer-list-wrap">
                        <table class="customer-list">
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
                                <%if(list != null){%>
                                <%
                                    for (Hairshop c : list) {
                                        %>
                                <tr>
                                    <th width="30"><input type="checkbox" name="chk" value="<%=c.getShopNo() %>">
                                    </th>
                                    <th><%=c.getShopNo() %></th>
                                    <th><%=c.getShopCompNo() %></th>
                                    <th><%=c.getShopName() %></th>
                                    <th><%=c.getShopRate() %></th>
                                    <th><%=c.getShopLikes() %></th>
                                    <th><%=c.getAddrPostcode() %></th>
                                    <th>
                                        <button id="rvbtn" type="button">작성한 리뷰보기</button>
                                        <button>탈퇴</button>
                                    </th>
                                </tr>
                                <%
                                    }
                                    %>
                                <%
                                }
                                %>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="8">
                                        <button>선택회원 탈퇴</button>
                                        <button type="reset">전체 선택해제</button>
                                    </th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="page-nav">
                        <%if(pageStart!=1){%>
                            <a href="mypageAdminShop?reqPage=<%=pageStart-1%>">이전</a>
                        <%}%>
                        <%for(int i = pageStart; i<=pageEnd;i++){%>
                            <a href="mypageAdminShop?reqPage=<%=i%>" style="<%=i==reqPage ? "color: black;" : ""%></a>"><%=i%></a>
                        <%}%>
                        <%if(pageEnd<pageSize){%>
                            <a href="mypageAdminShop?reqPage=<%=pageEnd+1%>">다음</a>
                        <%}%>
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
                    $.ajax({
                        url: "/adminDeleteReview",
                        type: "post",
                        cache: false,
                        dataType: "text",
                        data: { reviewNo: reviewNo },
                        success: function (data) {
                            alert(data);
                            console.log(data);
                            //삭제후 리스트를 다시 불러옴.
                            $("#rvbtn").trigger("click");
                        }
                    })
                }
                e.stopPropagation();
            });
        }
        $(function () {
            $(".admin-nav a:eq(4)").css("background-color","whitesmoke");
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
                    data: { customerNo: customerNo },
                    success: function (data) {
                        if (data != null)
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
                                    "<th><button class='delete-review' value='" + data[i].reviewNo + "'>삭제</button></th>",
                                    "</tr>"];
                                $(".review-list").children('tbody').append(html.join());
                            }
                    }
                })
                setClickToReviewTr();
                setClickToChk()
                setClickToRemoveReviewBtn();
                e.stopPropagation();
            })

        });
    </script>
</body>

</html>