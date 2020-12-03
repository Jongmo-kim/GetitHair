<%@page import="reserve.model.vo.Reserve"%>
<%@page import="reserve.model.service.ReserveService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//이 JSP '안에서' designer no 1인 모든 예약 list에 가져올게요
	ArrayList<Reserve> list = new ReserveService().selectAllByDesigner(1);
	if (list == null) {
		list = new ArrayList<Reserve>();
	}
	Reserve rt = (Reserve) request.getAttribute("rt");
%>
<html lang="kr">

<head>
<meta charset='utf-8' />






<script>
var arr = new Array();
<%if(!list.isEmpty()){%>
	<%for (Reserve r : list){%>
		arr.push(<%=r.getReserveNo()%>);
	<%}%>
<%}%>

Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};



        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                themeSystem: 'bootstrap',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                initialDate: '2020-12-12',
                navLinks: true, // can click day/week names to navigate views
                selectable: true,
                selectMirror: true,
                select: function(arg) {
                    /*var title = prompt('Event Title:');
                    if (title) {
                        calendar.addEvent({
                            title: title,
                            start: arg.start,
                            end: arg.end,
                            allDay: arg.allDay
                        })
                    }*/
                    calendar.unselect();
                },
                eventClick: function(arg) {
                	//data-toggle="modal" data-target="#myModal"
                    var selectEvent = arg.el;
                	var event = arg.event;
                	var reserveNo = arg.event.id;
                	return selectEvent;
                	return event;
                	return reserveNo;
                },
                editable: true,
                dayMaxEvents: true, // allow "more" link when too many events
                events: [
                	<%for (Reserve r : list) {%>
                	{
                		title : '<%=r.getReserveTitle()%>',
                		start : <%=r.getReserveStartdate().getTime()+32400000%>,
                		end : <%=r.getReserveEndDate().getTime()+32400000%>,
                		id : <%=r.getReserveNo()%>
                	},
                	<%}%>
                ],
                eventColor: '#D9ABA0'
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
                if(isEmpty(arr[i].end)){
                	endDate.push(arr[i].start);
                } else{
                	endDate.push(arr[i].end);
                }
                reserveNo.push(arr[i].id);
              }
              
                var JsonTitles = JSON.stringify(titles);
                var JsonStartDate = JSON.stringify(startDate);
                var JsonEndDate = JSON.stringify(endDate);
                var JsonReserveNo = JSON.stringify(reserveNo);
                $.ajax({
               	 type: "get",
               	 url: "/updateReserveCalendar",
               	 data : {JsonEndDate:JsonEndDate,JsonStartDate:JsonStartDate,JsonTitles:JsonTitles,JsonReserveNo:JsonReserveNo},
               	 dataType:"JSON",
               	 beforeSend: function() {
               		  $('#loading_indicator').show().fadeIn('fast');
               		  $('#submitBtn').hide();
               		 },
               	 success : function(data){
               		 var result = data.result;
               		 $("#ajaxResult").html('수정된 reserve 갯수 :'+result);
               	 },
               	 error : function(data){
               		 var result = data.result;
               		 $("#ajaxResult").html(result);
               	 },
               	 	complete: function() {
               		  $('#loading_indicator').fadeOut();
               		  $('#submitBtn').show();
               		 }
                 });
               });
            calendar.render();

        });
        function isEmpty(str){
            
            if(typeof str == "undefined" || str == null || str == "")
                return true;
            else
                return false ;
        }
         $(function(){
        	$(document).on("click",".fc-daygrid-event-harness",function(){
        		console.log($(this));
        		//$(this).attr('data-toggle', 'modal'); 
        		//$(this).attr('data-target', '#eventModal');
        		$("#eventModal").show();
        		var idx = $(".fc-daygrid-event-harness").index(this);
        		var reserveNo = arr[idx];
        		console.log(reserveNo);
            	$.ajax({
            		url : "/selectOneReserveCalnedar",
            		data : {reserveNo,reserveNo},
            		type : "post",
            		success : function(date){
            			var data = JSON.parse(date);
            			var reserveNoInputTag = $('input[name="reserveNo"]');
            			var reserveTitleInputTag = $('input[name="reserveTitle"]');
            			var customerNameInputTag = $('input[name="customerName"]');
            			var reserveStartDate = $('input[name="reserveStartDate"]');
            			var reserveEndDate = $('input[name="reserveEndDate"]');
            			var reserveDate = $('input[name="reserveDate"]');
            			var reserveStatus = $('input[name="reserveStatus"]');
            			var reserveCustReq = $('input[name="reserveCustReq"]');
            			var reserveDesignerReq = $('input[name="reserveDesignerReq"]');
            			var reserveDesignerMemo = $('input[name="reserveDesignerMemo"]');
            			var reserveDesignerMemo = $('input[name="reserveDesignerMemo"]');
            			var reserveNo = data.reserveNo;
            			var reserveNo = data.reservTitle;
            			
            			var endDate = new Date(data.reserveEndDate);
            			$(reserveEndDate).val(endDate.format('yyyy-MM-dd hh시 mm분'));
            			
            			var currDate = new Date(data.reserveDate);
            			$(reserveStartDate).val(currDate.format('yyyy-MM-dd hh시 mm분'));
            			
            			var startDate = new Date(data.reserveStartDate);
            			$(reserveDate).val(startDate.format('yyyy-MM-dd hh시 mm분'));
            			
            			$(reserveNoInputTag).val(data.reserveNo);
            			$(reserveTitleInputTag).val(data.reserveTitle);
            			$(customerNameInputTag).val(data.customerName);
            			$(reserveStatus).val(data.reserveStatus);
            			$(reserveCustReq).val(data.reserveCustReq);
            			$(reserveDesignerReq).val(data.reserveDesignerReq);
            			$(reserveDesignerMemo).val(data.reserveDesignerMemo);
            			
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
        	});
        	$(document).on("click","#modalClose",function(){
        		$("#eventModal").hide();
        	});
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

.btn {
	height: 48px;
}
</style>
</head>

<body>

	<!-- The Modal -->
	<div class="modal" id="eventModal" style="display: none">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style="text-align: center"></h4>
					<button type="button" class="close">&times;</button>
				</div>

				<!-- Modal body -->
				<form action="/updateReserveCalendarModal" method="post">
					<div class="modal-body" style="text-align: center">
						<table >
							<tr>
								<th colspan="2"><input type="hidden" name="reserveNo" class="form-control"> 
								<input type="text" name="reserveTitle" class="form-control"></th>
							</tr>
							<tr>
								<th><label>예약자명</label></th>
								<td><input type="text" name="customerName" class="form-control" readonly></td>
							</tr>
							<tr>
								<th><label>예약시작일</label></th>
								<td><input type="text" name="reserveStartDate" class="form-control"></td>
							</tr>
							<tr>
								<th><label>예약종료일</label></th>
								<td><input type="text" name="reserveEndDate" class="form-control"></td>
							</tr>
							<tr>
								<th><label>예약날짜</label></th>
								<td><input type="text" name="reserveDate" class="form-control"></td>
							</tr>
							<tr>
								<th><label>상태</label></th>
								<td><input type="text" name="reserveStatus" class="form-control"></td>
							</tr>
							<tr>
								<th><label>손님코멘트</label></th>
								<td><input type="text" name="reserveCustReq" class="form-control" readonly></td>
							</tr>
							<tr>
								<th><label>디자이너코멘트</label></th>
								<td><input type="text" name="reserveDesignerReq" class="form-control"></td>
							</tr>
							<tr>
								<th><label>메모</label></th>
								<td><input type="text" name="reserveDesignerMemo" class="form-control"></td>
							</tr>
						</table>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-default">수정</button>
						<button type="button" class="btn btn-default" id="modalClose">닫기</button>
					</div>
				</form>

			</div>
		</div>
	</div>
	<div style="margin: 0 auto; width: 1100px;">
		<h1>예약 리스트</h1>
		<br><br>
	</div>
	<div id='calendar'
		class="fc fc-media-screen fc-direction-ltr fc-theme-bootstrap"></div>
	<br>
	
	<div style="margin: 0 auto; width: 1100px;">
		<button id="submitBtn" type="button" class="btn btn-primary" >저장하기</button>
	</div>
	
	
	<!-- <div style="position: fixed; top: 500px;">
		<button id="submitBtn" type="button" class="btn btn-primary"
			style="width: 200px; height: 200px">제출하기</button>

		<span id="loading_indicator" style="display: none;">
			<p style="text-align: center; top: 0; position: absolute;">
				<img src="/img/signup/loading.gif" />
			</p>
		</span>
	</div> -->

	<div id="result"
		style="display: none; height: 500px; background-color: black;"></div>

</body>
</html>
