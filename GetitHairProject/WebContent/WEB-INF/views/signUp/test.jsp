<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='/calendarapi/lib/main.css' rel='stylesheet' />
<script src='/calendarapi/lib/main.js'></script>
<script>
  function consolelog(log){
    console.log(log);
  }
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
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2020-09-01'
        },
        {
          title: 'Long Event',
          start: '2020-09-07',
          end: '2020-09-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-09-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-09-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2020-09-11',
          end: '2020-09-13'
        },
        {
          title: 'Meeting',
          start: '2020-09-12T10:30:00',
          end: '2020-09-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2020-09-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2020-09-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2020-09-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2020-09-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2020-09-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2020-09-28'
        }
      ]
    });
    document.getElementById('submitBtn').addEventListener('click',function(){
      var arr = calendar.getEvents();
      var titles = [];
	  var startDate = [];
	  var endDate = [];
	  
      for(var i = 0 ; i < arr.length; ++i){
        console.log(arr[i].title);
        console.log(arr[i].start);
        console.log(arr[i].end);
        titles.push(arr[i].title);
        startDate.push(arr[i].start);
        endDate.push(arr[i].end);
      }
      var JsonTitles = JSON.stringify(titles);
      var JsonStartDate = JSON.stringify(startDate);
      var JsonEndDate = JSON.stringify(endDate);
      $.ajax({
    	 type: "get",
    	 url: "/test2Form",
    	 data : {JsonEndDate:JsonEndDate,JsonStartDate:JsonStartDate,JsonTitles:JsonTitles},
    	 dataType:"JSON",
    	 success : function(data){
    		 $("#ajaxResult").html(data);
    	 },
    	 error : function(data){
    		 $("#ajaxResult").html(data);
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
<h1 id="ajaxResult"></h1>
  <div id='calendar'></div>
  <button id="submitBtn" type="button">제출하기</button>
</body>
</html>
