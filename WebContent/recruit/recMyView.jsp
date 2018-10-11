<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp"%>
<script src="${js}recSet.js"></script>
<h2>내 공고 보기 </h2>

<input type="button" value="마이페이지로" onclick="location='mypage.do'">

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



<c:if test="${count eq 0}">	
		<tr>	
		<td>공고가 없습니다 </td>			
		</tr>
</c:if>
<c:if test="${count ne 0}">
<c:forEach var="article" items="${articles}">
<input type="hidden" name="recId" value="${article.recId}">
<table border="1" style="cursor:hand;" onclick="location.href='recView.do?recId=${article.recId}&pageNum=${pageNum}'">	

	<tr>
		<th>공고번호 </th>
		<td align="center">
				${article.recId}				
		</td>	
	</tr>
	<tr>
		<th>공고상태</th>
		<td>
					<c:if test="${article.recStatus eq 0}">
				    		<option value="0" selected>모집중 </option>
				    </c:if>
				    <c:if test="${article.recStatus eq 1}">
				    		<option value="1" selected>모집완료 </option>
				    </c:if>
				</td>		
	</tr>
	<tr>
		<th>사업자 이름</th>
		<td align="center">						
					<a href ="recMyView.do?recId=${article.recId}&pageNum=${pageNum}">
						${jbpDto.jobpCn}
					</a>	
				</td>				
	</tr>
	<tr>
		<th>직무 </th>
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
	</tr>
	<tr>
		<th>시작일</th>
		<td align="center">
					${article.recStart}		
				</td>				
	</tr>
	<tr>
		<th>종료일</th>
		<td align="center">
					${article.recEnd}
				</td>	
	</tr>
	<tr>
		<th>조회수</th>
		<td align="center">
					${article.recReadCnt}	
				</td>				
	</tr>
	
	
</table>
<form action="recStaCng.do" method="post">
<input type="hidden" name="recId" value="${article.recId}">
<table>
<tr>
	<th>모집상태 변경 </th>
	<td>
	<select name="sta" id="sta">
		<option name="opt" value="2" selected>모집중 </option>
		<option name="opt" value="1">모집완료</option>
	</select>
	</td>
	<td>
	<input type="submit" name="cng['recId']" value="변경">
	<input type="hidden" id="val">
	</td>
</tr>
</table>
</form>
<br><br>
</c:forEach>		
</c:if>	
	
<br>
<c:if test="${count ne 0}">
	<c:if test="${startPage gt pageBlock}">
		<a href="recMyView.do">[◀◀] </a>
		<a href="recMyView.do?pageNum=${startPage-pageBlock}">[◀] </a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test="${i eq currentPage}">
			<b>[${i}]</b>
		</c:if>
		<c:if test="${i ne currentPage}">					
			<a href="recMyView.do?pageNum=${i}">[${i}] </a>
		</c:if>	
	</c:forEach>
	<c:if test="${pageCount gt endPage}">
		<a href ="recMyView.do?pageNum=${startPage+pageBlock}">[▶]</a>
		<a href ="recMyView.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>	
</c:if>