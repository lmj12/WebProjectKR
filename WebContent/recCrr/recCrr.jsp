<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp"%>
<!DOCTYPE html>
<script type="text/javascript">
	//<!--
	var recId = ${recId};
	
	function viewDetail(jbskId){
		location.replace("recCrrDetail.do?recId="+recId+"&jbskId="+jbskId);
	}
	
	function staCng(status,cursta){
		alert(status);
		event.stopPropagation();
	}
	
	//-->
</script>
<h2>지원 현황 창</h2>
<c:if test="${lists == '' || lists eq null}">
	<script type="text/javascript">
		//<!--
		errorback("지원자가 없습니다.")
		//-->
	</script>
</c:if>
<c:if test="${lists != '' || lists ne null}">
	<table border='1'>
		<tr>
			<th>이름</th><th>아이디</th><th>성별</th><th>전화번호</th><th>지원포지션</th><th>확정</th><th>탈락</th>
		</tr>
	<c:forEach var="RecCrrDto" items="${lists}">
		<tr onclick="viewDetail('${RecCrrDto.jbskId}')">
			<td>${RecCrrDto.jbskName}</td><td>${RecCrrDto.jbskId}</td>
			<c:if test="${RecCrrDto.jbskGender eq 1}">
				<td>남</td>
			</c:if>
			<c:if test="${RecCrrDto.jbskGender eq 2}">
				<td>여</td>
			</c:if>
			<td>${RecCrrDto.jbskTel}</td>
			<c:if test="${RecCrrDto.posId eq 1}">
				<td>팀장</td>
			</c:if>
			<c:if test="${RecCrrDto.posId eq 2}">
				<td>스캔</td>
			</c:if>
			<c:if test="${RecCrrDto.posId eq 3}">
				<td>예도</td>
			</c:if>
			<c:if test="${RecCrrDto.posId eq 4}">
				<td>안내</td>
			</c:if>
			<c:if test="${RecCrrDto.posId eq 5}">
				<td>경호</td>
			</c:if>
			<c:if test="${RecCrrDto.posId eq 6}">
				<td>기타</td>
			</c:if>
			<td><input type="button" onclick="staCng(2,${RecCrrDto.recCrrSta})" value="확정"></td>
			<td><input type="button" onclick="staCng(3,${RecCrrDto.recCrrSta})" value="탈락"></td>
		</tr>
	</c:forEach>
	</table>
</c:if>