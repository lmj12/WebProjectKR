<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp"%>
<script src="${js}recCng.js"></script>
<h2>공고조회 페이지</h2>

<c:if test="${sessionScope.memType eq 2}">	
공고작성 : <input type="button" value="추가" onclick="location='recWrt.do'"> 
</c:if>

<c:if test="${count eq 0}">	
		<tr>
		<td>공고가 없습니다 </td>
		</tr>
</c:if>
<c:if test="${count ne 0}">
<c:forEach var="article" items="${articleList}">
<input type="hidden" name="recId" value="${article.recDto.recId}">
<table border="1" style="cursor:hand;" onclick="location.href='recView.do?recId=${article.recDto.recId}&pageNum=${pageNum}&recReadCnt=${recReadCnt}'">	

	<tr>
		<th>공고번호 </th>
		<td align="center">
				${article.recDto.recId}				
		</td>	
	</tr>
	<tr>
		<th>공고상태</th>
		<td id="con">
					<c:if test="${article.recDto.recStatus eq 0}">
				    		모집중
				    </c:if>
				    <c:if test="${article.recDto.recStatus eq 1}">
				    		모집완료
				    </c:if>
				    <c:if test="${article.recDto.recStatus eq 2}">
				    		완료
				    </c:if>	
				</td>		
	</tr>
	<tr>
		<th>사업자 이름</th>
		<td align="center">						
						${article.jobpDto.jobpCn}
				
		</td>				
	</tr>
	<tr>
		<th>직무</th>
		<td align="center" id="position"> 
			<c:forEach var="recruitDto" items="${article.poss}">
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
			 </c:forEach>
		</td>				
	</tr>
	<tr>
		<th>시작일</th>
		<td align="center">
					${article.recDto.stime}		
				</td>				
	</tr>
	<tr>
		<th>종료일</th>
		<td align="center">
					${article.recDto.etime}
				</td>	
	</tr>
	<tr>
		<th>조회수</th>
		<td align="center">
					${article.recDto.recReadCnt}	
				</td>	
				
	</tr>
	<c:if test="${sessionScope.memid eq article.jobpDto.jobpId}">
	<c:if test="${sessionScope.memType eq 2}">
	<tr>
		<th>공고상태변경</th>
				<td onclick="event.cancelBubble = true;">
				
				<select name="sta" id="sta">
					<option value="0" selected>모집중 </option>
					<option value="1">모집완료</option>
					<option value="2">완료</option>
				</select>	
				
				<input type="button" name="cng" value="변경" onclick="recCng(${article.recDto.recId})">
				<input type="hidden" id="val" name="val">
			
				</td>						
	</tr>
	</c:if>
	</c:if>
	
</table>
<br><br>
</c:forEach>
		
</c:if>	
	
<br>



