<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp" %>
<script src="${js}recSet.js"></script>
<h2>공고 등록페이지</h2>
<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		erroralert('inserterror');
		//-->
	</script>
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="recList.do"/>		
</c:if>
<form name="recwrite" method="post" action="recWrt.do" >
<table border="1">
<input type="hidden" name="jobpId" value="${jbpDto.jobpId}">
	<tr>
		<th>공고번호  </th>
		<td> <input type="text" name="recId" value="${recDto.recId}" readonly> </td>
	
		
		<th> 종료일</th>
		<td> <input type="datetime-local" name="recEnd">	</td>
	
		<th>공고 직무 </th>
		<td> 
		<select name="posPos">
			<option value="팀장" selected>팀장</option>	
			<option value="스캔">스캔</option>	
			<option value="예도">예도</option>	
			<option value="안내">안내</option>
			<option value="경호">경호</option>		
			<option value="기타">기타</option>	
		</select>			
		</td>
	</tr>
	<tr>
		<th colspan="8">공고내용</th>	
	
	</tr>
	<tr>
		<td colspan="8"> <textarea name="reccontent" rows="10" cols="80"></textarea></td>
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
		<td colspan="7">  <input type="url" name="recSite" >	</td>
	</tr>
	<tr>
    		<th colspan="8">
    			<input class="inputbutton" name="write" type="submit" value="공고작성">
    			<input class="inputbutton" type="reset" value="공고작성 취소">
    			<input class="inputbutton" type="button" value="목록으로" onclick ="location='recList.do'">
    		</th>
    </tr>	


</table>
</form>