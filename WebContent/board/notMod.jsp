<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>
<script src="${js}notice.js"></script>

<div class="container">
<h2>공지사항 수정 페이지</h2>
<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		alert('inserterror');
		//-->
	</script>
	<meta http-equiv ="refresh" content="0; url=notice.do">
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="notice.do"/>		
</c:if>

<form method="post" action="notMod.do" name="noticeform" onsubmit="return noticecheck()">    		 
    	<input type="hidden" name="boardregdate" value="java.sql.Timestamp">
    	<input type="hidden" name="userId" value="${sessionScope.memid}" readonly>
    	<input type="hidden" name="boardId" value="${boardDto.boardId}">
    	<table border="1">
    		<tr>
    			<td colspan="2" align="right">
    				<input type="button" value="공지목록" onclick="location='notice.do'">
    			</td>    			
    		</tr>
   
 
    		<tr>
    			<th>제목</th>
    			<td>
    				<input type="text" name="boardtitle" placeholder="${boardDto.boardTitle}">
    			</td>
    		<tr>
    			<th> 내용 </th>  
    			<td>
    				<textarea name="boardContent" rows="10" cols="40" placeholder="${boardDto.boardContent}"></textarea>
    			</td>
    			
    		</tr>
    		
    		<tr>
    			<th colspan="2">
    			<input class="inputbutton" name="modify" type="submit" value="글수정">
    			<input class="inputbutton" type="reset" value="수정 취소">
    			<input class="inputbutton" type="button" value="목록으로" onclick ="hBack()">
    		</th>
    		</tr>

    	</table>
    	</form>

    	
 </div>
<%@ include file="/setting/design_setting_footer.jsp" %>
