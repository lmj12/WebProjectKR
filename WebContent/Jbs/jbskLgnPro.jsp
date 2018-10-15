<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>로그인pro</h2>
 
<%@ include file="../setting/setting.jsp" %>
<%	// 아이디 있다 / 비밀번호다 같다 %>
	<c:if test="${result eq 1}">
		${sessionScope.memid = jbskId}
		${sessionScope.memName = jbskName}
		${sessionScope.memType = memtype}
		${sessionScope.teamId = teamId}
		${sessionScope.teamReq = teamReq}
		${sessionScope.time = time}
	<c:redirect url="main.do"/>
	</c:if>
<%	// 로그인실패 	%> 
	<c:if test="${result eq 0}">
		<script type="text/javascript">
			//<!--
			errorback( "로그인에 실패했습니다. 아이디나 패스워드를 확인해 주세요" );
			//-->
		</script>
	</c:if>

	
