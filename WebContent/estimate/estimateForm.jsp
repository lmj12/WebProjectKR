<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp" %>
<!DOCTYPE html>
<c:if test="${sessionScope.memType ne 1}">	<!--  구직자회원이 아니면  -->

</c:if>

<c:if test="${sessionScope.memType eq 1}"> <!--  구직자회원이면 -->

</c:if>