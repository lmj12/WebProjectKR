<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>로그인pro</h2>
 
<%@ include file="../setting/setting.jsp" %>

<%	// 로그인실패 	%> 
	<c:if test="${result eq 0}">
		<script type="text/javascript">
			//<!--
			// TODO : 나중에 알림메시지 수정필요
			alert( "loginiderror" );
			//-->
		</script>
	</c:if>

	
<%	// 아이디 있다 / 비밀번호다 같다 %>
	<c:if test="${result eq 1}">
		${sessionScope.memid = jobpId}
		${sessionScope.memName = jobpCn}
		${sessionScope.memType = memtype}
		<c:redirect url="main.do"/>
	</c:if>