<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.js"></script>  
<!DOCTYPE html>
<script type="text/javascript">
//<!--
	$(document).ready(function(){
	    $('#st').timepicker({
	    'timeFormat': 'HH:mm',
	    change : function(time){
	    	var et = $("#et").timepicker();
	    	var etime = $("#et").val();
	    	if(etime){
	    		ehour = etime.split(":")[0];
	    		emin = etime.split(":")[1];
				if(time.getHours() >= ehour){
					if(time.getMinutes()>=emin){
					alert("선택된 시간이 종료 예정 시간보다 늦습니다. 다시 선택해주세요")
					$(this).val('');
					}
				}
	    	} 
		}
	    });
	});
	
	$(document).ready(function(){
	    $('#et').timepicker({
	    'timeFormat': 'HH:mm',
	    change : function(time){
	    	var st = $("#st").timepicker();
	    	var stime = $("#st").val();
	    	if(stime){
	    		shour = stime.split(":")[0];
	    		smin = stime.split(":")[1];
				if(time.getHours() <= shour){
					if(time.getMinutes()<=smin){
					alert("선택된 시간이 시작 예정 시간보다 빠릅니다. 다시 선택해주세요.")
					$(this).val('');
					}
				}
	    	} 
		}
	    });
	});
	
	function inputCk(){
		var stime = $("#st").val();
		var etime = $("#et").val();
		if(! stime ||  stime==''){
			alert("시작시간을 입력해주세요")
			return false;
		} else if (! etime ||  etime==''){
			alert("종료시간을 입력해주세요")
			return false;
		}
		
	}

//-->
</script>

<h2>${param.year}년 ${param.month+1}월 ${param.date}일</h2>
<h3>${param.day}요일</h3><br><br>
<h2>새 스케줄 만들기</h2>
<form action="schWrt.do" autocomplete="off" method="post" onsubmit="return inputCk()">
	<table border="1">
		<tr>
			<th>시간선택하기</th>
			<td><input name="schstartTime" id="st" class="timepicker">~<input name="schendTime"  id="et" class="timepicker">
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