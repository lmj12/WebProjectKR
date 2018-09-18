<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>구인자 로그인 화면</h2>
<%
	int result = (Integer) request.getAttribute( "result" );
	String id = (String) request.getAttribute( "id" );
%>

<%
	if( result == 0 ) {
		// 아이디가 없다
		%>
		<script type="text/javascript">
			<!--
			erroralert( loginiderror );
			//-->
		</script>
		<%		
	} else if( result == -1 ){
		// 비밀번호가 다르다
		%>
		<script type="text/javascript">
			<!--
			erroralert( loginpasswderror );
			//-->
		</script>
		<%		
	} else {
		// 아이디 있다 / 비밀번호다 같다
		session.setAttribute( "memid", id );
		response.sendRedirect( "jbpView.do" );
	}
%>

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