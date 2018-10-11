<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:query var="rs" dataSource="jdbc/encore">
	update KRrecruit set recStatus=? where recId=?
	<sql:param value="${param.recId}"/>
	<sql:param value="${param.recStatus}"/>
</sql:query>
<c:forEach var="row" items="${rs.rowsByIndex}">
	<c:if test="${param.recStatus eq 0}">
		<result>
			<message>모집중</message>
		</result>
	</c:if>
	<c:if test="${param.recStatus eq 1}">
	<result>
		<message>모집완료</message>
	</result>
	</c:if>
</c:forEach>
   
   