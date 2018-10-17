<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp" %>

<!DOCTYPE html>
<script type="text/javascript">
//<!--
	$(function(){
			// FIXME : 개발용 사업자번호 자동입력
			$('input[name=wkpl_nm]').val('lg');
			$('input[name=bzowr_rgst_no]').val('1078614075');
		
			$('#btn-checkBizId').on(
				'click',
				function checkBizID() {
					if( !$('input[name=bzowr_rgst_no]').val() ){
						alert("사업자번호를 입력해주세요");
						return false;
					} else {
						var bizID = $('input[name=bzowr_rgst_no]').val();
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
					    	var bizName = $('wkpl_nm').val();
					    	var parseBizID = bizID.substring(0, 6);
					    	
					    	$.ajax(
									{
										type : 'GET',
										url : 'jbpPublicCheck.do',
										data : {
											wkpl_nm : bizName,
											bzowr_rgst_no : parseBizID,
										},
										dataType : 'xml',
										success: function(msg){
							            	alert('성공')
							            },
										error : function(request,status,error){
										    $('#bizList')
									    		.last()
									    		.html("code : "+request.status+"<br>"
								    				+"message : "+request.responseText+"<br>"
								    				+"error : "+$(error).find('errMsg').html());
										}
									}
							);
					    	
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

<div class="container">
	<form>
	<table border="1">
		<thead>
			<tr>
				<th colspan="2"> 사업자번호를 입력해주세요 </td>
			</tr>
		</thead>
		<tbody id="t">
			<tr>
				<td>
					업체명
				</td>
				<td>
					<input type="text" id="wkpl_nm" name="wkpl_nm">
				</td>
			</tr>
			<tr>
				<td>
					사업자번호
				</td>
				<td>
					<input type="text" id="bzowr_rgst_no" name="bzowr_rgst_no" maxlength="10">
					<button id="btn-checkBizId" name="checkBizId">확인</button>
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	<div id="bizList" class="container">
	
	</div>
</div>


