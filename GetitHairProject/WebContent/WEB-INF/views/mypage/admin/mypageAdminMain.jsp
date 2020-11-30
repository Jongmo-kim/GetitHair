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
            flex-wrap: wrap;
            justify-content: flex-start;
            align-content: flex-start;
            margin-top: 10px;
            width: 100%;
            height: 800px;
            box-shadow: 0px 0px 5px 0px gray;
            border-radius: 3px;
        }

        .admin-content>div {
            margin: 30px;
            border-radius: 3px;
        }

        .summary {
            width: 300px;
            height: fit-content;
            box-shadow: 0px 0px 5px 0px gray;
            background-color: rgb(250, 255, 173);
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
                <div class="summary">
                    <h3>회원</h3>
                    <ul>
                        <li>
                            <div class="count-all">
                                <span>회원 :${customerCnt} 명</span>
                            </div>
                        </li>
                        <li>
                            <div class="count-week">
                                <span>일주일간 가입한 회원 :${customerWeekCnt} 명</span>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="summary">
                    <h3>디자이너</h3>
                    <ul>
                        <li>
                            <div class="count-all">
                                <span>디자이너 : ${designerCnt} 명</span>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="summary">
                    <h3>리뷰</h3>
                    <ul>
                        <li>
                            <div class="count-all">
                                <span>리뷰 : ${reviewCnt} 개</span>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="summary">
                    <h3>헤어샵</h3>
                    <ul>
                        <li>
                            <div class="count-all">
                                <span>헤어샵 : ${shopCnt} 개</span>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="summary">
                    <h3>예약</h3>
                    <ul>
                        <li>
                            <div class="count-week">
                                <span>일주일간 예약 : ${reserveWeekCnt} 개</span>
                            </div>
                        </li>
                        <li>
                            <div class="count-month">
                                <span>한달간 예약 : ${reserveWeekCnt} 개</span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
    </div>
</body>

</html>