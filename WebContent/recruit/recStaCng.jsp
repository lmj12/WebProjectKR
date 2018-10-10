<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		alert( modifyerror );
		//-->
	</script>		
	<meta http-equiv="refresh" content="0; url=recMyView.do?pageNum=${pageNum}">
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="recMyView.do?pageNum=${pageNum}"/>
</c:if>	