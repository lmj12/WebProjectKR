<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="setting.jsp" %>
<h2>공지사항 삭제처리페이지</h2>

<c:if test="${result eq 0}">
<script type="text/javascript">
<!--
alert(deleteerror);
//-->
</script>
<meta http-equiv ="refresh" content="0; url=notice.do">
</c:if>

<c:if test="${result eq 1}">
<c:redirect url="notice.do"/>
</c:if>

<%@ include file="/setting/design_setting_footer.jsp" %>