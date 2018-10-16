<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/setting/setting.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ include file="/setting/design_setting_upper.jsp" %>

  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>  

<script src="${js}recModSet.js"></script>
<h2>공고수정페이지</h2>
<script type="text/javascript">


	var num = 0;
	var cnt = 0;
	var posList = []
	$(document).ready(function(){
		for (var i=0; i<posList.length; i++){
			var posId = posList[i]
			adda()
			$("#s"+cnt).val(posId).prop("seleted", true)
		}
	})
	$( function() {
	    $( "#datepicker" ).datepicker({minDate: 0});
	    $("#timepicker").timepicker({'timeFormat': 'HH:mm'});
	  } );
</script>
<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		alert( modifyerror );
		//-->
	</script>		
	<meta http-equiv="refresh" content="0; url=recList.do?pageNum=${pageNum}">
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="recList.do?pageNum=${pageNum}"/>
</c:if>	
<body onload="refocus()">
<form name="recMod" method="post" action="recMod.do" onsubmit="return recheck()">
<table border="1">
<input type="hidden" name="jobpId" value="${recDto.jobpId}">
<input type="hidden" name="recId" value="${recDto.recId}">
	<tr>
		<th>공고번호  </th>
		<td> ${recDto.recId} </td>
	
		
		<th> 종료일</th>
		<td> <p>날짜: <input type="text" name="End" id="datepicker"><br><br>
			시간 : <input type="text" name="EndTime" id="timepicker"></p></td>
	</tr>
	<tr>
		<tr>
		<th>공고 직무 </th>
		<th id="posx" colspan="3"> 
	
		<c:forEach var="recruitDto" items="${recruitDto}">
			<script type="text/javascript">
				//<!--
				posList.push(${recruitDto.posId})
				//-->
			</script>
		</c:forEach>
			 <br><br> 
			  <input type="button" value="추가" name="click" style="float:right;" onclick="return adda()"> 
			  <input type="hidden" id="conval" name="conval" value="0">
			  <input type="hidden" id='id' name="id">	
		
			 </th>
			</tr>			
	
	<tr>
		<th colspan="8">공고내용</th>	
	
	</tr>
	<tr>
		<td colspan="8"> <textarea name="reccontent" placeholder="${recDto.reccontent}" rows="10" cols="80"></textarea></td>
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
		<td colspan="7"> <input type="text" name="recSite" id="recSite" placeholder="${recDto.recSite}">					
					<span id="guide" style="color:#999"></span>
						<input type="button" value="주소찾기" onclick="searchPostcode()">
						<input type="hidden" value="0" id="ok"></td>		
	</tr>
	<tr>
    		<th colspan="8">
    			<input class="inputbutton" name="write" type="submit" value="공고수정">
    			<input class="inputbutton" type="reset" value="공고수정 취소">
    			<input class="inputbutton" type="button" value="목록으로" onclick ="location='recList.do'">
    		</th>
    </tr>	


</table>
</form>
</body>

<%@ include file="/setting/design_setting_footer.jsp" %>