<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp"%>
	<!-- 구직자 Daum Api 주소 불러오기 -->
	<script src="${js}jbskRegJS.js"></script>

<h2>구인자 회원가입 페이지</h2>

<script type="text/javascript">
	//<!--  
	$(document).ready(
		function(){
			$('input[name=jobpId]').on(
				'keyup',
				function(event){
					var jobpId = $('input[name=jobpId]').val();
					var keyVal = $(this).val();
					if(jobpId==""){
						$('.idresult').text("아이디를 입력하지 않았습니다.");
					} else if (65 > keyVal && keyVal > 90) {
						
					    $(this).val(inputVal.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g,''));
						$('.idresult').text("입력할 수 없는 값입니다..");	
					} else if($('input[name=jobpId]').val().length<4|| $('input[name=jobpId]').val().length>15){
						$('.idresult').text("아이디를 4~15자까지 입력해주세요.");
					}else if( jobpId){
						$.ajax({
							type : "POST",
							data : {
								jobpId : jobpId 
							},
							url : 'Jbp/idcheck.jsp',
							dataType : 'xml',
							success : function(data){								
								$('.idresult').text($(data).find('message').text());
							},
							error : function(e){
								$('.idresult').text(e.message);
							}
						});
					}
					
				}
			);
			
			$('input[name=jobpPasswd]').on(
				'keyup',
				function(event){
					var jobpPasswd = $('input[name=jobpPasswd]').val();
					if(jobpPasswd){
						if(isNaN(jobpPasswd)){
							$('.passwdresult').text('사용할 수 있습니다');
						}else{
							$('.passwdresult').text('사용할 수 없습니다.');
						}
					}
					$('input[name=jobpPasswd]').val()
				}
			);
			
			//비밀번호가 같으면 사용할 수 있다
			//다르면 사용할 수 없다
			$('input[name=rejobpPasswd]').on(
					'keyup',
					function(event){
			var repasswd = $('input[name=rejobpPasswd]').val();
			if(repasswd){
				if($('input[name=jobpPasswd]').val()== $('input[name=rejobpPasswd]').val()){
					$('.repasswdresult').text('사용할 수 있다');
				}else{
					$('.repasswdresult').text('사용할 수 없다');
				}
			}
			$('input[name=rejobpPasswd]').val()
					}
					);
			
			//전화번호 - 없이 입력하도록
			$('input[name=jobpTel]').on(
					'keyup',
					function(event){
						var tel = $('input[name=jobpTel]').val();
						if(tel){
							if($('input[name=jobpTel]').val().indexOf('-')!=-1){
								$('.telresult').text("사용할 수 없다");
							}else{
								$('.telresult').text("사용할 수 있다");
							}
						}
						$('input[name=jobpTel]').val()
					}
			);	
			
			$('input[name=jobpId]').on(
				'keyup',
				function(event){
					var jobpId = $('input[name=jobpId]').val();
					
				}
			);
			
			$('input[name=jobpPasswd]').on(
				'keyup',
				function(event){
					if($('input[name=jobpPasswd]').val()==""){
						$('.passwdresult').text("비밀번호를 입력하지 않았습니다.");
					}
					if($('input[name=jobpPasswd]').val().length<6|| $('input[name=jobpPasswd]').val().length>15){
						$('.passwdresult').text("비밀번호를 6~15자까지 입력해주세요.");
					}
				
					
				
				}
			);
					
		}		
	);
	function fn_press_han(obj){
	 if (event.keyCode==8|| event.keyCode ==9 || event.keyCode ==37 || 
				event.keyCode==39 || event.keyCode ==46) {
		    obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g,'');
			$('.idresult').text("입력할 수 없는 값입니다..");	
	 	}
	}
	//-->
</script>


<form name="inputform" action="jbpReg.do" method="post">
<table border="1">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="jobpId" 
		 style="ime-mode:disabled;"/></td>
		<td width="300" class="idresult">아이디를 4~15자까지 입력하세요</td>	
	</tr>
	
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="jobpPasswd"></td>
		<td width="100" class="passwdresult">비밀번호를 6~15자까지 입력하세요</td>	
	</tr>
	<tr>
		<th>비밀번호확인</th>
		<td><input type="password" name="rejobpPasswd"></td>
		<td class="repasswdresult">같은 비밀번호를 입력하세요</td>	
	</tr>
	
	<tr>
		<th>사업자번호</th>
		<td><input type="text" name="jobpBno"></td>
		<td><input type="button" name="checkBizID" value="확인"></td>
	</tr>
	<tr>
		<th>업체명</th>
		<td> <input type="text" name="jobpCn"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td> <input type="text" name="jobpTel"></td>
		<td class="telresult">'-'없이 입력하세요<input type="button" value="인증"></td>
	</tr>
	
	<tr>
		<th colspan="2">
			<input type="submit" value="가입">
			<input type="reset" value="취소" onclick="location='main.do'">			
		</th>
	</tr>
	
	
</table>
</form>

