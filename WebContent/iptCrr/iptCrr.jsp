<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp"%>
<!DOCTYPE html>
<h2> 이력서제작 및 경력입력 </h2>
<!-- 
체크 후 입력경력사항이
	있으면 / 내용 출력, 수정 버튼, 삭제 버튼
	없으면 / 입력경력이 없다 출력 ,입력경력사항 쓰기 버튼
 -->
<c:if test="${iptListCnt eq 0}">
	<h2>표시할 내용이 없습니다.</h2>
	입력 버튼

</c:if>
<c:if test="${iptListCnt gt 0}">
<h2>입력된 경력사항이 있습니다.</h2>
<table border="1">
	<tr>
		<td rowspan="5">사진</td>
		<th colspan="4"> 이 력 서 </th>
	</tr>
	<tr>
		<td rowspan="2">성명</td>			<!-- jbskName -->
		<td rowspan="2"><input type="text" name="jbskName" placeholder="${jbskName}"></td>	
		<td colspan="2">생년월일</td>		<!-- jbskBd -->
	</tr>
	<tr>
		<td colspan="2"><input type="text" name="jbskBd" placeholder="${jbskBd}"></td>
	</tr>
	<tr>	
		<td>성별</td>			<!-- jbskGender -->
		<td><input type="text" name="jbskGender" placeholder="${jbskGender}"></td>
		<td>연락처</td>		<!-- jbskTel -->
		<td><input type="text" name="jbskTel" placeholder="${jbskTel}"></td>
	</tr>
	<tr>
		<td>주소</td>			<!-- jbskAdd1+2+3 -->
		<td colspan="3"><input type="text" name="jbskAddress" placeholder="${jbskAddress}"></td>
	</tr>
</table>

<%@ include file="../recCrr/recCrr.jsp" %>
	
</c:if>