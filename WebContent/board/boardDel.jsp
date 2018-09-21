<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>게시판 삭제처리페이지</h2>

<c:if test="${result eq 0}">
<script type="text/javascript">
<!--
alert(deleteerror);
//-->
</script>
<meta http-equiv ="refresh" content="0; url=list.do?pageNum=${pageNum}">
</c:if>

<c:if test="${result eq -1}">
<%	
//답글이 있는 경우
%>
<script type="text/javascript">
<!--
alert(replyerror);
//-->
</script>
<meta http-equiv ="refresh" content="0; url=list.do?pageNum=${pageNum}">
</c:if>
<c:if test="${result eq 1}">
<c:redirect url="list.do?pageNum=${pageNum}"/>
</c:if>