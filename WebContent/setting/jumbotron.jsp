<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<div class="jumbotron">
  <div class="container text-center">
    <c:if test="${sessionScope.memid ne null }">  
  		<h4><span>${sessionScope.memName}(${sessionScope.memid})</span>님 환영합니다</h4>
	</c:if>
  </div>
</div>
