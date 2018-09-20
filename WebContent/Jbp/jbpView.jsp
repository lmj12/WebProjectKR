<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>구인자 정보수정 뷰</h2>

<%
	int result = (Integer) request.getAttribute( "result" );
%>
<%
	if( result == 0 ) {
		%>
		<script type="text/javascript">
			<!--
			alert( modifyerror );
			//-->
		</script>
		<meta http-equiv="refresh" content="0; url=main.do">
		<%
	} else {
		response.sendRedirect( "mypage.do" );
	}
%>