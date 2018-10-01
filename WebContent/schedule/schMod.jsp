<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp" %>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>  
<!DOCTYPE html>
<script type="text/javascript">
//<!--	
	var stime = '${stime}'
	var s = Number(stime);
	var st= new Date(s);
	
	var etime = '${etime}'
	var e = Number(etime);
	var et = new Date(e);
	
	$(document).ready(function(){
	    $('input.timepicker').timepicker({'timeFormat': 'HH:mm'});
	    $("#st").timepicker('setTime',st);
	    $("#et").timepicker('setTime',et);
	});
//-->
</script>

<h2>${year}년 ${month}월 ${date}일</h2>
<h3>${day}요일</h3><br><br>
<h2>스케줄 수정하기</h2>
<form action="schModCon.do" autocomplete="off" method="post">
	<table border="1">
		<tr>
			<th>시간선택하기</th>
			<td><input name="schstartTime" id="st" class="timepicker">~<input name="schendTime" id="et" class="timepicker">
			<input type="hidden" name="schId" value="${schId}">
			<input type="hidden" name="year" value="${year}">
			<input type="hidden" name="month" value="${month}">
			<input type="hidden" name="date" value="${date}">
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
			<td colspan="2"><textarea name="schContent" rows="5" cols="50" >${content}</textarea></td>
		<tr>
			<th colspan="3">
				<input type="submit" value="수정">
			</th>
		</tr>
	</table>
</form>
