<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>


<nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="97">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Logo</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a class="navbar-brand" href="#">KR_WebProject</a></li>
				<!--////////////// 로그인 전 //////////////-->

				<c:if test="${sessionScope.memid eq null }">
					<li><a href="register.do">회원가입</a></li>
					<li><a href="Lgn.do">로그인</a></li>
				</c:if>

				<!--////////////// 로그인 후 //////////////-->
				
				<c:if test="${sessionScope.memid ne null }">
					<li><a href="mypage.do">마이페이지</a></li>
					<c:if test="${sessionScope.teamId ne 0 }">
						<li> <a href="teamList.do">팀</a></li>
						<li> <a href="#">팀 스케쥴</a></li>
					</c:if>
					<!--////////////// 구직자의 경우  //////////////-->
					<c:if test="${sessionScope.memType eq 1}">
						<li><a href="boardList.do">신고게시판</a></li>
						<li><a href="iptCrr.do">이력서</a></li>
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
						<li><a href="tocal.do">스케쥴편집</a></li>
					</c:if>
				</c:if>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="main.do"><span
						class="glyphicon glyphicon glyphicon-home"></span> Main</a></li>
				<c:if test="${sessionScope.memid ne null}">
					<li>
						<a href="logout.do"><span class="glyphicon glyphicon glyphicon-log-out"></span>Logout</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>

<script type="text/javascript">
	//<!--
	
	// 필터, 추가 기능용
	$(document).ready(function(){
		$("#myInput").on("keyup", function() {
			var value = $(this).val().toLowerCase();
			$("#myDIV *").filter(function() {
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});
	});
	
	function alertTeam(){
		if(confirm("팀 가입 요청이 있습니다. 확인하시겠습니까?")){
			location.href="teamReqCk.do"
		} 
	}
	function toModify(){
		var memType = ${sessionScope.memType};
		if(memType == 2){
			location.href="jbpView.do"
		} else if(memType == 1) {
			location.href="jbskView.do"
		}
	}
	//-->
</script>


