<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp"%>
<h2>공고내용 페이지</h2>

<table border="1">
	
<c:if test="${sessionScope.memType eq 2}">
		<tr>
			<th>지원자수 </th>
			<td align="center">${recDto.crrCnt} </td>
		</tr>
</c:if>

		<tr>
			<th>공고번호</th>
			<td align="center"> <input type="text" name="recId" value="${recDto.recId}" readonly>	</td>
		</tr>
		<tr>
			<th>직무 </th>
			<td align="center"> 
			<c:choose>
			  <c:when test="${recruitDto.posId eq 1}">
			  	팀장
			  </c:when>
			  <c:when test="${recruitDto.posId eq 2}">
			   	스캔
			  </c:when>
			  <c:when test="${recruitDto.posId eq 3}">
			   	예도
			  </c:when>
			  <c:when test="${recruitDto.posId eq 4}">
			   	안내
			  </c:when>
			  <c:when test="${recruitDto.posId eq 5}">
			   	경호
			  </c:when>
			  <c:otherwise>
			   	기타
			  </c:otherwise> 
			 </c:choose>
				</td>
		<tr>
			<th>시작일</th>
			<td>${recDto.recStart}</td>
		</tr>
		<tr>
			<th>종료일</th>
			<td>${recDto.getRecEnd()}</td>
		</tr>
		<tr>
			<th>공고상태</th>
			<td align="center"> 
				<c:if test="${recDto.recStatus eq 0}">
					모집중
				</c:if>
				<c:if test="${recDto.recStatus eq 1}">
					모집완료
				</c:if>
			</td>
		</tr>
		<tr>
			<th>모집직무 </th>
			<td align="center">
				${recDto.getPosPos()}
			</td>
		<tr>
			<th>공고내용</th>
			<td align="center">
				${recDto.getReccontent()}
			</td>
		<tr>
			<th>사업자이름</th>
			<td align="center">
				${recDto.getJbpCn()}
			</td>
		</tr>
		<tr>
			<th>사업자번호 </th>
			<td align="center">
				${recDto.getJbpBnp()}
			</td>
		<tr>
			<th>링크</th>
			<td align="center">
				${recDto.getRecSite()}
			</td>
		</tr>
			

	
	
	
	<tr>
		<th colspan="4">
			<input class="inputbutton" type="button" value="지원"
				onclick="location='recMyView.do?recId=${recDto.recId}&pageNum=${pageNum}'">
		<c:if test="${sessionScope.memType eq 2}">
			<input class="inputbutton" type="button" value="공고수정"
				onclick="location='recMod.do?recId=${recDto.recId}&pageNum=${pageNum}'">
			<input class="inputbutton" type="button" value="공고삭제"
				onclick="location='recDel.do?recId=${recDto.recId}&pageNum=${pageNum}'">
		</c:if>
			
			<input class="inputbutton" type="button" value="목록으로"
				onclick="location='recList.do?recId=${recDto.recId}&pageNum=${pageNum}'">
		</th>
	</tr>		
</table>