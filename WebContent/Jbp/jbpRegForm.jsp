<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="/JQueryEx/jquery-3.3.1.js"></script>
<h2>구인자 회원가입 페이지</h2>
<script type="text/javascript">
	//<!--  
	$(document).ready(
		function(){
			$('input[name=jobpId]').on(
				'keyup',
				function(event){
					var jobpId = $('input[name=jobpId]').val();
					
					if( jobpId){
						$.ajax({
							type : "POST",
							data : {
								jobpId : jobpId 
							},
							url : 'idcheck.jsp',
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
					
		}		
	);
	//-->
</script>

<body onload="inputfocus()">
<form name="inputform" method="post">
<table border="1">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="jobpId" autofocus></td>
		<td width="300" class="idresult">아이디를 입력하세요</td>	
	</tr>
	
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="jobpPasswd"></td>
		<td width="100" class="passwdresult">비밀번호를 입력하세요</td>	
	</tr>
	<tr>
		<th>비밀번호확인</th>
		<td><input type="password" name="rejobpPasswd"></td>
		<td class="repasswdresult">같은 비밀번호를 입력하세요</td>	
	</tr>
	
	<tr>
		<th>사업자번호</th>
		<td><input type="text" name="jobpBno"></td>
		<td><input type="button" value="확인"></td>
	</tr>
	<tr>
		<th>업체명</th>
		<td> <input type="text" name="jobpCn"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td> <input type="text" name="jobpTel"></td>
		<td><input type="button" value="인증"></td>
	</tr>
	
	<tr>
		<th colspan="2">
			<input type="submit" value="가입">
			<input type="reset" value="취소" onclick="location='main.do'">			
		</th>
	</tr>
	
	
</table>
</form>
</body>