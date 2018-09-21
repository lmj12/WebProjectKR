<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../setting/setting.jsp" %>
<script type="text/javascript">
	//<!--
	var cnt = 1;
	var rcnt = 6;
	$(document).ready(
		function(){
				makeTable();			
			
		}		
	)
	function makeTable(){
		var tabstr = "";
		// FIXME rowspan2칸씩 적용됨.
		tabstr ="<table border='1' id='tb"+ cnt++ +"'><tr><th rowspan='10'>식장</th><th>업무</th><th>지원자</th></tr>"
		for (var i=1; i<6; i++){
				tabstr += "<tr><td><select id='r"+ i +"'><option value='1'>팀장</option><option value='2'>스캔</option><option value='3'>"
				+ "예도</option><option value='4'>안내</option><option value='5'>경호</option></select></td><td><input type='text'readonly></td><tr>"
		}
		tabstr += "</table>"
		document.getElementById('s').innerHTML = tabstr;
		
	}
	//-->
</script>

<div id="s">

</div>