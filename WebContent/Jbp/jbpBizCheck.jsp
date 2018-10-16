<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp" %>

<!DOCTYPE html>
<table border="1">
	<thead>
		<tr>
			<td> 사업자번호를 입력해주세요 </td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>
				<input type="text" name="jbpNumber" />
				<input type="button" name="checkBizId" value="확인" />
			</td>
		</tr>
	</tbody>
</table>
<div id="bizList" class="container">

</div>

<script type="text/javascript">
//<!--
	$(document).ready(
		function(){
			// FIXME : 개발용 사업자번호 자동입력
			$('input:text[name=jbpNumber]').val('1078614075');
		
			$('input:button[name=checkBizID]').on(
				'click',
				function checkBizID() {
					alert()
					if( !$('input:text[name=jbpNumber]').val() ){
						alert("사업자번호를 입력해주세요");
						return false;
					} else {
						var bizID = $('input:text[name=jbpNumber]').val();
					    var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1);
					    var tmpBizID, i, chkSum=0, c2, remander;
					    var result;
					    
					    bizID = bizID.replace(/-/gi,'');	// 들어있는 - 를 모두 빈칸으로 치환함
					 
					    for (i=0; i<=7; i++) {
					        chkSum += checkID[i] * bizID.charAt(i);
					    }
					 
					    c2 = "0" + (checkID[8] * bizID.charAt(8));
					    c2 = c2.substring(c2.length - 2, c2.length);
					    chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1));
					    remander = (10 - (chkSum % 10)) % 10 ;
					 
					    if (Math.floor(bizID.charAt(9)) == remander) {
					    	alert('사업자등록번호 형식에 맞는 번호입니다');
					    	// TODO : 맞는 사업자 등록번호일 시, bizID 앞 6자리 파싱해서 공공데이터 포털날리고
					    	// 폼 만들어서 선택하게끔
					    	var bizName = $('input:text[name=jobpCn]').val();
					    	var parseBizID = bizID.substring(0, 6);
					    	
					    	bizListCall = function() {
					    		var serviceKey = 'zHRNYJ97QejMrVzKWNS6Hmc8j9Gd8oJ7p4LKd3MfUsTbmSI%2F2v3inaBqZm%2FTDmxvJPYg7gQ1QOEfbnPWE%2FRQvg%3D%3D';
								var jbpName = $('input:text[name=jobpCn]').val();
								var jbpNumber = parseBizID;
								var url = "http://apis.data.go.kr/B552015/NpsBplcInfoInqireService/getBassInfoSearch";
								
								$.ajax(
										{
											type : 'GET',
											url : url,
											data : {
												serviceKey : serviceKey,
											//	wkpl_nm : jbpName,
												bzowr_rgst_no : jbpNumber,
											},
											dataType : 'json',
											success : function(data){
												$('.bizList').last()
												.html( $(data).find('body').text() );
												
											},
											error : function(e){
												$('.bizList').val(e.message);
											}
										}	
								);
					    	}
					    	
					    	result = true ; // OK!
					    } else {
					    	alert('사업자등록번호 형식에 맞지 않습니다');
					        result = false;
					    }
					    return result;
					}
				}
			);	// 사업자번호 유효성 검사
		}		
	);
//-->
</script>

