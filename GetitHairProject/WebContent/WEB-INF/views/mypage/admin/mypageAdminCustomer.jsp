<%@page import="customer.model.vo.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Customer> list = (ArrayList<Customer>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        .admin-main-container {
            width: 1280px;
            margin: 0 auto;
        }

        .admin-content {
            margin-top: 10px;
            width: 100%;
            height: 800px;
            box-shadow: 0px 0px 5px 0px gray;
            border-radius: 3px;
        }

        .customer-list {
            width: 100%;
            border-collapse: collapse;
        }

        .customer-list th {
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
                <form action="/searchCustomer" method="GET">
                    <div class="customer-search">
                        <select name="searchType">
                            <option value="1">아이디</option>
                            <option value="2">이름</option>
                        </select>
                        <input type="text" name="keyword">
                        <button>검색</button>
                    </div>
                </form>
                <form action="/adminDeleteCustomer">
                    <div class="customer-list-wrap">
                        <table class="customer-list">
                            <tr>
                                <th></th>
                                <th>번호</th>
                                <th>아이디</th>
                                <th>성별</th>
                                <th>이름</th>
                                <th>가입일</th>
                                <th>기능</th>
                            </tr>
                            <%
                            if(list != null){
                            %>
                            <%
							for (Customer c : list) {
						    %>
                            <tr>
                                <th width="30"><input type="checkbox" name="chk"></th>
                                <th><%=c.getCustomerNo() %></th>
                                <th><%=c.getCustomerId() %></th>
                                <th><%=c.getCustomerGen() %></th>
                                <th><%=c.getCustomerName() %></th>
                                <th><%=c.getCustomerEnrolldate() %></th>
                                <th>
                                    <button>탈퇴</button>
                                </th>
                            </tr>
                            <%
							}
                            %>
                            <%
                            }
                            %>
                            <tr>
                                <th colspan="7">
                                    <button>선택회원 삭제</button>
                                    <button type="reset">전체 선택해제</button>
                                </th>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
        </section>
    </div>
    <script>
        $(function () {
            $("th").click(function (e) {
                var chk = $(this).siblings().eq(0).children('input');
                if (chk.is(":checked")) {
                    chk.prop("checked", false);
                } else {
                    chk.prop("checked", true);
                }
            })
        });
    </script>
</body>

</html>