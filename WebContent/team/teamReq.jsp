<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>
<!DOCTYPE html>
<script type="text/javascript">
	//<!--
	function jbskGet() {
		var jbskId = $("#jbskId").val();
		$.ajax({
		    method : "POST",
		    url : "ajaxJbskGet.do",
	    	cache : false,
			async : false,
			data : {
				jbskId : jbskId,
			},
			datatype : "json",
			success : function(data){
				var user = $.parseJSON(data);
				if(data){
					var str = ''
					str = "<table><tr><th>ID</th><th>이름</th><th>요청 보내기</th></tr>"
					str += "<tr><td>"+user.jbskId+"</td><td>"+user.jbskName+"</td><td><input type='button' onclick='teamReq()'></td></tr></table>"
					$("#rst").html(str);
				} else {
					$("#rst").text("검색 결과가 없습니다. 아이디를 다시 확인해 주세요.")
				}
			}
		})
		
	}
	
	//-->
</script>
<div class="container">
	<h4>팀 가입 요청을 보낼 아이디를 입력하세요.</h4>
	<input type="text" id="jbskId" > <input type="button" value="검색" onclick="jbskGet()">
	<br>
	<div id="rst" >
	</div>
</div>
<%@ include file="/setting/design_setting_footer.jsp" %>