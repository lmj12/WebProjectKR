<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp"%>
<!DOCTYPE html>
<div class="container">
<!-- 구직자 페이지 -->
<script type="text/javascript">
	//<!--
	
	function toRecruit(recId){
		location.href="recView.do?recId="+recId+"&pageNum=1"
	}
	function recCncl(recId) {
		var jbskId = '${sessionScope.memid}';
		$.ajax({
	    	method : "POST",
	    	url : "ajaxRecCrrCk.do",
	    	cache : false,
			async : false,
			data : {
				recId : recId,
				jbskId : jbskId
			},
			datatype : "text",
			success : function(data){
				var con;
				if (data == 0){
					alert("지원하지 않은 공고입니다.");
					con = false;
				} else if (data == 1){
					con = confirm("현재 지원되어 있는 직무는 '팀장' 입니다. 지원취소 하시겠습니까?")
				}  else if (data == 2){
					con = confirm("현재 지원되어 있는 직무는 '스캔' 입니다. 지원취소 하시겠습니까?")
				}  else if (data == 3){
					con = confirm("현재 지원되어 있는 직무는 '예도' 입니다. 지원취소 하시겠습니까?")
				}  else if (data == 4){
					con = confirm("현재 지원되어 있는 직무는 '안내' 입니다. 지원취소 하시겠습니까?")
				}  else if (data == 5){
					con = confirm("현재 지원되어 있는 직무는 '경호' 입니다. 지원취소 하시겠습니까?")
				}  else if (data == 6){
					con = confirm("현재 지원되어 있는 직무는 '기타' 입니다. 지원취소 하시겠습니까?")
				}
				
				if(con){
					recCnclConfirm(recId);
				}
				location.reload();
			}, error:function(request,status,error){
				alert();
			}
		})
		
	}
	
	function recCnclConfirm(recId) {
		var jbskId = '${sessionScope.memid}';
		$.ajax({
	    	method : "POST",
	    	url : "ajaxRecCrrCncl.do",
	    	cache : false,
			async : false,
			data : {
				recId : recId,
				jbskId : jbskId
			},
			datatype : "text",
			success : function(data){
				if(data == 1){
					alert("지원취소했습니다.")
					location.reload();
				} else {
					alert("취소에 실패했습니다. 다시 시도해주세요.")
					location.reload();
				}
				
			}, error:function(request,status,error){
				alert();
				location.reload();
			}
		})
		
	}
	//-->
</script>

<h4>${sessionScope.memid}님의 현재 지원중인 공고 목록입니다</h4>
<table border='1'>
	<thead>
		<tr>
			<th>업체ID</th><th>공고상태</th><th>직무</th><th>공고마감일</th><th>지원상태</th><th>공고보기</th><th>지원취소</th>
		</tr>
	</thead>
	<c:forEach var="recCrrDto" items="${recCrrlists}">
		<tr>
			<td>${recCrrDto.jobpId}</td>
			<c:if test="${recCrrDto.recStatus == 0}">
				<td>
					모집중
				</td>
			</c:if>
			<c:if test="${recCrrDto.recStatus == 1}">
				<td>
					모집완료
				</td>
			</c:if>
			<c:if test="${recCrrDto.posId == 1}">
				<td>
					팀장
				</td>
			</c:if>
			<c:if test="${recCrrDto.posId == 2}">
				<td>
					스캔
				</td>
			</c:if>
			<c:if test="${recCrrDto.posId == 3}">
				<td>
					예도
				</td>
			</c:if>
			<c:if test="${recCrrDto.posId == 4}">
				<td>
					안내
				</td>
			</c:if>
			<c:if test="${recCrrDto.posId == 5}">
				<td>
					경호
				</td>
			</c:if>
			<c:if test="${recCrrDto.posId == 6}">
				<td>
					기타
				</td>
			</c:if>
			<td>${recCrrDto.stime}</td>
			<c:if test="${recCrrDto.recCrrSta == 0}">
				<td>
					미열람
				</td>
			</c:if>
			<c:if test="${recCrrDto.recCrrSta == 1}">
				<td>
					열람
				</td>
			</c:if>
			<c:if test="${recCrrDto.recCrrSta == 2}">
				<td>
					확정
				</td>
			</c:if>
			<c:if test="${recCrrDto.recCrrSta == 3}">
				<td>
					탈락
				</td>
			</c:if>
			<td><input type="button" value="공고보기" onclick='toRecruit(${recCrrDto.recId})'></td>
			<td><input type="button" value="지원취소" onclick='recCncl(${recCrrDto.recId})'></td>
		</tr>
	</c:forEach>
</table>
<br><br>
<h4>${sessionScope.memid}님의 완료된 공고 목록입니다</h4>
<table border='1'>
	<thead>
		<tr>
			<th>업체ID</th><th>직무</th><th>공고마감일</th><th>지원상태</th><th>공고보기</th>
		</tr>
	</thead>
	<c:forEach var="recCrrDto" items="${recCrrPrevlists}">
		<tr>
			<td>${recCrrDto.jobpId}</td>
			
			<c:if test="${recCrrDto.posId == 1}">
				<td>
					팀장
				</td>
			</c:if>
			<c:if test="${recCrrDto.posId == 2}">
				<td>
					스캔
				</td>
			</c:if>
			<c:if test="${recCrrDto.posId == 3}">
				<td>
					예도
				</td>
			</c:if>
			<c:if test="${recCrrDto.posId == 4}">
				<td>
					안내
				</td>
			</c:if>
			<c:if test="${recCrrDto.posId == 5}">
				<td>
					경호
				</td>
			</c:if>
			<c:if test="${recCrrDto.posId == 6}">
				<td>
					기타
				</td>
			</c:if>
			<td>${recCrrDto.stime}</td>
			<c:if test="${recCrrDto.recCrrSta == 0}">
				<td>
					미열람
				</td>
			</c:if>
			<c:if test="${recCrrDto.recCrrSta == 1}">
				<td>
					열람
				</td>
			</c:if>
			<c:if test="${recCrrDto.recCrrSta == 2}">
				<td>
					확정
				</td>
			</c:if>
			<c:if test="${recCrrDto.recCrrSta == 3}">
				<td>
					탈락
				</td>
			</c:if>
			<td><input type="button" value="공고보기" onclick='toRecruit(${recCrrDto.recId})'></td>
		</tr>
	</c:forEach>
</table>
</div>