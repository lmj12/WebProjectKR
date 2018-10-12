<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>
<h2>공고삭제처리페이지</h2>
<c:if test="${result eq 0}">
<script type="text/javascript">
<!--
alert(deleteerror);
//-->
</script>
<meta http-equiv ="refresh" content="0; url=recList.do?pageNum=${pageNum}">
</c:if>


<c:if test="${result eq 1}">
<c:redirect url="recList.do?pageNum=${pageNum}"/>
</c:if>


<%@ include file="/setting/design_setting_footer.jsp" %>