<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int result = (Integer) request.getAttribute( "result" );
%>
<%
	if( result == 0 ) {
		// 가입실패
		%>
		<script type="text/javascript">
			<!--
			erroralert( inputerror );
			//-->
		</script>		
		<%		
	} else {
		// 가입성공
		response.sendRedirect( "jbpLgn.do" );
	}
%>