<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>
<div class="container">
<!DOCTYPE html>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	//<!--
	var estId = ${estId};
	$(document).ready(
		function(){
			if(estId!=0){
				view()
			}
			
	})
	
	function view(){
		var per = ${performance};
		var ont = ${ontime};
		var att = ${attitude};
		$("#p"+per).attr('checked', 'checked');
		$("#t"+ont).attr('checked', 'checked');
		$("#a"+att).attr('checked', 'checked');
	}
	
	function toList(){
		location.replace("estList.do?recId="+${recId})
	}
	
	function estCheck(){
		
	}
	//-->
</script>
<c:if test="${sessionScope.memType ne 1}">	<!--  구직자회원이 아니면  -->
	<br>
	<div id="resume" style="margin: 7px">
		<table border='1' style="float: left; margin-right: 7px;" >
			<tr>
				<th height="150" width="180"><img src="./setting/image/upload/${jbskPic}" width="140" height="180" /></th>
			</tr>
		</table>
		<br>
		<table border='1' id="jbsk">
			<tr>
				<th>성 명</th><td colspan="3"  width="250">${jbskName}</td>
			</tr>
			<tr>
				<th>아 이 디 </th><td colspan="3">${jbskId}</td>
			</tr>
			<tr>
				<th>성 별</th><td>남</td><th>수 행 직 무</th>
			<c:if test="${posId == 1}">
				<td>팀 장</td>
			</c:if>
			<c:if test="${posId == 2}">
				<td>스 캔</td>
			</c:if>
			<c:if test="${posId == 3}">
				<td>예 도</td>
			</c:if>
			<c:if test="${posId == 4}">
				<td>안 내</td>
			</c:if>
			<c:if test="${posId == 5}">
				<td>경 호</td>
			</c:if>
			<c:if test="${posId == 6}">
				<td>기 타</td>
			</c:if>
			</tr>
		</table>
	</div>
	<br><br><br><br>
	<c:if test="${estId == 0}">
		<form method="post" action="estWrt.do" name="estForm" onsubmit="return estCheck()"> 
			<table border='1'>	<!-- TODO : hidden으로 지원이력 ID저장할 필요 존재. -->
				<tr><th><input type="hidden" name="recCrrId" value="${recCrrId}"><input type="hidden" name="recId" value="${recId}">평가사항</th><th colspan='5'>점수</th></tr>
				<tr><th>업무이해능력 </th><th><img src='./setting/image/estimate/1.png' height='90' width='90'><br><input type="radio"  name='performance' value="1"></th><th><img src='./setting/image/estimate/2.png' height='90' width='90'><br><input type="radio" name='performance' value="2"></th>
				<th><img src='./setting/image/estimate/3.png' height='90' width='90'><br><input type="radio" name='performance' value="3" ></th><th><img src='./setting/image/estimate/4.png' height='90' width='90'><br><input type="radio" name='performance' value="4"></th><th><img src='./setting/image/estimate/5.png' height='90' width='90'><br><input type="radio" name='performance' value="5"></th></tr>
				<tr><th>시간준수 </th><th><img src='./setting/image/estimate/1.png' height='90' width='90'><br><input type="radio"  name='ontime' value="1"></th><th><img src='./setting/image/estimate/2.png' height='90' width='90'><br><input type="radio" name='ontime' value="2"></th>
				<th><img src='./setting/image/estimate/3.png' height='90' width='90'><br><input type="radio" name='ontime' value="3" ></th><th><img src='./setting/image/estimate/4.png' height='90' width='90'><br><input type="radio" name='ontime' value="4"></th><th><img src='./setting/image/estimate/5.png' height='90' width='90'><br><input type="radio" name='ontime' value="5"></th></tr>
				<tr><th>자세 및 태도 </th><th><img src='./setting/image/estimate/1.png' height='90' width='90'><br><input type="radio"  name='attitude' value="1"></th><th><img src='./setting/image/estimate/2.png' height='90' width='90'><br><input type="radio" name='attitude' value="2"></th>
				<th><img src='./setting/image/estimate/3.png' height='90' width='90'><br><input type="radio" name='attitude' value="3" ></th><th><img src='./setting/image/estimate/4.png' height='90' width='90'><br><input type="radio" name='attitude' value="4"></th><th><img src='./setting/image/estimate/5.png' height='90' width='90'><br><input type="radio" name='attitude' value="5"></th></tr>
				<tr><th colspan='6'><input type="submit" value="제출"><input type="reset" value="다시하기"><input type="button" value="리스트로" onclick="toList()"></th></tr>
			</table>
		</form>
	</c:if>
	<c:if test="${estId != 0}">
		<table border='1'>	<!-- TODO : hidden으로 지원이력 ID저장할 필요 존재. -->
			<tr><th>평가사항</th><th colspan='5'>점수</th></tr>
			<tr><th>업무이해능력 </th><th><img src='./setting/image/estimate/1.png' height='90' width='90'><br><input type="radio"  id="p1" name='performance' value="1" disabled="disabled"></th><th><img src='./setting/image/estimate/2.png' height='90' width='90'><br><input type="radio" id="p2" name='performance' value="2" disabled="disabled"></th>
			<th><img src='./setting/image/estimate/3.png' height='90' width='90'><br><input type="radio" name='performance' id="p3" value="3" disabled="disabled"></th><th><img src='./setting/image/estimate/4.png' height='90' width='90'><br><input type="radio" name='performance'  id="p4"value="4" disabled="disabled"></th><th><img src='./setting/image/estimate/5.png' height='90' width='90'><br><input type="radio" name='performance' id="p5" value="5" disabled="disabled"></th></tr>
			<tr><th>시간준수 </th><th><img src='./setting/image/estimate/1.png' height='90' width='90'><br><input type="radio"  id="t1" name='ontime' value="1" disabled="disabled"></th><th><img src='./setting/image/estimate/2.png' height='90' width='90'><br><input type="radio" name='ontime' id="t2" value="2" disabled="disabled"></th>
			<th><img src='./setting/image/estimate/3.png' height='90' width='90'><br><input type="radio"  id="t3" name='ontime' value="3" disabled="disabled"></th><th><img src='./setting/image/estimate/4.png' height='90' width='90'><br><input type="radio" name='ontime' id="t4" value="4" disabled="disabled"></th><th><img src='./setting/image/estimate/5.png' height='90' width='90'><br><input type="radio" name='ontime' value="5" id="t5" disabled="disabled"></th></tr>
			<tr><th>자세 및 태도 </th><th><img src='./setting/image/estimate/1.png' height='90' width='90'><br><input type="radio"  name='attitude' id="a1" value="1" disabled="disabled"></th><th><img src='./setting/image/estimate/2.png' height='90' width='90'><br><input type="radio" id="a2" name='attitude' value="2" disabled="disabled"></th>
			<th><img src='./setting/image/estimate/3.png' height='90' width='90'><br><input type="radio" name='attitude' id="a3" value="3" disabled="disabled"></th><th><img src='./setting/image/estimate/4.png' height='90' width='90'><br><input type="radio" name='attitude' value="4" id="a4" disabled="disabled"></th><th><img src='./setting/image/estimate/5.png' height='90' width='90'><br><input type="radio" name='attitude' value="5" id="a5" disabled="disabled"></th></tr>
			<tr><th colspan='6'><input type="button" value="리스트로" onclick="toList()"></th></tr>
		</table>
	</c:if>
	
</c:if>

<c:if test="${sessionScope.memType eq 1}"> <!--  구직자회원이면 -->
	<script type="text/javascript">	
		//<!--
		errorback("권한이 있는 사용자가 아닙니다.")
		//-->
	</script>
</c:if>

</div>