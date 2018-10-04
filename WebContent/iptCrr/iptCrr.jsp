<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ include file="../setting/setting.jsp"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!DOCTYPE html>
<h2> 이력서제작 및 경력입력 </h2>




			
										<!-- 기본 이력서 정보 -->
<table>
	<tr>
		<td rowspan="5">사진</td>
		<th colspan="4"> 이 력 서 </th>
	</tr>
	<tr>
		<td rowspan="2">성명</td>			<!-- jbskName -->
		<td rowspan="2"><input type="text" name="jbskName" value="${jbskDto.jbskName}" readonly></td>	
		<td colspan="2">생년월일</td>		<!-- jbskBd -->
	</tr>
	<tr>
		<td colspan="2"><fmt:formatDate value="${jbskDto.jbskBd}" pattern="yyyy년 MM월 dd일"/></td>
	</tr>
	<tr>
		<td>성별</td>			<!-- jbskGender -->
		<td><input type="text" name="jbskGender" value="${jbskDto.jbskGender}" readonly></td>
		<td>연락처</td>		<!-- jbskTel -->
		<td><input type="text" name="jbskTel" value="${jbskDto.jbskTel}" readonly></td>
	</tr>
	<tr>
		<td>주소</td>			<!-- jbskAdd1+2+3 -->
		<td colspan="3"><input type="text" name="jbskAddress" value="${jbskAddress}" readonly></td>
	</tr>
</table>




<script src="${js}iptCrr.js"></script>
<form method="POST" name="iptCrrForm">
	<!-- listCnt=iptid IPTCOMPANY	IPTWH	IPTSTART	IPTEND	posId	IPTPERIOD -->
	<table>	
		<thead>
			<tr>
				<td>번호</td>
				<td>업체명</td>
				<td>근무지</td>
				<td>시작일</td>
				<td>종료일</td>
				<td>근무직무</td>
				<td colspan="2">기간</td>
			</tr>
		</thead>
		<tbody id="iptCrr_tbody">
			<c:forEach var="iptDto" items="${iptDtoList}">
				<c:set var="iptId" value="${iptDto.iptId}" />
				<c:set var="posId" value="${iptDto.posId}"/>
				<script type="text/javascript">
				//<!--
				alert(posId);
				//-->
				</script>
				<tr>
					<td width="8px"><input type="text" name=iptId value="${iptId}" placeholder="번호" /></td>
					<%-- 	<input type='hidden' id='iptId' value="${iptId}"> --%>
					<td><input type="text" name="iptCompany" value="${iptDto.iptCompany}" placeholder="업체명"  /></td>
					<td><input type="text" name="iptWh" value="${iptDto.iptWh}" placeholder="근무지" /></td>
					<td><input type="text" name="iptStart" id="from" value="${iptDto.iptStart}"></td>
					<td><input type="text" name="iptEnd" id="to" value="${iptDto.iptEnd}"></td>
					<td>
						<select class="form-control" name="posId" id="posId">
					  		<!-- TODO : 스크립트 내에서 jstl, EL 태그를 써서 이런 반복 작업을 안 할 수도 있을텐데, 잘 안된다 -->
						    <c:choose>
								<c:when test="${iptDto.posId eq 1}">
									<option value="1" selected="selected">팀장</option>
									<option value="2">스캔</option>
								    <option value="3">예도</option>
								    <option value="4">안내</option>
								    <option value="5">경호</option>
								    <option value="6">기타</option>
								</c:when>
								<c:when test="${iptDto.posId eq 2}">
									<option value="1">팀장</option>
									<option value="2" selected="selected">스캔</option>
								    <option value="3">예도</option>
								    <option value="4">안내</option>
								    <option value="5">경호</option>
								    <option value="6">기타</option>
								</c:when>
								<c:when test="${iptDto.posId eq 3}">
									<option value="1">팀장</option>
									<option value="2">스캔</option>
								    <option value="3" selected="selected">예도</option>
								    <option value="4">안내</option>
								    <option value="5">경호</option>
								    <option value="6">기타</option>
								</c:when>
								<c:when test="${iptDto.posId eq 4}">
									<option value="1">팀장</option>
									<option value="2">스캔</option>
								    <option value="3">예도</option>
								    <option value="4" selected="selected">안내</option>
								    <option value="5">경호</option>
								    <option value="6">기타</option>
								</c:when>
								<c:when test="${iptDto.posId eq 5}">
									<option value="1">팀장</option>
									<option value="2">스캔</option>
								    <option value="3">예도</option>
								    <option value="4">안내</option>
								    <option value="5" selected="selected">경호</option>
								    <option value="6">기타</option>
								</c:when>
								<c:when test="${iptDto.posId eq 6}">
									<option value="1">팀장</option>
									<option value="2">스캔</option>
								    <option value="3">예도</option>
								    <option value="4">안내</option>
								    <option value="5">경호</option>
								    <option value="6" selected="selected">기타</option>
								</c:when>
								<c:otherwise>
									<option value="1">팀장</option>
									<option value="2">스캔</option>
								    <option value="3">예도</option>
								    <option value="4">안내</option>
								    <option value="5">경호</option>
								    <option value="6">기타</option>
								</c:otherwise>
							</c:choose>
						</select> 
					</td>
					<!-- TODO : DatePicker 연산해서 기간 도출 -->
					<td><input type="text" name="iptPeriod" id="fromTo" value="" readonly placeholder="기간" /></td>
					<td>
						<button type="button" class="btn btn-danger"><i class="fa fa-minus"></i></button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<tr>
			<td colspan="8">
				<input type="button" name="btn_add_tbody" value="추가">
				<input type="submit" name="btn_submit_tbody" value="저장">
				<input type="reset" name="btn_reset_tbody" value="수정취소">
			</td>
		</tr>
	</table>
</form>



<%@ include file="../recCrr/recCrr.jsp" %>
	
