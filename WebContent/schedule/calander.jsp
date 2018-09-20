<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../setting/setting.jsp" %>
<script src="${js}sch.js"></script>
<script type="text/javascript">
	//<!--
	var year;
	var month; // 스케줄 땡겨오기위해서 변수 저장.
	var lastday;
	$(document).ready(
		function(){
			calendar();
			getSchedule();
			setInterval("getSchedule()",3000);
		}		
	)
	//-->
</script>
<div id="cal">
	<div id="date"></div>
	<table id="calcal" border="1">
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
	</table>
</div>
<div id="rst"></div>