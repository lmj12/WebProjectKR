
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="./js/jbskReg.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="${js}time.js"></script>
<link rel="stylesheet" href="${js}timepicker.css">
<script src="${js}recSet.js"></script>
<h2>공고 등록페이지</h2>
<script type="text/javascript">
	var pos = '${pos}';
	var st = ${st}
	var cnt = 0 ;
	$(document).ready(function(){
		makeRec();
	})
	
	function makeRec(){
		var sday = new Date(st).format("dd/MM/yyyy");
		var stime = new Date(st).format("hh:mma/p")
		$("#date").val(sday)
		$("#time").val(stime)
		var posList = pos.split(",");
		for (var i =0; i<posList.length; i++){
			add()
			$("#s"+(i+1)).val(posList[i]).prop("selected", true);
		}
	}
	
</script>
<c:if test="${result eq 0}">
	<script type="text/javascript">
	
		<!--
		erroralert('inserterror');
		//-->
	</script>
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="mypage.do"/>		
</c:if>
<form name="recwrite" method="post" action="recWrt.do" autocomplete="off" onsubmit="return writecheck()">
<table border="1">
<input type="hidden" name="jobpId" value="${jbpDto.jobpId}">
	<tr>
		<th> 종료일</th>
		<td><p>날짜: <input type="text" name="recEnd" id="date" readonly><br><br>
			시간 : <input type="text" name="recEndTime" id="time" readonly></p></td>           
	</tr>
	
	
	<tr>
		<th>공고 직무 </th>
		<td id="addposx"> 		
			<input type="button" value="추가" name="addpos" style="float:right;" onclick="return add()"> 
			<input type="hidden" name="confirm" value="0">
			<input type="hidden" id='id' name="id">
		</td>
	</tr>
	<tr>
		<th colspan="8">공고내용</th>	
	
	</tr>
	<tr>
		<td colspan="8"> <textarea name="reccontent" rows="10" cols="80"></textarea></td>
	</tr>
	<tr> 
		<th> 사업장 이름 </th>
		<td colspan="7"> <input type="text" name="jbpCn" value="${jbpDto.jobpCn}" readonly>		</td>
	</tr>
	<tr>
		<th>사업자 번호 </th>
		<td colspan="7"> <input type="text" name="jbpBnp" value="${jbpDto.jobpBno}" readonly>	</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="7"> <input type="text" name="recSite" id="recSite" placeholder="주소" readonly>					
					<span id="guide" style="color:#999"></span>
						<input type="button" value="주소찾기" onclick="searchPostcode()">
						<input type="hidden" id="ok" value="0"></td>			
	</tr>
	<tr>
    		<th colspan="8">
    			<input class="inputbutton" name="write" type="submit" value="공고작성">
    			<input class="inputbutton" type="reset" value="공고작성 취소">
    			<input class="inputbutton" type="button" value="목록으로" onclick ="location='recList.do'">
    		</th>
    </tr>	


</table>
</form>

<%@ include file="/setting/design_setting_footer.jsp" %>