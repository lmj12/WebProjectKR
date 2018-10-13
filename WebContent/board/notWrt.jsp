<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>
<%@ include file="/board/setting.jsp" %>
<h2>공고글 쓰기 페이지</h2>

<form method="post" action="notWrt.do" name="noticeform">
    		
    		 <input type="hidden" name="boardId" value="${boardId}">
    		<input type="hidden" name="boardParentId" value="${boardParentId}">
    		<input type="hidden" name="boardregdate" value="java.sql.Timestamp">
    		<input type="hidden" name="userId" value="${sessionScope.memid}" readonly>
    	<table border="1">
    		<tr>
    			<th colspan="2" align="right">
    				<a href="notice.do"> 공지목록 </a>&nbsp;&nbsp;&nbsp;
    			</th>    			
    		</tr>
   
    <c:if test="${sessionScope.memType eq 3}">
    		<tr>
    			<th> 내용 </th>  
    			<td>
    				<textarea name="boardContent" rows="10" cols="40"></textarea>
    			</td>
    			
    		</tr>
    		
    		<tr>
    			<th colspan="2">
    			<input class="inputbutton" name="write" type="submit" value="글작성">
    			<input class="inputbutton" type="reset" value="글작성 취소">
    			<input class="inputbutton" type="button" value="목록으로" onclick ="hBack()">
    		</th>
    		</tr>
    </c:if>
    	</table>
    	</form>

    	
 
<%@ include file="/setting/design_setting_footer.jsp" %>
