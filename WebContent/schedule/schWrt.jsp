<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp" %>
<%@ include file="/setting/design_setting_upper.jsp" %>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>  
<!DOCTYPE html>
<script type="text/javascript">
//<!--
	$(document).ready(function(){
	    $('input.timepicker').timepicker({'timeFormat': 'HH:mm'});
	});
//-->
</script>

<h2>${param.year}년 ${param.month+1}월 ${param.date}일</h2>
<h3>${param.day}요일</h3><br><br>
<h2>새 스케줄 만들기</h2>
<form action="schWrt.do" autocomplete="off" method="post">
	<table border="1">
		<tr>
			<th>시간선택하기</th>
			<td><input name="schstartTime" class="timepicker">~<input name="schendTime" class="timepicker">
			<input type="hidden" name="year" value="${param.year}">
			<input type="hidden" name="month" value="${param.month+1}">
			<input type="hidden" name="date" value="${param.date}">
			</td>
		</tr>
		<tr>
			<th>작성자ID</th>
			<td colspan="2"><input name="jobpId" value="${sessionScope.memid}" readonly></td> 
		</tr>
		<tr>
			<th>작성자이름</th>
			<td colspan="2"><input name="jobpName" value="${sessionScope.memName}" readonly></td> 
		</tr>
		<tr>
			<th>세부내용</th>
			<td colspan="2"><textarea name="schContent" rows="5" cols="50"></textarea></td>
		<tr>
			<th colspan="3">
				<input type="submit" value="작성">
			</th>
		</tr>
	</table>
</form>



<%@ include file="/setting/design_setting_footer.jsp" %>