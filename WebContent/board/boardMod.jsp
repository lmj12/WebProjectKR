<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="setting.jsp" %>
<script src="${js}board.js"></script>

<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		alert( modifyerror );
		//-->
	</script>		
	<meta http-equiv="refresh" content="0; url=list.do?pageNum=${pageNum}">
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="boardList.do?pageNum=${pageNum}"/>
</c:if>	


<h2> 글 수 정 </h2>


		<form method="post" action="boardMod.do" name="modifyform" onsubmit="return modifycheck()">
			<input type="hidden" name="boardId" value="${boardDto.boardId}">
			<input type="hidden" name="pageNum" value="${pageNum}"/>		
			<table>
				<tr>
					<th colspan="2"> 
						수정할 정보를 입력하세요
					</th>						
				</tr>				
				<tr>
					<th> 신고자 </th>
					<td> &nbsp;${boardDto.userId} </td> 
				</tr>
				
				
				
				<tr>
					<th>글내용 </th>
					<td>
						<textarea name="boardContent" rows="10" cols="40">${boardDto.boardContent}</textarea>
					</td>
				</tr>
				
				<tr>
					<th colspan="2">
						<input class="inputbutton" name="modify" type="submit" value="수정">
						<input class="inputbutton" type="reset" value="취소">
						<input class="inputbutton" type="button" value="수정취소"
							onclick="location='boardList.do?pageNum=${pageNum}'">
					</th>
				</tr>
			</table>
		</form>		





<%@ include file="/setting/design_setting_footer.jsp" %>