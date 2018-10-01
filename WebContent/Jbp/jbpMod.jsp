<%@page import="member.jobprov.JobProvDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp" %>
<h2>구인자 정보수정페이지</h2>
<!DOCTYPE html>
	<script src="${js}jbpReg.js"></script>





<%
		JobProvDataBean jbpDto = ( JobProvDataBean) request.getAttribute( "jbpDto" );
		%>

<form name="inputform" method="post" action="jbpMod.do">
<table border="1">
	<tr>
		<th>아이디</th>
		<td> ${jbpDto.getJobpId()} </td>
	
	</tr>
	
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="jobpPasswd" value="${jbpDto.getJobpPasswd()}"></td>
		<td width="100">
			<input class="passwdresult" type="text" value="비밀번호를 변경하세요" readonly>
		</td>	
	</tr>
	<tr>
		<th>비밀번호확인</th>
		<td><input type="password" name="rejobpPasswd" value="${jbpDto.getJobpPasswd()}"></td>
		<td>
			<input class="repasswdresult" type="text" value="같은 비밀번호로 변경하세요" readonly>
		</td>	
	</tr>
	<tr>
		<th>사업자번호</th>
		<td>${jbpDto.getJobpBno()}</td>
	</tr>
	<tr>
		<th>업체명</th>
		<td>${jbpDto.getJobpCn()}</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td> <input type="text" name="jobpTel" value="${jbpDto.getJobpTel() }"></td>
		<td class="telresult"><input type="button" value="인증"></td>
	</tr>
	
	<tr>
		<th colspan="2">
			<input type="submit" value="가입">
			<input type="reset" value="취소" onclick="location='mypage.do'">			
		</th>
	</tr>
	
</table>
</form>