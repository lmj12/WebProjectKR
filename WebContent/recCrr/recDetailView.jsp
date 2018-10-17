<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp"%>
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
<div class="container">
<h2>상세 이력서 보기 - ${recCrrDto.jbskId}</h2>
<br>
<br>

	<div class="card">
		<div class="card-header d-flex justify-content-center">
			<label for="jbskIt"><strong>이 력 서 </strong></label>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" style="text-align: center";>
					<tr>
						<td rowspan="5"><img src="./setting/image/upload/${recCrrDto.jbskPic}" width="140" height="180" /></td> 
					</tr>
					<tr>
						<th rowspan="2" >성명</th>			<!-- jbskName -->
						<td rowspan="2">${recCrrDto.jbskName}</td>	
						<th colspan="2">생년월일</th>		<!-- jbskBd -->
					</tr>
					<tr>
						<td colspan="2"><fmt:formatDate value="${recCrrDto.jbskBd}" pattern="yyyy년 MM월 dd일"/></td>
					</tr>
					<tr>
						<th>성별</th>			<!-- jbskGender -->
						<td>${recCrrDto.jbskGender}</td>
						<th>연락처</th>		<!-- jbskTel -->
						<td>${recCrrDto.jbskTel}</td>
					</tr>
					<tr>
						<th>주소</th>			<!-- jbskAdd1+2+3 -->
						<td colspan="3">${recCrrDto.jbskAdd1} &nbsp; ${recCrrDto.jbskAdd2} &nbsp; ${recCrrDto.jbskAdd3}&nbsp;</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
		

<div id="resume" style="margin: 7px">
	<div class="table">
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
	</div>
	<div class="conatainer">
		<div class="card">
		<div class="card-header d-flex justify-content-center">
			<label for="jbskIt"><strong>자기소개서</strong></label>
		</div>
		<div class="card-body">
		<textarea class="form-control" id="jbskIt" rows="10" cols="65" readonly>${recCrrDto.jbskIt}</textarea>
		</div>
	</div>
	
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
<div id="crr">
	<table border='1'>
		<tr>
			<th>팀장</th><th>스캔</th><th>예도</th><th>안내</th><th>경호</th>
		</tr>
		<c:if test="${crrDto.jbskId ne null && crrDto.jbskId ne ''}">
			<tr>
				<th>${crrDto.reader}회</th><th>${crrDto.scan}회</th><th>${crrDto.sword}회</th><th>${crrDto.guide}회</th><th>${crrDto.guard}회</th>
			</tr>
			
		</c:if>
		<c:if test="${crrDto.jbskId eq null || crrDto.jbskId eq ''}">
			<tr>
				<th>0회</th><th>0회</th><th>0회</th><th>0회</th><th>0회</th>
			</tr>
		</c:if>
	</table>
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
</div>
<%@ include file="/setting/design_setting_footer.jsp" %>