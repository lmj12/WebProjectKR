<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp" %>

<c:if test="${result eq 0}">

		<script type="text/javascript">
			<!--
			alert( inputerror );
			//-->
		</script>		
	</c:if>
<c:if test="${result eq 1}">
		<c:redirect url ="Lgn.do"/>
</c:if>
