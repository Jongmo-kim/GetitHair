<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <style>
        .admin-nav-wrap {
            width: 100%;
            overflow: hidden;
            border: 1px solid gray;
            box-shadow: 0px 0px 5px 0px gray;
            border-radius: 3px;
        }

        .admin-nav {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .admin-nav>li {
            float: left;
            border-right: 1px solid gray;
        }

        .admin-nav>li>a {
            display: block;
            text-decoration: none;
            color: gray;
            font-weight: bold;
            font-size: large;
            text-align: center;
            line-height: 50px;
            width: 200px;
            height: 50px;
        }

        .admin-nav>li>a:hover {
            background-color: whitesmoke;
        }
    </style>
</head>

<body>
    <div class="admin-nav-wrap">
        <ul class="admin-nav">
            <li><a href="mypageAdmin">홈</a></li>
            <li><a href="mypageAdminCustomer">회원 관리</a></li>
            <li><a href="mypageAdminReview">리뷰 관리</a></li>
            <li><a href="mypageAdminDesigner">디자이너 관리</a></li>
            <li><a href="mypageAdminShop">미용실 관리</a></li>
        </ul>
    </div>
</body>

</html>