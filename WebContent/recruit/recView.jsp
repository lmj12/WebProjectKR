<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<script type="text/javascript">
	//<!--
	
	$(document).ready(function(){
	   	appTable();
	});
	function recApply() {
		var memType = ${sessionScope.memType}
		if(memType==1){
			var recId = $("#recId").val()
			var jbskId = '${sessionScope.memid}';
			var posId = $("#pos option:selected").val();
			$.ajax({
		    	method : "POST",
		    	url : "ajaxRecCrrApply.do",
		    	cache : false,
				async : false,
				data : {
					recId : recId,
					posId : posId,
					jbskId : jbskId
				},
				datatype : "text",
				success : function(data){
					if(data == 1){
						alert("지원성공했습니다.")
					} else if (data==2){ 
						alert("이미 지원한 공고입니다.")
					} else {
						alert("지원에 실패했습니다. 다시 시도해주세요.")
					}
					
				}, error:function(request,status,error){
					alert();
				}
			})
		} else {
			alert("지원할 수 없는 형태의 사용자입니다.")
		}
	}
	
	function appTable(){
		var appstr ="<select id='pos'>";
		var posIds = document.getElementsByName("posId");
		
		for (var i=0; i<posIds.length; i++){
			var posId = posIds[i].value
			var posName;
			if(posId==1){
				posName = "팀장";
			} else if(posId==2){
				posName = "스캔";
			} else if(posId==3){
				posName = "예도"
			} else if(posId==4){
				posName = "안내"
			} else if(posId==5){
				posName = "경호"
			}
			appstr += "<option value='"+posId+"'>"+posName+"</option>"  
		}
		appstr += "</select><input type='button' value='지원' onclick='recApply()'>"
		$("#app").html(appstr);
	}
	//-->
</script>
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
			<td align="center">${recDto.recId}<input type="hidden" id="recId" value="${recDto.recId}"></td>
			
		</tr>
		<tr>
			<th>직무 </th>
			<td align="center"> 
			<c:forEach var="recruitDto" items="${recruitDto}">
			<input type="hidden" value="${recruitDto.posId}" name="posId">
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
			<th>공고내용</th>
			<td align="center">
				${recDto.getReccontent()}
			</td>
		</tr>
		<tr>
			<th>사업자이름</th>
			<td align="center">
				${jbpDto.jobpCn}
			</td>
		</tr>
		<tr>
			<th>사업자번호 </th>
			<td align="center">
				${jbpDto.jobpBno}
			</td>
		<tr>
			<th>주소</th>
			<td align="center">
				${recDto.getRecSite()}
			</td>
		</tr>
			<tr>
		<th colspan="4">
			<c:if test="${sessionScope.memid eq jbpDto.jobpId}">
				<input class="inputbutton" type="button" value="공고수정"
					onclick="location='recMod.do?recId=${recDto.recId}&pageNum=${pageNum}'">
				<input class="inputbutton" type="button" value="공고삭제"
					onclick="location='recDel.do?recId=${recDto.recId}&pageNum=${pageNum}'">
				<input type="button" value="지원현황"
					onclick="location='recCrrView.do?recId=${recDto.recId}'">
			</c:if>
			<input class="inputbutton" type="button" value="목록으로"
				onclick="location='main.do?pageNum=${pageNum}'">
		</th>
	</tr>	
</table>			
<br>
	
	
<table border='1'>
	<tr>
		<th colspan='4' id="app">
		
		</th>
	</tr>
</table>

<%@ include file="/setting/design_setting_footer.jsp" %>