<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
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
            width: 350px;
            height: fit-content;
            box-shadow: 0px 0px 5px 0px gray;
            background-color: rgb(250, 255, 173);
        }
    </style>
</head>

<body>
    <script>
        $(document).ready(function () {
            //회원 통계 차트
            let ctx = document.getElementById('customerChart').getContext('2d');
            var chart = new Chart(ctx, {
                // The type of chart we want to create
                type: 'line',

                // The data for our dataset
                data: {
                    labels: ['저번달', '이번달', '1주간'],
                    datasets: [{
                        label: '가입한 회원수',
                        // backgroundColor: 'rgb(255, 99, 132)',
                        borderColor: '#F28D77',
                        data: [${customerLastMonthCnt}, ${customerMonthCnt}, ${customerWeekCnt}]
                    }]
                },

                // Configuration options go here
                options: {}
            });
            //예약 통계 차트
            ctx = document.getElementById('reserveChart').getContext('2d');
            var chart = new Chart(ctx, {
                // The type of chart we want to create
                type: 'bar',

                // The data for our dataset
                data: {
                    labels: ['저번달', '이번달','오늘', '향후 1주','다음달'],
                    datasets: [{
                        label: '에약 수(종료일 기준)',
                        backgroundColor: '#F28D77',
                        borderColor: '#F28D77',
                        data: [${reserveLastMonthCnt}, ${reserveCurrMonthCnt},${reserveCurrCnt},${reserveAfterWeekCnt},${reserveNextMonthCnt}],
                       
                    }]
                },

                // Configuration options go here
                options: {
                    scales: {
				yAxes: [{
					ticks: {
						min: 0,
						// fontSize : 14,
					}
				}]
			}
                }
            });
            //리뷰 통계 차트
            ctx = document.getElementById('reviewChart').getContext('2d');
            var chart = new Chart(ctx, {
                // The type of chart we want to create
                type: 'line',

                // The data for our dataset
                data: {
                    labels: ['저번주','어제', '오늘'],
                    datasets: [{
                        label: '작성한 리뷰 수',
                        // backgroundColor: 'rgb(255, 99, 132)',
                        borderColor: '#F28D77',
                        data: [${reviewlastMonthCnt},${reviewYesterDayCnt}, ${reviewCurrCnt}]
                    }]
                },

                // Configuration options go here
                options: {}
            });
        });
    </script>
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
                                <span>총 회원 :${customerCnt} 명</span>
                            </div>
                        </li>
                        <li>
                            <div class="count-week">
                                <span>이번달 가입한 회원 :${customerMonthCnt} 명</span>
                            </div>
                        </li>
                    </ul>
                    <canvas id="customerChart"></canvas>
                </div>
                <div class="summary">
                    <h3>예약</h3>
                    <ul>
                        <li>
                            <div class="count-week">
                                <span>7일전~오늘 예약 : ${reserveWeekCnt} 개</span>
                            </div>
                        </li>
                        <li>
                            <div class="count-month">
                                <span>이번달 예약 : ${reserveCurrMonthCnt} 개</span>
                            </div>
                            
                        </li>
                    </ul>
                    <canvas id="reserveChart"></canvas>
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
                    <canvas id="reviewChart"></canvas>
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
                    <h3>헤어샵</h3>
                    <ul>
                        <li>
                            <div class="count-all">
                                <span>헤어샵 : ${shopCnt} 개</span>
                            </div>
                        </li>
                    </ul>
                </div>
                
            </div>
        </section>
    </div>
    
</body>

</html>