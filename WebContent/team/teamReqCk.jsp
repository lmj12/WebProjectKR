<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>
<script type="text/javascript">
	//<!--
	var jbskId = '${sessionScope.memid}';
	var reqck = ${reqTeams};
	$(document).ready(
		function(){
			makeTable();
			${sessionScope.teamReq = 0}
		}
	)
	function makeTable(){
		var tblstr = "<table border='1'><tr><th>초대내역</th><th>확인</th><th>취소</th></tr>"
		for (var i=0; i<reqck.length; i++){
			if(reqck[i].tmStatus==1 || reqck[i].tmStatus=='1'){
				tblstr += "<tr><td>"+reqck[i].jobpCn+"</td><td></td><td></td>"
			} else {
				tblstr += "<tr><td>"+reqck[i].jobpCn+"</td><td><input type='button' value='수락' onclick='reqAssign("+reqck[i].teamId+")'></td><td><input type='button' value='거절' onclick='TeamDel("+reqck[i].teamId+")'></td></tr>"
			}
		}
		tblstr += "</table>"
		$("#rst").html(tblstr);
	}
	function reqAssign(teamId){
		$.ajax({
		    method : "POST",
		    url : "ajaxTeamAssign.do",
	    	cache : false,
			async : false,
			data : {
				teamId : teamId,
				jbskId : jbskId,
			},
			datatype : "text",
			success : function(data){
				if(data==1){
					alert("팀에 가입했습니다..");
					location.href="main.do";
				} else if(data == -1){
					alert("팀 최대인원이 초과되었습니다.");
				} else {
					alert("팀 가입에 실패했습니다.")
				}
			}, error:function(request,status,error){
    		    $("#rst").text("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		})
		
	}
	
	function TeamDel(teamId){
		$.ajax({
		    method : "POST",
		    url : "ajaxTeamExit.do",
	    	cache : false,
			async : false,
			data : {
				teamId : teamId,
				jbskId : jbskId
			},
			datatype : "text",
			success : function(data){
				if(data==1){
					alert("요청을 거절했습니다.");
					location.reload();
				}
			}, error:function(request,status,error){
    		    $("#rst").text("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		})
	}
	//-->
</script>
<h4>팀 초대 확인 페이지</h4>
<div id="rst">
</div>

<%@ include file="/setting/design_setting_footer.jsp" %>