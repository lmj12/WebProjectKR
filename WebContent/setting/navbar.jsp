<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<header class="text-center p-5">Top header</header>
<script src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	//<!--
	var memType = ${sessionScope.memType}
	var audio = new Audio('./setting/image/pop/pull-out.mp3');
	$(document).ready(
		function(){
			$("#popUp").hide();
			if(memType==1){
				popUp()
			}
		
	})
	function popUp(){
		$.ajax({
	    	method : "POST",
	    	url : "ajaxPopUp.do",
	    	cache : false,
			async : false,
			datatype : "json",
			success : function(data){
				$("#popUp").show();
				if(data){
					var site = '${sessionScope.search}'
					var rst = makePopImg(data);
					if(rst == 1){
						$("#popUp").show();
						audio.play();
					}
				} else {
					
				}
			}, error:function(request,status,error){
				alert();
			}
		})
	}
	function memCheck(){
		var teamId = '${sessionScope.teamId}'
		if(teamId == 0 ){
			alert("팀에 가입하고 있지 않습니다. 팀에 가입 후 이용해주세요.")
		} else {
			location.replace("tocal.do");
		}
	}
	function toModify(){
		if(${sessionScope.memType eq 2}){
			location.href="jbpView.do"
		} else if(${sessionScope.memType eq 1}) {
			location.href="jbskView.do"
		}
	}
	function toPopRec(){
		$("#popUp").hide();
		location.href="popRec.do"
	}
	
	function makePopImg(num){
			var str = '';
			var rst = 0;
			str += "<div class='container'>"
			str += "	<div class='row'>"
			if(num==1){
				str += "<img src='./setting/image/pop/1.png' onclick='toPopRec()'>" 
				rst = 1;
			} else if(num==2){
				str += "<img src='./setting/image/pop/2.png' onclick='toPopRec()'>" 
				rst = 1;
			} else if(num==3){
				str += "<img src='./setting/image/pop/3.png' onclick='toPopRec()'>" 
				rst = 1;
			} else {
				str += "<img src='./setting/image/pop/etc.png' onclick='toPopRec()'>" 
				rst = 1;
			}   
			str += "	</div>"
			str += "	<div class='col'>"
			str += "		<small>인근지역공고가 등록되었습니다.</small>"
			str += "	</div>"
			str += "<div>"
			str += "<button type='button' class='btn btn-Warning' onclick='toPopRec()'>"
			str += "<strong>인근지역공고가 등록되었습니다</strong> <span class='badge badge-light'><img src='./setting/image/pop/etc.png'</span>"
			str += "</button>"
		
		$("#popUp").append(str);
		return rst;
	}
	//-->
</script>
	<nav class="navbar navbar-expand-sm navbar-light sticky-top" data-toggle="affix">
	     <a class="navbar-brand" href="main.do">KR_WebProject[기린반]</a>
	    &nbsp;
	    <div id="popUp" >
	    	<input type="text" name="">
	    	<a class="popUp-btn" href="#"></a>
	    </div>
	    <div class="collapse navbar-collapse" id="collapsingNavbar">
	
	        <ul class="nav navbar-nav ml-auto">
	        	<li class="nav-item">
	        		
	        	</li>
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
					<li class="nav-item dropdown">
					  <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						마이페이지
				      </a>
				      <div class="dropdown-menu">
				        <a class="dropdown-item nav-link" href="mypage.do">내 공고</a>
				        <a class="dropdown-item nav-link" href="#" onclick="toModify()">정보수정</a>
				        <c:if test="${sessionScope.memType eq 2}">
							<a class="dropdown-item nav-link" href="jbpDel.do">회원탈퇴</a>	
						</c:if>
						<c:if test="${sessionScope.memType eq 1}">	
							<a class="dropdown-item nav-link" href="jbskDel.do">회원탈퇴</a>
						</c:if>
				      </div>
					</li>
					<!--////////////// 구직자의 경우  //////////////-->
					<c:if test="${sessionScope.memType eq 1}">
						<li class="nav-item"><a class="nav-link" onclick="memCheck()">팀 스케쥴</a></li>
						<li class="nav-item"><a class="nav-link" href="boardList.do">신고게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="iptCrr.do">이력서</a></li>
					</c:if>
					
					<!--////////////// 구인자의 경우  //////////////-->
					<c:if test="${sessionScope.memType eq 2}">
						<li class="nav-item"> <a class="nav-link" href="teamList.do">팀</a></li>
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
