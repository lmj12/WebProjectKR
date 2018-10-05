<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../setting/setting.jsp" %>
<script src="${js}recSet.js"></script>
<h2>공고수정페이지</h2>
<script type="text/javascript">
var cnt = 0;

</script>
<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		alert( modifyerror );
		//-->
	</script>		
	<meta http-equiv="refresh" content="0; url=recList.do?pageNum=${pageNum}">
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="recList.do?pageNum=${pageNum}"/>
</c:if>	

<form name="recMod" method="post" action="recMod.do" >
<table border="1">
<input type="hidden" name="jobpId" value="${recDto.jobpId}">
	<tr>
		<th>공고번호  </th>
		<td> <input type="text" name="recId" value="${recDto.recId}" readonly> </td>
	
		
		<th> 종료일</th>
		<td> <input type="datetime-local" name="recEnd">	</td>
	</tr>
	<tr>
		<tr id="addposx">
		<th>공고 직무 </th>
		<td> 		
		<input type="button" value="추가" name="addpos" onclick="return add()"> 
		<input type="hidden" id="confirm" value="0">	</td>
	</tr>
	</tr>
	<tr>
		<th colspan="8">공고내용</th>	
	
	</tr>
	<tr>
		<td colspan="8"> <textarea name="reccontent" placeholder="${recDto.reccontent}" rows="10" cols="80"></textarea></td>
	</tr>
	<tr> 
		<th> 사업장 이름 </th>
		<td colspan="7"> <input type="text" name="jbpCn" value="${jbpDto.jobpCn}" readonly>		</td>
	</tr>
	<tr>
		<th>사업자 번호 </th>
		<td colspan="7"> <input type="text" name="jbpBnp" value="${jbpDto.jobpBno}" readonly>	</td>
	</tr>
	<tr>
		<th>링크</th>
		<td colspan="7">  <input type="url" name="${recDto.recSite}" >	</td>
	</tr>
	<tr>
    		<th colspan="8">
    			<input class="inputbutton" name="write" type="submit" value="공고수정">
    			<input class="inputbutton" type="reset" value="공고수정 취소">
    			<input class="inputbutton" type="button" value="목록으로" onclick ="location='recList.do?pageNum=${pageNum}'">
    		</th>
    </tr>	


</table>
</form>