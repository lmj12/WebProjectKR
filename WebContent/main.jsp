<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./setting/setting.jsp" %>
<h2>메인페이지</h2>
<c:if test="${sessionScope.memid ne null }">
	<h2><span>${sessionScope.memName}(${sessionScope.memid})</span>님 환영합니다</h2>	
	<a href="mypage.do">마이페이지</a>
	<a href="logout.do">로그아웃</a>
	<c:if test="${sessionScope.memType eq 2}">
	<a href="tocal.do">달력으로</a>
	</c:if>
</c:if>
<c:if test="${sessionScope.memid eq null }">
<a href="register.do">회원가입</a>
<a href="Lgn.do">로그인</a>
</c:if>

