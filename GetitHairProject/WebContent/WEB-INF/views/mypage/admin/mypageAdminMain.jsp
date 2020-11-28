<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/css/mypage/admin/container.css">
    <style>
        .admin-content {
            display: flex;
            justify-content: flex-start;
            margin-top: 10px;
            width: 100%;
            height: 800px;
            box-shadow: 0px 0px 5px 0px gray;
            border-radius: 3px;
        }
        .admin-content>div{
            margin: 30px;
            border-radius: 3px;
        }
        .customer-summary{
            width: 300px;
            height: 300px;
            box-shadow: 0px 0px 5px 0px gray;
        }
        .designer-summary{
            width: 300px;
            height: 300px;
            box-shadow: 0px 0px 5px 0px gray;
        }
    </style>
</head>

<body>
    <div class="admin-main-container">
        <header>
            <%@ include file="/WEB-INF/views/mypage/admin/common/header.jsp" %>
        </header>
        <section>
            <div class="admin-content">
                <div class="customer-summary">
                    <div class="count-all">
                        <span>회원 :${customerCnt} 명</span>
                    </div>
                    <div class="count-week">
                        <span>일주일간 가입한 회원</span>
                    </div>
                </div>
                <div class="designer-summary">
                    <div class="count-all">
                        <span>디자이너 : ${designerCnt} 명</span>
                    </div>
                </div>
                <div class="review-summary">
                    <div class="count-all">
                        <span>리뷰 : ${reviewCnt} 개</span>
                    </div>
                </div>
                <div class="shop-summary">
                    <div class="count-all">
                        <span>헤어샵 : ${shopCnt} 개</span>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>

</html>