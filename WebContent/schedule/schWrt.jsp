<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp" %>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>  
<!DOCTYPE html>
<script type="text/javascript">
//<!--
$(document).ready(function(){
	var sttime;
    $('input.timepicker').timepicker({'forceRoundTime': true});
    $('#sttime').on('click', function (){
        $('input.timepicker').timepicker('setTime', day );
    });
});
//-->
</script>

<h2>${param.year}년 ${param.month}월 ${param.date}일</h2>
<h3>${param.day}요일</h3><br><br>
<h2>새 스케줄 만들기</h2>
<form>
	<table>
		<tr>
			<th>시간선택하기</th>
			<td><input id="sttime" class="timepicker"></td>
		</tr>
	</table>
</form>



