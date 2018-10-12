<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>KR_WebProject</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>
<script type="text/javascript">
//<!--
	$(document).ready(
		function() {

			var toggleAffix = function(affixElement, scrollElement,
					wrapper) {

				var height = affixElement.outerHeight(), top = wrapper
						.offset().top;

				if (scrollElement.scrollTop() >= top) {
					wrapper.height(height);
					affixElement.addClass("affix");
				} else {
					affixElement.removeClass("affix");
					wrapper.height('auto');
				}

			};

			$('[data-toggle="affix"]').each(function() {
				var ele = $(this), wrapper = $('<div></div>');

				ele.before(wrapper);
				$(window).on('scroll resize', function() {
					toggleAffix(ele, $(this), wrapper);
				});

				// init
				toggleAffix(ele, $(window), wrapper);
			});

	});
//-->
</script>
<style>
	header {
	    height: 220px;
	    background: #ccc;
	}
	
	#main {
	    padding-top:70px;
	}
	
	.navbar {
	  border-radius: 0;
	  transition: all 0.3s ease-out;
	}
	
	.affix {
	  position: fixed;
	  top: 0;
	  right: 0;
	  left: 0;
	  z-index: 1030;
	}
	
	/* fixed to top styles */
	.affix.navbar {
	  background-color: #333;
	}
	.affix.navbar .nav-item>a, 
	.affix.navbar .navbar-brand {
	    color: #fff;
	}
</style>
</head>
<body>
	<header class="text-center p-5">
	    Top header
	</header>
	<nav class="navbar navbar-expand-sm navbar-light" data-toggle="affix">
	     <a class="navbar-brand" href="main.do">KR_WebProject[기린반]</a>
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar">
	        ☰
	    </button>
	    <div class="collapse navbar-collapse" id="collapsingNavbar">
	
	        <ul class="nav navbar-nav ml-auto">
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
					<c:if test="${(sessionScope.teamId eq 1) or (sessionScope.teamId eq 2) }">
						<li class="nav-item"> <a class="nav-link" href="teamList.do">팀</a></li>
					</c:if>
					<!--////////////// 구직자의 경우  //////////////-->
					<c:if test="${sessionScope.memType eq 1}">
						<li class="nav-item"><a class="nav-link" href="#">팀 스케쥴</a></li>
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
	        </ul>
	        <ul class="nav navbar-nav ml-auto">
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
	
	<div class="container" id="main">
	    <h2>Hello Bootstrap 4.</h2>
	    <div class="row">
	        <div class="col-xs-12 col-sm-6 col-md-9">
	            <p>3 wolf moon retro jean shorts chambray sustainable roof party. Shoreditch vegan artisan Helvetica. Tattooed Codeply Echo Park Godard kogi, next level irony ennui twee squid fap selvage. Meggings flannel Brooklyn literally small batch, mumblecore
	                PBR try-hard kale chips. Brooklyn vinyl lumbersexual bicycle rights, viral fap cronut leggings squid chillwave pickled gentrify mustache. 3 wolf moon hashtag church-key Odd Future. Austin messenger bag normcore, Helvetica Williamsburg
	                sartorial tote bag distillery Portland before they sold out gastropub taxidermy Vice.</p>
	        </div>
	        <div class="col-xs-6 col-md-3">
	            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra codeply varius quam sit amet vulputate. Quisque mauris augue, molestie tincidunt codeply condimentum vitae, gravida a libero. Aenean sit amet felis dolor, in sagittis nisi.
	                Sed ac orci quis tortor imperdiet venenatis. Duis elementum auctor accumsan. Aliquam in felis sit amet augue.
	            </p>
	            <hr>
	            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra codeply varius quam sit amet vulputate. Quisque mauris augue, molestie tincidunt codeply condimentum vitae, gravida a libero. Aenean sit amet felis dolor, in sagittis nisi.
	                Sed ac orci quis tortor imperdiet venenatis. Duis elementum auctor accumsan. Aliquam in felis sit amet augue.
	            </p>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-xs-6 col-sm-4">
	            <div class="card card-outline-primary">
	               <div class="card-block">
	               <h3 class="card-title">Card</h3>
	                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	                    <a href="#" class="btn btn-outline-secondary">Outline</a>
	                </div>
	            </div>
	        </div>
	        <div class="col-xs-6 col-sm-4">
	            <div class="card card-outline-primary">
	               <div class="card-block">
	               <h3 class="card-title">Card</h3>
	                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	                    <a href="#" class="btn btn-outline-secondary">Outline</a>
	                </div>
	            </div>
	        </div>
	        <div class="col-xs-6 col-sm-4">
	            <div class="card card-outline-primary">
	               <div class="card-block">
	               <h3 class="card-title">Card</h3>
	                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	                    <a href="#" class="btn btn-outline-secondary">Outline</a>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>