<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp" %>

<%	// 로그인실패 	%> 
	<c:if test="${rst eq 0}">
		<script type="text/javascript">
			//<!--
			errorback( "로그인에 실패했습니다. 아이디나 패스워드를 확인해 주세요" );
			//-->
		</script>
	</c:if>

	
<%	// 아이디 있다 / 비밀번호다 같다 %>
	<c:if test="${rst eq 1}">
		${sessionScope.memid = admId}
		${sessionScope.memType = memtype}
		<c:redirect url="adminPage.do"/>
	</c:if>