<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDBBean"%>
<%@page import="board.BoardDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="../setting/setting.jsp" %>
<script src="${js}notice.js"></script>

<div class="container">
<h2> 글쓰기 </h2>
<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		alert('inserterror');
		//-->
	</script>
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="boardList.do"/>		
</c:if>

<form method="post" action="boardWrt.do" name="writeform" onsubmit="return writecheck()">
    		
    		 <input type="hidden" name="boardId" value="${boardId}">
    		<input type="hidden" name="boardParentId" value="${boardParentId}">
    		<input type="hidden" name="boardregdate" value="java.sql.Timestamp">
    		<input type="hidden" name="userId" value="${sessionScope.memid}" readonly>
    	<table border="1">
    		<tr>
    			<th colspan="2" align="right">
    				<a href="boardList.do"> 글목록 </a>&nbsp;&nbsp;&nbsp;
    			</th>    			
    		</tr>
    <c:if test="${sessionScope.memType ne 3}">
    		<tr>
    			<th>작성자 </th>
    			<td> ${boardDto.getUserId()} </td>
    		</tr>
    </c:if>
    <c:if test="${sessionScope.memType eq 3}">
    		<tr>
    			<th>작성자 </th>
    			<td> ${boardDto.userId} </td>
    		</tr>
    <!-- 	
    		<tr>
    			<th>답변자</th>
    			<td>  ${boardDto.getUserId()}</td>
    		</tr>
    -->
    </c:if>
    		
    	
    		<tr>
    			<th> 내용 </th>  
    			<td>
    				<textarea name="boardContent" onkeyup="len2()" rows="10" cols="40" style="overflow:hidden"></textarea>
    			</td>
    			
    		</tr>
    		
    		<tr>
    			<th colspan="2">
    			<input class="inputbutton" name="write" type="submit" value="글작성">
  		<!--   		<input class="inputbutton" type="reset" value="글작성 취소">	-->
    			<input class="inputbutton" type="button" value="목록으로" onclick ="location='boardList.do'">
    		</th>
    		</tr>
    	</table>
    	</form>
</div>
    	
 
<%@ include file="/setting/design_setting_footer.jsp" %>