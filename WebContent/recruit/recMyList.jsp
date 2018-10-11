<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>나의 공고 확인 페이지</h2>
<%@ include file="../setting/setting.jsp"%>
<script src="${js}recSet.js"></script>
<script src="${js}recCng.js"></script>
<input type="button" value="마이페이지" onclick="location='mypage.do'">
<c:if test="${sessionScope.memType eq 2}">	
공고작성 : <input type="button" value="추가" onclick="location='recWrt.do'"> 
</c:if>
		

<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		alert( modifyerror );
		//-->
	</script>		
	<meta http-equiv="refresh" content="0; url=recMyView.do?pageNum=${pageNum}">
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="recMyView.do?pageNum=${pageNum}"/>
</c:if>	



<form method="post" action="recMyView.do">
<input type="hidden" name="recId" value="${article.recId}">
<table border="1">
			
	<tr>
		<th style="width : 15%" colspan="7" align="left">
		${sessionScope.memid}님의 공고확인페이지입니다. 
		</th>
	
		
	</tr>
	
	<tr>
		<th style="width : 3%">	 공고번호</th>
		<th style="width : 4%">	 공고상태</th>
		<th style="width : 8%"> 직무 </th>
		
		<th style="width : 8%"> 시작일 </th>
		<th style="width : 8%"> 종료일 </th>
		<th style="width : 3%">	 조회수</th>
		<th style="width : 3%">	 공고상태 변경</th>
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
		
			<tr style="cursor:pointer;" onClick="location.href='recView.do?recId=${article.recId}'">
				<td align="center">
					${article.recId}						
				</td>			
				<td id="stat">						
					<c:if test="${article.recStatus eq 0}">
				    		모집중 
				    </c:if>
				    <c:if test="${article.recStatus eq 1}">
				    		모집완료
				    </c:if>					
				<td align="center">
				<c:forEach var="recruitDto" items="${recruitDto}">
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
				<td align="center">
				${article.recStart}	
				</td>
				<td align="center">
					${article.recEnd}
				</td>	
				<td align="center">
					${article.recReadCnt}	
				</td>	
				<td onclick="event.cancelBubble = true;">
				
				<select name="sta" id="sta">
					<option value="0" selected>모집중 </option>
					<option value="1">모집완료</option>
				</select>	
				
				<input type="button" name="cng" value="변경" onclick="recCng(${article.recId})">
				<input type="hidden" id="val" name="val">
			
				</td>			
			</tr>
		</c:forEach>	
	</c:if>
</table>
</form>
<br>
<c:if test="${count ne 0}">
	<c:if test="${startPage gt pageBlock}">
		<a href="recMyList.do">[◀◀] </a>
		<a href="recMyList.do?pageNum=${startPage-pageBlock}">[◀] </a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test="${i eq currentPage}">
			<b>[${i}]</b>
		</c:if>
		<c:if test="${i ne currentPage}">					
			<a href="recMyList.do?pageNum=${i}">[${i}] </a>
		</c:if>	
	</c:forEach>
	<c:if test="${pageCount gt endPage}">
		<a href ="recMyList.do?pageNum=${startPage+pageBlock}">[▶]</a>
		<a href ="recMyList.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>	
</c:if>