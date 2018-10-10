<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp"%>
<script src="${js}recCrr.js"></script>
<!DOCTYPE html>
<script type="text/javascript">
	//<!--
	var recId = ${recCrrDto.recId};
	var jbskBd = '${recCrrDto.jbskBd}'
	var date = new Date(jbskBd);
	var bd = date.getFullYear() + "/" + date.getMonth() + "/" + date.getDate();
 	var age = new Date().getFullYear() - date.getFullYear();
 	
	$(document).ready(function(){
		$("#age").text(age);
		$("#bd").text(bd);
	});
		
	function toApplyList(){
		location.replace("recCrrView.do?recId="+recId);
	}
	
	//-->
</script>
<h2>상세 이력서 보기 - ${recCrrDto.jbskId}</h2>
<br>
<br>
<div id="resume" style="margin: 7px">
	<table border='1' style="float: left; margin-right: 7px;" >
		<tr>
			<th height="150" width="150">사진구역</th>
		</tr>
	</table>
	<br>
	<table border='1' id="jbsk">
		<tr>
			<th>성 명</th><td colspan="3" width="250">(한 글)&emsp;&emsp;${recCrrDto.jbskName}</td>
		</tr>
		<tr>
			<th>나이</th><td width="70" id="age" style="text-align: center"></td><th>생년월일</th><td id="bd"></td>
		</tr>
		<tr>
			<th>email</th><td>${recCrrDto.jbskEmail}</td><th>전화번호</th><td>${recCrrDto.jbskTel}</td>
		</tr>
		<tr>
			<th>주소</th><td colspan='3' style="text-align: center">${recCrrDto.jbskAdd1} &nbsp; ${recCrrDto.jbskAdd2} &nbsp; ${recCrrDto.jbskAdd3}&nbsp;</td>
		</tr>
	</table>
	<br><br>
	<h4><b>자기소개서</b></h4><br>
	<textarea id="jbskIt" rows="10" cols="65">${recCrrDto.jbskIt}</textarea>
</div>
<br>
<div id="iptcrr">
	<c:if test="${iptSize != 0}">
		<table border='1'>
			<tr>
				<th>회사명</th><th>직무</th><th>근무시작일</th><th>근무종료일</th><th>근무기간</th>
			</tr>
			<c:forEach var="iptDto" items="${iptLists}">
				<tr>
					<td>${iptDto.iptCompany}</td>
					<c:if test="${iptDto.posId == 1}">
						<td>팀장</td>
					</c:if>
					<c:if test="${iptDto.posId == 2}">
						<td>스캔</td>
					</c:if>
					<c:if test="${iptDto.posId == 3}">
						<td>예도</td>
					</c:if>
					<c:if test="${iptDto.posId == 4}">
						<td>안내</td>
					</c:if>
					<c:if test="${iptDto.posId == 5}">
						<td>경호</td>
					</c:if>
					<c:if test="${iptDto.posId == 6}">
						<td>기타</td>
					</c:if>
					<td id="start">${iptDto.iptStart}</td>
					<td id="end">${iptDto.iptEnd}</td>
					<td>${iptDto.iptPeriod}개월</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
<div id="bt">
	<table border='1'>
		<tr>
			<th><input type="button" value="확정" onclick="staCngConfirm(${recCrrDto.recCrrSta},${recCrrDto.recCrrId})">
			<input type="button" value="탈락" onclick="staCngDrop(${recCrrDto.recCrrSta},${recCrrDto.recCrrId})">
			<input type="button" value="지원자 리스트로" onclick="toApplyList()"></th>
			
		</tr>
	</table>
</div>