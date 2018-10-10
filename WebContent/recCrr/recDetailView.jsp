<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp"%>
<!DOCTYPE html>
<script type="text/javascript">
	//<!--
	var jbskBd = '${recCrrDto.jbskBd}'
	var date = new Date(jbskBd);
	var bd = date.getFullYear() + "/" + date.getMonth() + "/" + date.getDate();
 	var age = new Date().getFullYear() - date.getFullYear();
	$(document).ready(function(){
		$("#age").text(age);
		$("#bd").text(bd);
	});
		
	
	//-->
</script>
<br>
<br>
<div id="resume" style="margin: 7px">
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
	<br><br>
	<h4><b>자기소개서</b></h4><br>
	<textarea id="jbskIt" rows="10" cols="65">${recCrrDto.jbskIt}</textarea>
<div id=""></div>
</div>