<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글꼴 호출 -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- //글꼴 호출 -->
  <!-- 부트스트랩 호출 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- //부트스트랩 호출 -->
  <link rel="stylesheet" href="/css/header/header.css">
<header>
<h1>header입니다</h1>
<marquee direction="right">_______@^</marquee>

	<div class="container">
	  <ul class="nav nav-pills" role="tablist">
	    <li class="active"><a href="/">Home</a></li>
	    <li class="dropdown">
	    <a class="dropdown-toggle" data-toggle="dropdown" href="#">디버그모드 활성화<span class="caret"></span></a>
	    	<ul class="dropdown-menu" role="menu">
			    <li><a href="/debugMode?isDebugmode='true'">디버그모드 켜기</a></li>
			    <li><a href="/debugMode?isDebugmode='false'">디버그모드 끄기</a></li>
			    <li><a href="/showUsingDebug">디버그모드 객체넣어 테스트</a></li>
		    </ul>
	    </li>    
	    <li class="dropdown">
	      <a class="dropdown-toggle" data-toggle="dropdown" href="#">회원가입 목록<span class="caret"></span></a>
	      <ul class="dropdown-menu" role="menu">
	        <li><a href="/signUpCustomerForm">고객회원가입</a></li>
	        <li><a href="#">디자이너가입</a></li>
	        <li><a href="#">헤어샵등록</a></li>                        
	      </ul>
	    </li>
	  </ul>
	</div>
</header>