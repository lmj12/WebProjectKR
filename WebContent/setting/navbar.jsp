<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<header class="text-center p-5">
	    Top header
	</header>
	
<script type="text/javascript">
	//<!--
	function memCheck(){
		var teamId = ${sessionScope.teamId}
		if(teamId == 0 ){
			alert("팀에 가입하고 있지 않습니다. 팀에 가입 후 이용해주세요.")
		} else {
			location.replace("tocal.do");
		}
	}
	//-->
</script>
	<nav class="navbar navbar-expand-sm navbar-light" data-toggle="affix">
	     <a class="navbar-brand" href="main.do">KR_WebProject[기린반]</a>
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar">
	        ☰
	    </button>
	    <div class="collapse navbar-collapse" id="collapsingNavbar">
	
	        <ul class="nav navbar-nav ml-auto">
	        	<li class="nav-item">
		                <a class="nav-link" href="notice.do">공지사항</a>
		        </li>
	        	<c:if test="${sessionScope.memid eq null }">
	        	<!--////////////// 로그인 전 //////////////-->
		            <li class="nav-item">
		                <a class="nav-link" href="register.do">회원가입</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link" href="Lgn.do">로그인</a>
		            </li>
	            </c:if>
	            <!--////////////// 로그인 후 //////////////-->
				
				<c:if test="${sessionScope.memid ne null }">
					<li class="nav-item"><a class="nav-link" href="mypage.do">마이페이지</a></li>
					<c:if test="${sessionScope.memType eq 2}">
						<li class="nav-item"> <a class="nav-link" href="teamList.do">팀</a></li>
					</c:if>
					<!--////////////// 구직자의 경우  //////////////-->
					<c:if test="${sessionScope.memType eq 1}">
						<li class="nav-item"><a class="nav-link" onclick="memCheck()">팀 스케쥴</a></li>
						<li class="nav-item"><a class="nav-link" href="boardList.do">신고게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="iptCrr.do">이력서</a></li>

						<c:if test="${sessionScope.teamReq eq '1' }">
							<script type="text/javascript">
								//<!--
								alertTeam();
								//-->
							</script>
						</c:if>


					</c:if>
					
					<!--////////////// 구인자의 경우  //////////////-->
					<c:if test="${sessionScope.memType eq 2}">
						<li class="nav-item"><a class="nav-link" href="tocal.do">스케쥴편집</a></li>
					</c:if>
					
					<!--////////////// 관리자의 경우  //////////////-->
					<c:if test="${sessionScope.memType eq 3}">
						<li class="nav-item"><a class="nav-link" href="adminPage.do">관리자페이지</a></li>
					</c:if>
				</c:if>
				<li class="nav-item"><a class="nav-link" href="main.do">
					<span class="glyphicon glyphicon-home"></span> Main</a></li>
				<c:if test="${sessionScope.memid ne null}">
					<li class="nav-item">
						<a class="nav-link" href="logout.do">
							<span class="glyphicon glyphicon-log-out"></span>Logout</a>
					</li>
				</c:if>
			</ul>
	    </div>
	</nav>
