<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp"%>
<!DOCTYPE html>
	<script src="${js}jbpReg.js"></script>

<h2>구인자 회원가입 페이지</h2>

<form name="inputform" action="jbpReg.do" method="post">
<table border="1">
	<tr>
		<th>아이디</th>

		<td><input type="text" name="jobpId" autofocus></td>
		<td width="300">
			<input class="idresult" type="text" placeholder="아이디를 4~15자까지 입력하세요, 영어, 숫자만 가능합니다" readonly>
		</td>

	</tr>
	
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="jobpPasswd"></td>
		<td width="100">
			<input class="passwdresult" type="text" placeholder="비밀번호를 입력하세요" readonly>
		</td>	
	</tr>
	<tr>
		<th>비밀번호확인</th>
		<td><input type="password" name="rejobpPasswd"></td>
		<td>
			<input class="repasswdresult" type="text" placeholder="같은 비밀번호를 입력하세요" readonly>
		</td>	
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
		<th>전화번호</th>
		<td> <input type="text" name="jobpTel"></td>
		<td><input class="telresult" type="button" value="인증"></td>
	</tr>
	
	<tr>
		<th colspan="2">
			<input type="submit" value="가입">
			<input type="reset" value="취소" onclick="location='main.do'">			
		</th>
	</tr>
	
	
</table>
</form>

