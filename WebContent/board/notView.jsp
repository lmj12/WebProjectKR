<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>
<%@ include file="/board/setting.jsp" %>
<h2>공지사항 내용페이지</h2>

<%@ include file="/board/setting.jsp" %>
<table border="1">
	<tr>
		<th>글번호</th>
		<td> ${boardDto.num}	</td>
	</tr>
	<tr>
		<th>글제목</th>
		<td> ${boardDto.boardtitle}	</td>
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
		<td align="center">
		<input type="button" value="목록으로" onclick="hBack()">
</table>

<%@ include file="/setting/design_setting_footer.jsp" %>