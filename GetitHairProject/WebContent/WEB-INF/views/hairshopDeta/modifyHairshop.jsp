<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <header>

    </header>
    <section>
        <form action="/hairshopModify" method="GET">
            <div class="update-content">
                <ul>
                    <li>
                        <div>샵 번호</div>
                        <input type="text" name="shopNo" id="" value="${shop.shopNo}">
                    </li>
                    <li>
                        <div>샵 이름</div>
                        <input type="text" name="shopName" id="" value="${shop.shopName}">
                    </li>
                    <li>
                        <div>사업자 번호</div>
                        <input type="text" name="" id="" value="${shop.shopCompNo}">
                    </li>
                    <li>
                        <div>우편번호</div>
                        <input type="text" name="" id="" value="${shop.addrPostcode}">
                    </li>
                    <li>
                        <div>주소</div>
                        <input type="text" name="" id="" value="${shop.shopAddr}">
                    </li>
                    <li>
                        <div>상세주소</div>
                        <input type="text" name="" id="" value="${shop.addrDetail}">
                    </li>
                    <li>
                        <div>전화번호</div>
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
                <button>제출</button>
            </div>
        </form>
    </section>
    <footer>

    </footer>
</body>

</html>