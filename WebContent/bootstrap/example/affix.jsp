<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  body {
      position: relative; 
  }
  .affix {
      top:0;
      width: 100%;
      z-index: 9999 !important;
  }
  .navbar {
      margin-bottom: 0px;
  }

  .affix ~ .container-fluid {
     position: relative;
     top: 50px;
  }
  #target_body {padding-top:50px;height:500px;color: #fff; background-color: #1E88E5;}
  </style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">

<div class="container-fluid" style="background-color:#F44336;color:#fff;height:100px;">
  <h1>navbar 상단 내용 div </h1>
</div>

<nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="97">
  <div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">KR_WebProject</a>
    </div>
    <div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
        <c:if test="${sessionScope.memid ne null }">
			<h2><span>${sessionScope.memName}(${sessionScope.memid})</span>님 환영합니다</h2>	
			<li><a href="mypage.do">마이페이지</a></li>
			<li><a href="logout.do">로그아웃</a></li>
			<c:if test="${sessionScope.memType eq 2}">
			<li><a href="tocal.do">달력으로</a></li>
			</c:if>
		</c:if>
		<c:if test="${sessionScope.memid eq null }">
			<li><a href="register.do">회원가입</a></li>
			<li><a href="Lgn.do">로그인</a></li>
		</c:if>
        </ul>
      </div>
    </div>
  </div>
</nav>

<div id="target_body" class="container-fluid">
	<tr>
		<th colspan="2" height="100">
			<jsp:include page="recList.do" flush="false"/>
		</th>
	</tr>
</div>

</body>
</html>
