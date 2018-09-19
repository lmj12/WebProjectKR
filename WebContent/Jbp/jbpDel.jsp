<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h2>회원탈퇴 페이지</h2>
    
<%
		int result = (Integer) request.getAttribute( "result" );
		if( result == 0 ) {
			// 탈퇴 실패 
			%>
			<script type="text/javascript">
				<!--
				alert( deleteerror );
				//-->
			</script>
			<meta http-equiv="refresh" content="0; url=main.do">
			<%			
		} else {
			// 탈퇴 성공 - main 이동
			session.removeAttribute( "memid" );
			response.sendRedirect( "main.do" );
		}		
	
%>