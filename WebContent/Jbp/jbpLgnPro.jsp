<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>로그인pro</h2>

<%@ include file="../setting/setting.jsp" %>

<%	// 아이디가 없다 	%>
	<c:if test="${result eq 0}">
		<script type="text/javascript">
			<!--
			alert( "loginiderror" );
			//-->
		</script>
	</c:if>
<%	// 비밀번호가 다르다		%>
	<c:if test="${result eq -1}">
	
		<script type="text/javascript">
			<!--
			alert( "loginpasswderror" );
			//-->
		</script>
	</c:if>
	
<%	// 아이디 있다 / 비밀번호다 같다 %>
	<c:if test="${result eq 1}">
		${sessionScope.memid = jobpId}
		<c:redirect url="main.do"/>
	</c:if>