<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>

<script type="text/javascript">
   //<!--
   $(document).ready(
      function(){
    	  $("#lgType").on(
    		"mouseup",
    		function(){
    			var ck = $("#lgType option:selected").val();
    			if (ck == 1){
    				$("#lgnform").attr("action","jbpLgn.do");
    			} else if (ck==2){
    				$("#lgnform").attr("action","jbskLgn.do");
    			} else {
    				$("#lgnform").attr("action","admLgn.do");
    			}
    		}
    	  )
      }
   )
   //-->
</script>
<h2>로그인</h2>
<select id="lgType">
	<option value="1">구인자</option>
	<option value="2">구직자</option>
	<option value="3">관리자</option>
</select>
<form method="post" action="jbpLgn.do" name="loginform" id="lgnform">
<table border="1">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id" autofocus placeholder="필수입력"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="passwd" placeholder="필수입력"></td>
	</tr>
	
	<tr>
		<th colspan="2">
			<input type="submit" value="로그인">
			<input type="reset" value="취소" onclick="location='main.do'">			
		</th>
	</tr>	
</table>
</form>  



<%@ include file="/setting/design_setting_footer.jsp" %>