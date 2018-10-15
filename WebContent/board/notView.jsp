<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>
<%@ include file="/board/setting.jsp" %>

<div class="container">
<h2>공지사항 내용페이지</h2>

<%@ include file="/board/setting.jsp" %>
<table border="1">
<input type="hidden" name="boardId" value="${boardDto.boardId}">
	<tr>
		<th>글번호</th>
		<td> ${boardDto.num}	</td>
	</tr>
	<tr>
		<th>글제목</th>
		<td> ${boardDto.boardTitle}	</td>
	</tr>ㅡ
	<tr>
		<th>작성일</th>
		<td> ${boardDto.stime }	</td>
	</tr>
	<tr>
		<th>글내용</th>
		<td> ${boardDto.boardContent }	</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="button" value="목록으로" onclick="hBack()">
		<c:if test="${sessionScope.memType eq 3}">
		<input class="inputbutton" type="button" value="${btn_modify}" name="modify"
				onclick="location='notMod.do?boardId=${boardDto.boardId}'">
			<input class="inputbutton" type="button" value="${btn_delete}"
				onclick="location='noticeDel.do?boardId=${boardDto.boardId}'">
		</c:if>
</table>
</div>
<%@ include file="/setting/design_setting_footer.jsp" %>