<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../setting/setting.jsp" %>
<!DOCTYPE html>
	<script src="${js}jbpReg.js"></script>
	
<h2>로그인pro</h2>
<%	// 로그인실패 	%> 
	<c:if test="${result eq 0}">
		<script type="text/javascript">
			//<!--
			// TODO : 나중에 알림메시지 수정필요
			erroralert( "아이디 또는 비밀번호를 확인하세요" );
			history.back();
			//-->
		</script>
		
	</c:if>

	
<%	// 아이디 있다 / 비밀번호다 같다 %>
	<c:if test="${result eq 1}">
		${sessionScope.memid = jobpId}
		${sessionScope.memName = jobpCn}
		${sessionScope.memType = memtype}
		${sessionScope.teamId = teamId}
		<c:redirect url="mypage.do"/>
	</c:if>