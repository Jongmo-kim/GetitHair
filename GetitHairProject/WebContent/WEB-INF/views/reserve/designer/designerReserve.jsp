<%@page import="reserveTest.model.service.ReserveTestService"%>
<%@page import="reserve.model.service.ReserveService"%>
<%@page import="reserveTest.model.vo.ReserveTest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%
 	//이 JSP '안에서' designer no 1인 모든 예약 list에 가져올게요
 	ArrayList<ReserveTest> list = new ReserveTestService().selectAllByDesigner(1);
 	if(list==null){
 		list = new ArrayList<ReserveTest>();
 	}
 %>
<html lang="kr">

<head>
<meta charset='utf-8' />


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src='/calendarapi/lib/main.js'></script>
<link href='/calendarapi/lib/main.css' rel='stylesheet' />
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css'
	rel='stylesheet' />
<link
	href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://bootswatch.com/4/lux/bootstrap.min.css">

<script>
        function consolelog(log) {
            console.log(log);
        }
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                themeSystem: 'bootstrap',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                initialDate: '2020-09-12',
                navLinks: true, // can click day/week names to navigate views
                selectable: true,
                selectMirror: true,
                select: function(arg) {
                    var title = prompt('Event Title:');
                    if (title) {
                        calendar.addEvent({
                            title: title,
                            start: arg.start,
                            end: arg.end,
                            allDay: arg.allDay
                        })
                    }
                    calendar.unselect();
                },
                eventClick: function(arg) {
                	//data-toggle="modal" data-target="#loginModal"
                	//data-toggle="modal" data-target="#myModal"
                    var selectEvent = arg.el;
                	var event = arg.event;
                	var reserveNo = arg.event.id;
                	selectEvent.setAttribute('data-toggle', 'modal'); 
                	selectEvent.setAttribute('data-target', '#myModal');
                	//모달창을 띄웠으니 그안 inputvalue에 값을 채울거에요
                	//어떻게 채울거냐면 reserveNo로 값을 가져와야하는데 지금 html에서는 가져올수없으니
                	//ajax를 통해 sevlet을 호출하여 모든 rserve요소들을 가져올거에요
                	//1. ajax 요청을 받을 적당한 servlet만들기
                	//2. reserveNo를 ajax를 통해 servlet에 보내기
                	//3. servlet에서 받은 data로 input tag에 값 채워넣기
                	$.ajax({
                		url : "/reserveCalnedarUpdate?reserveNo="+reserveNo,
                		type : "post",
                		success : function(data){
                			console.log(data);
                			var reserveNo = data.reserveNo;
                			var reserveNo = data.reserveNo;
                			var reserveNo = data.reserveNo;
                			var reserveNo = data.reserveNo;
                			var reserveNo = data.reserveNo;
                			var reserveNo = data.reserveNo;
                			var reserveNo = data.reserveNo;
                			var reserveNo = data.reserveNo;
                			var reserveNo = data.reserveNo;
                			var reserveNo = data.reservTitle;
                			
                			var InputTagTitle = $('[name="reservTitle"]');
                			$(InputTagTitle).html(reserveNo);
                			console.log(data);
                			console.log(data.reserveNo);
                			console.log(data.reserveStartDate);
                			console.log(data.reserveEndDate);
                			console.log(data.reserveTitle);
                			console.log(data.reserveStatus);
                			console.log(data.reserveCustReq);
                			console.log(data.reserveDesignerReq);
                			console.log(data.reserveDisignerMemo);
                			console.log(data.customerName);
                		},beforeSend: function() {
                    		  $('#loading_indicator').show().fadeIn('fast');
                      		  $('#submitBtn').hide();
                      		 },
                    	error : function(){
                    		
                    	},
                    	complete : function(){
                    		 $('#loading_indicator').fadeOut();
                      		  $('#submitBtn').show();
                    	}
                	})
                },
                editable: true,
                dayMaxEvents: true, // allow "more" link when too many events
                events: [
                	<%for(ReserveTest r : list) {%>
                	{
                		title : '<%=r.getReserveTitle()%>',
                		start : <%=r.getReserveStartDate().getTime() %>,
                		end : <%=r.getReserveEndDate().getTime()%>,
                		id : <%=r.getReserveNo()%>
                	},
                	<%} %>
                ],
                eventColor: '#A6756A'
            });
            document.getElementById('submitBtn').addEventListener('click', function() {
            	var arr = calendar.getEvents();
                var titles = [];
          	  var startDate = [];
          	  var endDate = [];
          	  var reserveNo = [];
          	  
                for(var i = 0 ; i < arr.length; ++i){
                  titles.push(arr[i].title);
                  startDate.push(arr[i].start);
                  endDate.push(arr[i].end);
                  reserveNo.push(arr[i].id);
                }
              
                var JsonTitles = JSON.stringify(titles);
                var JsonStartDate = JSON.stringify(startDate);
                var JsonEndDate = JSON.stringify(endDate);
                var JsonReserveNo = JSON.stringify(reserveNo);
                $.ajax({
                	type : "get",
                	data : {JsonTitles:JsonTitles, JsonStartDate:JsonStartDate, JsonEndDate:JsonEndDate, JsonReserveNo:JsonReserveNo},
                	url : "/test2Form",
                	dataType : "JSON",
                	success : function(){
                		$('#result').css('display','block');
                	},
                	 beforeSend: function() {
                  		  $('#loading_indicator').show().fadeIn('fast');
                  		  $('#submitBtn').hide();
                  		 },
                	error : function(){
                		
                	},
                	complete : function(){
                		 $('#loading_indicator').fadeOut();
                  		  $('#submitBtn').show();
                	}
                });
            });
            calendar.render();

        });
    </script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}
</style>
</head>

<body>
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#myModal">Open modal</button>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">선택한 일자 출력</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<input type="hidden" name="reservNo"><br> 
					<input type="text" name="reservTitle"><br> 
					<label>예약자명</label><input type="text" name="customerName"><br> 
					<label>예약시작일</label><input type="text" name="reserveStartDate"><br> 
					<label>예약종료일</label><input type="text" name="reserveEndDate"><br> 
					<label>예약날짜</label><input type="text" name="reserveDate"><br> 
					<label>손님코멘트</label><input type="text" name="reserveCustReq"><br> 
					<label>디자이너코멘트</label><input type="text" name="reserveDesignerReq"><br> 
					<label>메모</label><input type="text" name="reserveDesignerMemo"><br> 
					<input type="submit" value="수정"> 
					<input type="button" value="닫기">
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="submit" class="btn btn-default" data-dismiss="modal">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>
	<div id='calendar'
		class="fc fc-media-screen fc-direction-ltr fc-theme-bootstrap"></div>
	<br>
	<button id="submitBtn"  type="button" class="btn btn-primary">저장하기</button>
	
	
	 <div style="position:fixed; top:500px;">
  	<button id="submitBtn" type="button" class="btn btn-primary" style="width:200px; height:200px">제출하기</button>
  	
  	<span id="loading_indicator" style="display:none;">
	 <p style="text-align: center; top:0;  position: absolute;">
	 	<img src="/img/signup/loading.gif" />
	 </p>
	</span>
  </div>
  
	<div id="result" style="display:none;height:500px; background-color:black;"></div>
</body>
</html>
