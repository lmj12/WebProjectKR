<%@page import="member.jobseeker.JobSeekerDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp" %>
<h2>구직자 정보수정페이지</h2>



<script type="text/javascript">
	//<!--  
	$(document).ready(
		function(){			
			$('input[name=jbskPasswd]').on(
				'keyup',
				function(event){
					var jbskPasswd = $('input[name=jbskPasswd]').val();
					if(jbskPasswd){
						if(isNaN(jbskPasswd)){
							$('.passwdresult').text('사용할 수 있습니다');
						}else{
							$('.passwdresult').text('사용할 수 없습니다.');
						}
					}
					$('input[name=jbskPasswd]').val()
				}
			);
			
			//비밀번호가 같으면 사용할 수 있다
			//다르면 사용할 수 없다
			$('input[name=jbskRePasswd]').on(
					'keyup',
					function(event){
			var jbskRePasswd = $('input[name=jbskRePasswd]').val();
			if(jbskRepasswd){
				if($('input[name=jbskPasswd]').val()== $('input[name=jbskRePasswd]').val()){
					$('.repasswdresult').text('사용할 수 있다');
				}else{
					$('.repasswdresult').text('사용할 수 없다');
				}
			}
			$('input[name=jbskRePasswd]').val()
					}
					);
			
			//전화번호 - 없이 입력하도록
			$('input[name=jbskTel]').on(
					'keyup',
					function(event){
						var tel = $('input[name=jbskTel]').val();
						if(tel){
							if($('input[name=jbskTel]').val().indexOf('-')!=-1){
								$('.telresult').text("사용할 수 없다");
							}else{
								$('.telresult').text("사용할 수 있다");
							}
						}
						$('input[name=jbskTel]').val()
					}
			);
					
		}		
	);
	//-->
</script>

<%
		JobSeekerDataBean jbskDto = ( JobSeekerDataBean) request.getAttribute( "jbskDto" );
		%>

<form name="inputform" method="post" action="jbskMod.do">
<table border="1">
	<tr>
		<th>아이디</th>
		<td> ${jbskDto.getJbskId()} </td>
	
	</tr>
	
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="jbskPasswd"></td>
		<td width="100" class="passwdresult">비밀번호를 입력하세요</td>	
	</tr>
	<tr>
		<th>비밀번호확인</th>
		<td><input type="password" name="jbskRePasswd"></td>
		<td class="repasswdresult">같은 비밀번호를 입력하세요</td>	
	</tr>
	<tr>
		<th>전화번호</th>
		<td> <input type="text" name="jbskTel"></td>
		<td class="telresult"><input type="button" value="인증"></td>
	</tr>
	
	<tr>
		<th colspan="2">
			<input type="submit" value="가입">
			<input type="reset" value="취소" onclick="location='mypage.do'">			
		</th>
	</tr>
	
</table>
</form>