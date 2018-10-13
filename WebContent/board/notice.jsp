<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/board/setting.jsp" %>
<h2>공지사항 페이지</h2>

<table border="1">

<c:if test="${sessionScope.memType eq 3}">
	<tr>
		<th>공지작성</th>
		<td><input type="button" value="공지작성" onclick="location='notWrt.do'"></td>
	</tr>
</c:if>
	<tr>
		<th>글번호</th>
		<th>글제목</th>
		<th>작성일</th>
	</tr>
	<c:forEach var="article" items="${articles}">	
	<tr style="cursor:pointer;" onClick="location.href='notView.do?boardId=${article.boardId}'">
		<input type="hidden" value="${article.boardId}">
		<td>${article.num }	</td>
		<td>${article.boardTitle}	</td>
		<td>${article.stime}	</td>
	</tr>
	</c:forEach>
	 
</table>

<%@ include file="/setting/design_setting_footer.jsp" %>