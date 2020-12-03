<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <style>
        input:read-only {
            background-color: whitesmoke;
            border: 1px solid;
        }

        input[type=text] {
            width: 400px;
            height: 50px;
            font-size: 18px;
        }
        .update-content{
            margin: 200px auto;
            width: fit-content;
            text-align: center;
        }
        .update-content ul{
            list-style: none;
        }
        li>div{
            font-size: 20px;
        }
        .btns {
            border: 1px solid solid;
            width: 100px;
            height: 40px;
            background-color: white;
        }
    </style>
</head>

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div class="main-container">
        <header>

        </header>
        <section>
            <form action="/hairshopModify" method="GET">
                <div class="update-content">
                    <ul>
                        <li>
                            <div>샵 번호</div>
                            <input type="text" name="shopNo" id="" value="${shop.shopNo}" readonly>
                        </li>
                        <li>
                            <div>샵 이름</div>
                            <input type="text" name="shopName" id="" value="${shop.shopName}">
                        </li>
                        <li>
                            <div>사업자 번호</div>
                            <input type="text" name="" id="" value="${shop.shopCompNo}" readonly>
                        </li>
                        <li>
                            <div>우편번호</div>
                            <input type="text" name="" id="" value="${shop.addrPostcode}" readonly>
                        </li>
                        <li>
                            <div>주소</div>
                            <input type="text" name="" id="" value="${shop.shopAddr}" readonly>
                        </li>
                        <li>
                            <div>상세주소</div>
                            <input type="text" name="" id="" value="${shop.addrDetail}" readonly>
                        </li>
                        <li>
                            <div>전화번호 (최대 15자)</div>
                            <input type="text" name="shopPhone" id="" value="${shop.shopPhone}">
                        </li>
                        <li>
                            <div>오픈시간</div>
                            <input type="text" name="shopOpen" id="" value="${shop.shopOpen}">
                        </li>
                        <li>
                            <div>마감시간</div>
                            <input type="text" name="shopClose" id="" value="${shop.shopClose}">
                        </li>
                        <li>
                            <div>휴일</div>
                            <input type="text" name="shopHoliday" id="" value="${shop.shopHoliday}">
                        </li>
                    </ul>
                    <button class="btns">수정</button>
                    <button class="btns" type="reset" onclick="history.back();">취소</button>
                </div>
            </form>
        </section>
        <footer>

        </footer>
        
    </div>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script>
        $(document).ready(function () {
            $("[name=shopPhone]").keyup(function (e) {
                let str = $(this).val();
                if (str.length > 15) {
                    $(this).val(str.substring(0, str.length - 1));
                    return false;
                }
            });
        });
    </script>
</body>

</html>