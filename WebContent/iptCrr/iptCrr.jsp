<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="iptcareer.IptCrrDBBean"%>
<%@ include file="../setting/setting.jsp"%>
<!DOCTYPE html>
<h2> 이력서제작 및 경력입력 </h2>
<!-- 
체크 후 입력경력사항이
	있으면 / 내용 출력, 수정 버튼, 삭제 버튼
	없으면 / 입력경력이 없다 출력 ,입력경력사항 쓰기 버튼
 -->

<table border="1">
	<tr>
		<td rowspan="5">사진</td>
		<th colspan="4"> 이 력 서 </th>
	</tr>
	<tr>
		<td rowspan="2">성명</td>			<!-- jbskName -->
		<td rowspan="2"><input type="text" name="jbskName" value="${jbskName}" readonly></td>	
		<td colspan="2">생년월일</td>		<!-- jbskBd -->
	</tr>
	<tr>
		<!-- FIXME : 생년월일 SimpleDateFormat 적용필요 -->
		<td colspan="2"><input type="text" name="jbskBd" value="${jbskBd}" readonly></td>
	</tr>
	<tr>	
		<td>성별</td>			<!-- jbskGender -->
		<td><input type="text" name="jbskGender" value="${jbskGender}" readonly></td>
		<td>연락처</td>		<!-- jbskTel -->
		<td><input type="text" name="jbskTel" value="${jbskTel}" readonly></td>
	</tr>
	<tr>
		<td>주소</td>			<!-- jbskAdd1+2+3 -->
		<td colspan="3"><input type="text" name="jbskAddress" value="${jbskAddress}" readonly></td>
	</tr>
</table>



<c:if test="${iptListCnt eq 0}">
	<h2>입력된 경력사항이 없습니다.</h2>
	입력 버튼

</c:if>
<c:if test="${iptListCnt gt 0}">
<script src="${js}iptCrr.js"></script>
<h2>iptCrr 내용입니다</h2>

<form>
	<!-- listCnt=iptid IPTCOMPANY	IPTWH	IPTSTART	IPTEND	IPTPOS	IPTPERIOD -->
	<table border="1">	
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
				<tr>
					<td width="20"><input type="text" placeholder="번호" readonly /></td>
					<td><input type="text" placeholder="업체명" value="${iptDto.iptCompany}" /></td>
					<td><input type="text" placeholder="근무지" value="${iptDto.iptWh}" /></td>
					<td><fmt:formatDate value="${iptDto.iptStart}" pattern="yyyy년 MM월 dd일"/></td>
					<td><fmt:formatDate value="${iptDto.iptEnd}" pattern="yyyy년 MM월 dd일"/></td>
					<td>
						<input type="text" placeholder="근무직무" value="${iptDto.iptPos}" />
					<!-- TODO : iptCrr 근무직무 / 추후 이런식으로 바꾸고 싶음 	
						<select class="form-control" id="sel1">
						    <option value="1">팀장</option>
						    <option value="2">스캔</option>
						    <option value="3">예도</option>
						    <option value="4">안내</option>
						    <option value="5">경호</option>
						    <option value="6">기타</option>
						  </select> -->
					</td>
					<td><input type="text" placeholder="기간" value="${iptDto.iptEnd}-${iptDto.iptStart}" readonly /></td>
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
</c:if>

<%@ include file="../recCrr/recCrr.jsp" %>
	
