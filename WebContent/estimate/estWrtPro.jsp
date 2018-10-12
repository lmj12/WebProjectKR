<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp"%>
<!DOCTYPE html>

<c:if test="${rst == 1}">
	<script type="text/javascript">
		//<!-- 
		location.replace("estList.do?recId="+${recId});
		//-->
	</script>
</c:if>

<c:if test="${rst == 0}">
	<script type="text/javascript">
		//<!-- 
		errorback("오류가 발생했습니다. 다시 시도해주세요.")
		//-->
	</script>
</c:if>