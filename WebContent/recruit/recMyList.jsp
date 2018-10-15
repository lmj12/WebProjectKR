<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp"%>

<script src="${js}recCng.js"></script>
<h2>나의 공고 확인 페이지</h2>
<c:if test="${sessionScope.memType eq 2}">	
공고작성 : <input type="button" value="추가" onclick="location='recWrt.do'"> 
</c:if>
		
<script type="text/javascript">
	//<!--
	
	var recStart = '${article.recStart}';
	var st = new Date(recStart).format("yyyy/MM/dd HH:mm");
	
	var recEnd = '${article.recEnd}';
	var et = new Date(recEnd).format("yyyy/MM/dd HH:mm");;

	$(document).ready(function(){
	   	$("#stv").text(st);
	   	$("#etv").text(et);	
	});
	//-->
</script>
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


<div class="container">
	<form method="post" action="recMyView.do">
	<input type="hidden" name="recId" value="${article.recDto.recId}">
	<h4>${sessionScope.memid}님의 현재 모집중인 공고 목록입니다</h4>
	<table border="1">
		<thead>
			 
			<tr>
				<th style="width : 3%">공고번호</th>
				<th style="width : 4%">공고상태</th>
				<th style="width : 8%">직무</th>
				
				<th style="width : 8%">시작일</th>
				<th style="width : 8%">종료일</th>
				<th style="width : 3%">조회수</th>
				<th style="width : 3%">상태변경</th>
			</tr>
		</thead>
	<c:if test="${count eq 0}">	
		<tfoot>
			<tr>
				<td colspan="7" align="center">
					공고가 없습니다
				</td>
			</tr>
		</tfoot>
		</c:if>
		<c:forEach var="article" items="${articleList}">
		<c:if test="${count ne 0}">
			
	
				<tr style="cursor:pointer;" onClick="location.href='recView.do?recId=${article.recDto.recId}'">
					<td align="center">
						${article.recDto.recId}							
					</td>			
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
					<td align="center">
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
							
					<td align="center">
						${article.recDto.stime}
					</td>
					<td align="center">
						${article.recDto.etime}
					</td>	
				
					<td align="center">
						${article.recDto.recReadCnt}	
					</td>	
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
		</c:forEach>	
	</table>
	</form>
</div>
<br><br>
<div class="container">
	<h4>${sessionScope.memid}님의 완료된 공고 목록입니다</h4>
	<form method="post" action="recMyView.do">
	<input type="hidden" name="recId" value="${article.recDto.recId}">
	<table border="1">
		<thead>
			<tr>
				<th style="width : 3%">	 공고번호</th>
				<th style="width : 4%">	 공고상태</th>
				<th style="width : 8%"> 직무 </th>
				
				<th style="width : 8%"> 시작일 </th>
				<th style="width : 8%"> 종료일 </th>
				<th style="width : 3%">	 조회수</th>
			</tr>
		</thead>
	<c:if test="${count eq 0}">	
		<tfoot>
			<tr>
				<td colspan="6" align="center">
					공고가 없습니다
				</td>
			</tr>
		</tfoot>
		</c:if>
		<c:forEach var="article" items="${twoList}">
		<c:if test="${count ne 0}">
			
	
				<tr style="cursor:pointer;" onClick="location.href='recView.do?recId=${article.recDto.recId}'">
					<td align="center">
						${article.recDto.recId}							
					</td>			
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
					<td align="center">
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
							
					<td align="center">
						${article.recDto.stime}
					</td>
					<td align="center">
						${article.recDto.etime}
					</td>	
				
					<td align="center">
						${article.recDto.recReadCnt}	
					</td>	
					
				</tr>
			
		</c:if>
		</c:forEach>	
	</table>
	</form>
</div>
<div class="container">	<br>
	
</div>