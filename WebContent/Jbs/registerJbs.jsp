<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp" %>
<!DOCTYPE html>
	<script src="${js}jbskReg2.js"></script>

<c:if test="${result eq 0}">

		<script type="text/javascript">
			<!--
			erroralert( inputerror );
			//-->
		</script>		
	</c:if>
<c:if test="${result eq 1}">
		<c:redirect url ="Lgn.do"/>
</c:if>
