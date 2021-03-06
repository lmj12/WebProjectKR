<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<script src="${js}recCng.js"></script>
<div class="container">
<h2>공고조회 페이지</h2>
<style type="text/css">
table{
	margin : 10px 10px 10px 10px;
	}
	
</style>
<c:if test="${sessionScope.memType eq 2}">	
공고작성 : <input type="button" value="추가" onclick="location='recWrt.do'"> 
</c:if>

<c:if test="${count eq 0}">	
		<tr>
		<td>공고가 없습니다 </td>
		</tr>
</c:if>

<c:if test="${count ne 0}">
<div>
<c:forEach var="article" items="${articleList}">

<input type="hidden" name="recId" value="${article.recDto.recId}">

<table border="1"  style="cursor:hand;float:left;width:30%;" onclick="location.href='recView.do?recId=${article.recDto.recId}'">	
	<thead>
		<tr>
			<th>공고상태</th>
				<c:if test="${article.recDto.recStatus eq 0}">
			    	<th class="statusOpt" align="center" style="background: green">	
			    		모집중
			    </c:if>
			    <c:if test="${article.recDto.recStatus eq 1}">
				    <th class="statusOpt" align="center" style="">
			    		모집완료
			    </c:if>
			    <c:if test="${article.recDto.recStatus eq 2}">
				    <th class="statusOpt" align="center">
			    		완료
			    </c:if>	
			</th>		
		</tr>
	</thead>
	<tr>
		<th>공고번호 </th>
		<td align="center">
				${article.recDto.recId}				
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
		<th>등록일</th>
		<td align="center">
					${article.recDto.stime}		
				</td>				
	</tr>
	<tr>
		<th>예식일시</th>
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
	
		
</table>
	
</c:forEach>
</div>	
</c:if>	

<br>

</div>
<%@ include file="/setting/design_setting_footer.jsp" %>


