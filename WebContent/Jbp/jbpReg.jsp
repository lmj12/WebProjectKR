<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>구인자 회원가입 페이지</h2>


<body onload="inputfocus()">
<form name="inputform" method="post" action="jbpReg.do" onsubmit="return inputcheck()">
<table border="1">
	<tr>
		<th rowspan="2">아이디</th>
		<td><input type="text" name="jobpId" autofocus></td>
	</tr>
	<tr>
		<td><input type="text" readonly></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="jobpPasswd"></td>
	</tr>
	<tr>
		<th>비밀번호확인</th>
		<td><input type="password" name="rejobpPasswd"></td>
	</tr>
	<tr>
		<th>사업자번호</th>
		<td><input type="text" name="jobpBno"></td>
		<td><input type="button" value="확인"></td>
	</tr>
	<tr>
		<th>업체명</th>
		<td> <input type="text" name="jobpCn"></td>
	</tr>
	
	
	<tr>
		<th colspan="2">
			<input type="submit" value="가입">
			<input type="reset" value="취소" onclick="location='jbpLgn.do'">			
		</th>
	</tr>
	
</table>
</form>
</body>