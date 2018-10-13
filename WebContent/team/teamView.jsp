<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>
<!DOCTYPE html>

<h4>나의 팀</h4>
<div id="listd">

</div>

<c:if test="${sessionScope.memType ne 1}">
<br><br>
<h4>승인 대기중인 구직자</h4>
<div id="reql">
</div>


	<br><br>
	<h4>팀 가입 요청을 보낼 아이디를 입력하세요.</h4>
	<input type="text" id="jbskId" > <input type="button" value="검색" onclick="jbskGet()">
	<div id="rst">
	</div>
</c:if>

<script type="text/javascript">
	//<!--
	var teamId = ${sessionScope.teamId};
	var ta = JSON.stringify(${teamlist});
	var tl = JSON.parse(ta);
	
	$(document).ready(
		function(){
			if(tl[0]){
				teamList(tl);
			} else {
				$("#listd").text("팀원이 없습니다.");
			}
			if(${sessionScope.memType} != 1){
				reqList();
			}
		}
	)
			
	
	function teamList(list){
		var tabstr = '';
		tabstr = "<table border='1'><tr><th>ID</th><th>이름</th><th>성별</th><th>생년월일</th><th>전화번호</th>"
		if(${sessionScope.memType} != 1){
			tabstr += "<th>추방</th>"
		}
		tabstr +=	"</tr>"
		for(var i=0; i<list.length; i++ ){
			tabstr += "<tr><td id='t"+i+"'>"+list[i].jbskId+"</td><td>"+list[i].jbskName+"</td>"
			if(list[i].gender =='1'){
				tabstr += "<td>남</td>"
			} else {
				tabstr += "<td>여</td>"
			}
			var date = new Date(Number(list[i].jbskBd));
			tabstr += "<td>"+date.getFullYear()+"년 "+date.getMonth()+"월 "+date.getDate()+"일</td><td>"+list[i].jbskTel+"</td>"
			if(${sessionScope.memType} != 1){
				tabstr += "<td><input type='button' value='추방' onclick='teamExit(this)'></td></tr>"
			}
			tabstr += "</table>"
		}
		$("#listd").html(tabstr);
	}
	
	function jbskGet() {	//검색용 펑션
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
					str = "<table border='1'><tr><th>ID</th><th>이름</th><th>요청 보내기</th></tr>"
					str += "<tr><td id='ji'>"+user.jbskId+"</td><td>"+user.jbskName+"</td><td><input type='button' value='요청보내기'onclick='teamReq()'></td></tr></table>"
					$("#rst").html(str);
				} else {
					$("#rst").text("검색 결과가 없습니다. 아이디를 다시 확인해 주세요.")
				}
			}, error:function(request,status,error){
    		    $("#rst").text("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		})
		
	}
	
	function teamReq(){	//	가입요청보내는 펑션
		var jbskId = $("#ji").text();
		$.ajax({
		    method : "POST",
		    url : "ajaxTeamReq.do",
	    	cache : false,
			async : false,
			data : {
				teamId : teamId,
				jbskId : jbskId,
			},
			datatype : "text",
			success : function(data){
				if(data==1){
					alert("요청전송에 성공했습니다.")
					reqList();
				} else if(data==-1){
					alert("이미 다른 팀에 가입된 구직자입니다.")
				} else {
					alert("요청전송에 실패했습니다. 다시 시도해주세요.")
				}
			}, error:function(request,status,error){
    		    $("#rst").text("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		})
	}
	
	function reqList(){	//요청보낸 리스트가져오는 펑션
		$.ajax({
		    method : "POST",
		    url : "ajaxReqList.do",
	    	cache : false,
			async : false,
			data : {
				teamId : teamId,
			},
			datatype : "json",
			success : function(data){
				var rl = $.parseJSON(data);
				if(rl[0]){
					var reqstr = "<table border='1'><tr><th>ID</th><th>이름</th><th>취소하기</th></tr>"
					for(var i=0; i<rl.length; i++){
						reqstr += "<tr><td id='r"+i+"'>"+rl[i].jbskId+"</td><td>"+rl[i].jbskName+"</td><td><input type='button' value='취소' onclick='teamExit(this)'></tr>"
					}
					reqstr +="</table>"
					$("#reql").html(reqstr);
				}
			}, error:function(request,status,error){
    		    $("#rst").text("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		})
	}
	
	function teamExit(object){
		var jbskId = object.parentElement.parentElement.firstChild.textContent;//id값 찾아가기.. 다른거 안먹어서 이걸로함..

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
					alert("삭제성공!");
					location.reload();
				}
			}, error:function(request,status,error){
    		    $("#rst").text("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		})
	}
	
	//-->
</script>

<%@ include file="/setting/design_setting_footer.jsp" %>