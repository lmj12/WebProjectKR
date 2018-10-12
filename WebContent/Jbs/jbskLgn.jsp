<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<h2>구직자 로그인 처리화면</h2>

<form method="post" action="jbskLgn.do" name="jbskLoginForm">
<table border="1">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="jbskId" autofocus placeholder="필수입력"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="jbskPasswd" placeholder="필수입력"></td>
	</tr>
	
	<tr>
		<th colspan="2">
			<input type="submit" value="로그인">
			<input type="reset" value="취소" onclick="location='main.do'">			
		</th>
	</tr>	
</table>
</form>  


<%@ include file="/setting/design_setting_footer.jsp" %>