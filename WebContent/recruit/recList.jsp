<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp"%>
<h2>공고조회 페이지</h2>

<input type="button" value="메인으로" onclick="location='main.do'">
<c:if test="${sessonScope.memid ne null}">
<c:if test="${sessionScope.memType eq 2}">	
공고작성 : <input type="button" value="추가" onclick="location='recWrt.do'"> 
</c:if>
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
<input type="hidden" name="recId" value="${article.recId}">
	<tr>
		<th>공고번호 </th>
		<td align="center">
				${article.recId}				
		</td>	
	</tr>
	<tr>
		<th>공고상태</th>
		<td>
					<c:if test="${article.recStatus} eq 0">
				    		모집중
				    </c:if>
				    <c:if test="${article.recStatus} eq 1">
				    		모집완료
				    </c:if>
				</td>		
	</tr>
	<tr>
		<th>사업자 이름</th>
		<td align="center">						
					<a href ="recView.do?recId=${article.recId}&pageNum=${pageNum}">
						${article.jbpCn}
					</a>	
				</td>				
	</tr>
	<tr>
		<th>직무</th>
		<td align="center">					
					${article.posPos}
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
<br><br>
</c:forEach>		
</c:if>	
	
<br>
<c:if test="${count ne 0}">
	<c:if test="${startPage gt pageBlock}">
		<a href="recList.do">[◀◀] </a>
		<a href="recList.do?pageNum=${startPage-pageBlock}">[◀] </a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test="${i eq currentPage}">
			<b>[${i}]</b>
		</c:if>
		<c:if test="${i ne currentPage}">					
			<a href="recList.do?pageNum=${i}">[${i}] </a>
		</c:if>	
	</c:forEach>
	<c:if test="${pageCount gt endPage}">
		<a href ="recList.do?pageNum=${startPage+pageBlock}">[▶]</a>
		<a href ="recList.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>	
</c:if>




