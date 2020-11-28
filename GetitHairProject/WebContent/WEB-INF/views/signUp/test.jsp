<%@page import="java.util.ArrayList"%>
<%@page import="reserveTest.model.service.ReserveTestService"%>
<%@page import="reserveTest.model.dao.ReserveTestDao"%>
<%@page import="reserveTest.model.vo.ReserveTest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   		ArrayList<ReserveTest> rt1 = new ReserveTestService().selectAllByDesigner(1);
   		if(rt1 == null){
   			 rt1  = new ArrayList<ReserveTest>();
   		}
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='/calendarapi/lib/main.css' rel='stylesheet' />
<script src='/calendarapi/lib/main.js'></script>

<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
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
        //modal
        //arg.events
          alert(arg.event.end);
          
        
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      
      	events: [
      		<% for(ReserveTest r : rt1){ %>
      		{ 
	      		title:'<%=r.getReserveTitle()%>',
    	   		start : <%=r.getReserveStartDate().getTime()%>,
       			end : <%=r.getReserveEndDate().getTime()%>,
       			id: <%=r.getReserveNo()%>
       			},
      		<%}%>
      	]
      
    });
    document.getElementById('submitBtn').addEventListener('click',function(){
      var arr = calendar.getEvents();
      var titles = [];
	  var startDate = [];
	  var endDate = [];
	  var reserveNo = [];
	  
      for(var i = 0 ; i < arr.length; ++i){
        console.log(arr[i].title);
        console.log(arr[i].start);
        console.log(arr[i].end);
        
        titles.push(arr[i].title);
        startDate.push(arr[i].start);
        endDate.push(arr[i].end);
        console.log(arr[i].end);
        reserveNo.push(arr[i].id);
      }
    
      var JsonTitles = JSON.stringify(titles);
      var JsonStartDate = JSON.stringify(startDate);
      var JsonEndDate = JSON.stringify(endDate);
      var JsonReserveNo = JSON.stringify(reserveNo);
      $.ajax({
    	 type: "get",
    	 url: "/test2Form",
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
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<h1 id="ajaxResult">수정여부</h1>
  <div id='calendar'></div>
  <div style="position:fixed; top:500px;">
  	<button id="submitBtn" type="button" class="btn btn-primary" style="width:200px; height:200px">제출하기</button>
  	<div id="loading_indicator" style="display:none;">
	 <p style="text-align: center; top:0;  position: absolute;">
	 	<img src="/img/signup/loading.gif" />
	 </p>
	</div>
  </div>
	
</body>
</html>
