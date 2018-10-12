<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
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
</head>
<body>
	<%@ include file="/setting/jumbotron.jsp"%>
	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg navbar-primary bg-black">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
					</li>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</nav>
	</div>
	<script type="text/javascript">
		// 필터, 추가 기능용
		$(document).ready(

		function alertTeam() {
			if (confirm("팀 가입 요청이 있습니다. 확인하시겠습니까?")) {
				location.href = "teamReqCk.do"
			}
		}
		function toModify() {
			var memType = $
			{
				sessionScope.memType
			}
			;
			if (memType == 2) {
				location.href = "jbpView.do"
			} else if (memType == 1) {
				location.href = "jbskView.do"
			}
		}
	//-->
	</script>
	1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>1
	<br>
</body>
</html>