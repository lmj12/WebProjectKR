<%@page import="board.BoardDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/board/setting.jsp" %>
<!DOCTYPE html>
	<script src="${js}board.js"></script>
<h2>글목록</h2>

<br>
<input type="button" value="마이페이지" onclick="location='mypage.do'">
<table border="1">
			
	<tr>
		<th colspan="5" align="left">
		${sessionScope.memid}님의 게시판입니다. 
		</th>
	<tr>
		<th colspan="6" align="right">
			<a href="boardWrt.do">글쓰기</a>
			&nbsp;&nbsp;&nbsp;
		</th>
	</tr>
	
	<tr>
		<th style="width : 5%">	 번호</th>
	
		<th style="width : 10%"> 글쓴이 </th>
		<th style="width : 15%"> 글쓴날짜 </th>
		
		<th style="width : 10%"> 게시글상태 </th>
	</tr>
<c:if test="${count eq 0}">	
		<tr>
			<td colspan="6" align="center">
				${msg_list_x}
			</td>
		</tr>
	</c:if>
	<c:if test="${count ne 0}">
		<c:forEach var="article" items="${articles}">	
		
			<tr>
				<td align="center">
					${article.boardParentId}
					<c:set var="number" value="${number-1}"/>
				</td>			
				<td>						
					<a href ="boardView.do?boardId=${article.boardId}&boardParentId=${article.boardParentId}&pageNum=${pageNum}&number=${number+1}">
						${article.userId}
					</a>					
				<td align="center">
					
					${article.boardregdate }
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
<br>
<c:if test="${count ne 0}">
	<c:if test="${startPage gt pageBlock}">
		<a href="boardList.do">[◀◀] </a>
		<a href="boardList.do?pageNum=${startPage-pageBlock}">[◀] </a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test="${i eq currentPage}">
			<b>[${i}]</b>
		</c:if>
		<c:if test="${i ne currentPage}">					
			<a href="boardList.do?pageNum=${i}">[${i}] </a>
		</c:if>	
	</c:forEach>
	<c:if test="${pageCount gt endPage}">
		<a href ="boardList.do?pageNum=${startPage+pageBlock}">[▶]</a>
		<a href ="boardList.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>	
</c:if>