<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>구인자 로그인 화면</h2>
<body onload="loginfocus()">
	<form method="post" action="jbpLgnPro.jsp" name="loginform" onsubmit="return logincheck()">
<table border="1">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="jobpId" autofocus placeholder="필수입력"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="jobpPasswd" placeholder="필수입력"></td>
	</tr>
	
	<tr>
		<th colspan="2">
			<input type="submit" value="로그인">
			<input type="reset" value="취소">
			<input type="button" value="가입" onclick="location='jbpReg.jsp'">
		</th>
	</tr>	
</table>
</form>
</body>