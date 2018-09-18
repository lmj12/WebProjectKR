<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    