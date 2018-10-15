<%@page import="board.BoardDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/board/setting.jsp" %>
<!DOCTYPE html>
	<script src="${js}board.js"></script>
<h2>글목록</h2>

<br>
<div class="container">
	<table border="1">
				
		<tr>
			<th style="width : 15%" colspan="3" align="left">
			${sessionScope.memid}님의 신고게시판입니다. 
			</th>
		
			<th style="width : 5%" colspan="1" align="right">
				<a href="boardWrt.do">글쓰기</a>
				&nbsp;&nbsp;&nbsp;
			</th>
		</tr>
		<thead>
			<tr>
				<th style="width : 5%">	 번호</th>
			
				<th style="width : 10%"> 글쓴이 </th>
				<th style="width : 15%"> 글쓴날짜 </th>
				
				<th style="width : 10%"> 게시글상태 </th>
			</tr>
		</thead>
	<c:if test="${count eq 0}">	
			<tr>
				<td colspan="6" align="center">
					${msg_list_x}
				</td>
			</tr>
		</c:if>
		<c:if test="${count ne 0}">
			<c:forEach var="article" items="${articles}">	
			
				<tr style="cursor:pointer;" onClick="location.href='boardView.do?boardId=${article.boardId}&boardParentId=${article.boardParentId}&pageNum=${pageNum}&number=${number+1}'">
					<td align="center">
						${article.boardParentId}
						<c:set var="number" value="${number-1}"/>
					</td>			
					<td>							
						${article.boarduserId}
					<td align="center">
						
						${article.stime }
					</td>								
									
						
					
					<td align="center">
					<c:if test="${article.boardStatus eq 0}">
						검토중
						</c:if>
					<c:if test="${article.boardStatus eq 1}">
						검토완료
					</c:if>
					</td>				
					
				</tr>
			</c:forEach>	
		</c:if>
	</table>
</div>
<br>

<%@ include file="/setting/design_setting_footer.jsp" %>