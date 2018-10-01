<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp" %>
<!DOCTYPE html>

<h2>스케줄 뷰 페이지</h2><br>
<script type="text/javascript">
	var jbskId = '${sessionScope.memid}';
	var memType = '${sessionScope.memType}';
	var jbskName = '${sessionScope.memName}';
	var schId = ${schId};
	var schContent = '${schContent}';
	var stime = '${stime}';
	var etime = '${etime}';
	var sti = stime.split("/");
	var eti = etime.split("/");
	var st = new Date(sti[0],sti[1],sti[2],sti[3],sti[4],sti[5]);
	var et = new Date(eti[0],eti[1],eti[2],eti[3],eti[4],eti[5]);
	//<!--
	$(document).ready(
		function(){
			makeTable();
			
		}
	)
	function makeTable(){
		var shour = st.getHours();
		var ehour = et.getHours();
		var schstr = "<table border='1'><tr><th>시간</th><th>스케줄</th></tr>"
			schstr += 	"<tr><th>"+(shour-1)+":00</th><td></td></tr>"
			schstr += 	"<tr><th>"+(shour-1)+":30</th><td></td></tr>"
		for (var i=shour; i<=ehour; i++ ){
			schstr +=	"<tr><th>"+i+":00</th><td class='sch' onclick='schJb()'>스케줄있음</td></tr>"
			schstr +=	"<tr><th>"+i+":30</th><td class='sch' onclick='schJb()'>스케줄있음</td></tr>"
		}
		schstr += 	"<tr><th>"+(ehour+1)+":00</th><td></td></tr>"
		schstr += 	"<tr><th>"+(ehour+1)+":30</th><td></td></tr>"
		if(memType==2){
			schstr += 	"<tr><th colspan='2'><input type='button' value='수정' onclick='schMod(schId)'><input type='button' value='삭제' onclick='schDel(schId)'></th></tr></table>"
		}
		document.getElementById("t").innerHTML = schstr;
	}
	
	function schMod(schId){
		var form = document.createElement("form");
      	form.setAttribute("method", "post");
      	form.setAttribute("action", "schMod.do");
	    var hiddenField = document.createElement("input");
	    hiddenField.setAttribute("type", "hidden");
	    hiddenField.setAttribute("name", "schId");
	    hiddenField.setAttribute("value", schId);
	    
	    form.appendChild(hiddenField);
	    document.body.appendChild(form);
	    form.submit();
	}
	
	function schDel(schId){
		var conval = confirm("정말로 삭제하시겠습니까?");
		if(conval==true){
			$.ajax({
			    method : "POST",
			    url : "schDel.do",
		    	cache : false,
				async : false,
				data : {
					schId : schId,
				},
				datatype : "text",
				success : function(data){
					if(data==1){
						alert("삭제성공!")
						document.location.replace('main.do');
					} else{
						alert("삭제실패")
					}
				},error:function(request,status,error){
				   alert("서버와 통신에 실패했습니다. 잠시 후 다시 시도해주세요.");
				}
			})
		 
		} else {
			alert("삭제를 취소했습니다.")
		}
	}
	
	function schjbApply(object, schjbId){
		if(memType==1){
			$.ajax({
			    method : "POST",
			    url : "ajaxSchJbApply.do",
		    	cache : false,
				async : false,
				data : {
					schjbId : schjbId,
					jbskId : jbskId,
				},
				datatype : "text",
				success : function(data){	// TODO : 	반환하는거 확인 아직 못함
					object.setAttribute("value",jbskName+"("+jbskId+")");
					object.setAttribute("onclick", "onclick='schjbCncl(this,"+schjbId+")'");
					alert("성공");
				},	error:function(request,status,error){
				    $("#rst").text("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
		 } else {
			alert("지원할 수 없는 사용자입니다.");
		} 
	}
	
	function schjbCncl(object, schjbId){
		if(memType==1){
			var apId = object.value.split("(");	//아이디+)형태로 반환
			if( (jbskId+")") == apId){	//	지원자 id랑 세션id가 일치하면
				$.ajax({
				    method : "POST",
				    url : "ajaxSchJbCncl.do",
			    	cache : false,
					async : false,
					data : {
						schjbId : schjbId,
						jbskId : jbskId,
					},
					datatype : "text",
					success : function(data){	// TODO : 	반환하는거 확인 아직 못함
						object.setAttribute("value","지원하기");
						object.setAttribute("onclick", "onclick='schjbApply(this,"+schjbId+")'");
						alert("성공");
					},	error:function(request,status,error){
					    $("#rst").text("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			}
		 } else {
			alert("지원 취소가능한 유저가 아닙니다.");
		} 
	}
	
	function schJb() {
		$.ajax({
	    	method : "POST",
	    	url : "ajaxSchJbView.do",
	    	cache : false,
			async : false,
			data : {
				schId : schId
			},
			datatype : "json",
			success : function(data){
				var list = $.parseJSON(data);
				var max = 0;
				var schjbstr='';
				for(var i=0; i<list.length; i++){	//홀개수 찾기위한 반복문
					if(list[i].hallNum > max){
						max = list[i].hallNum;
					}
				}
				
				for (var i=0; i<max; i++){	//	홀개수 만큼 반복문 돔
					var hlist = new Array();
				
					for(var j=0; j<list.length; j++){
						if(list[j].hallNum == i+1){
							hlist.push(list[j]);
						}	//	같은 홀번호를 가진 놈들을 같은 리스트에 푸쉬
					}
					
					schjbstr += "<div id='"+(i+1)+"'><table border='1'><th rowspan='"+(list.length*2)+"'>"+(i+1)+"번 홀</th><th>업무</th><th>지원자</th></tr>";
					
					for (var j=0; j<hlist.length; j++){
			           if(hlist[j].posId == 1){	//팀장의 경우
			        	   schjbstr += "<tr><td><input type='text' value='팀장' readonly></td>";
			        	   if(hlist[j].jbskId){ //지원자가 이미 있다면
			        	   	schjbstr += "<td><input type='text' value='"+hlist[j].jbskName+"("+hlist[j].jbskId+")' onclick='schjbCncl(this,"+hlist[j].schjbId+")' readonly></td>";
			        	   } else{	// 지원자가 없다면
			        		schjbstr += "<td><input type='text' value='지원하기' onclick='schjbApply(this,"+hlist[j].schjbId+")' readonly></td></tr>";
			        	   }
			           } else if (hlist[j].posId == 2){
			        	   schjbstr += "<tr><td><input type='text' value='스캔' readonly></td>";
			        	   if(hlist[j].jbskId){ //지원자가 이미 있다면
			        	   	schjbstr += "<td><input type='text' value='"+hlist[j].jbskName+"("+hlist[j].jbskId+")' onclick='schjbCncl(this,"+hlist[j].schjbId+")' readonly></td>";
			        	   } else{	// 지원자가 없다면
			        		schjbstr += "<td><input type='text' value='지원하기' onclick='schjbApply(this,"+hlist[j].schjbId+")' readonly></td></tr>";
			        	   }
			           } else if(hlist[j].posId == 3){
			        	   schjbstr += "<tr><td><input type='text' value='예도' readonly></td>";
			        	   if(hlist[j].jbskId){ //지원자가 이미 있다면
			        	   	schjbstr += "<td><input type='text' value='"+hlist[j].jbskName+"("+hlist[j].jbskId+")' onclick='schjbCncl(this,"+hlist[j].schjbId+")' readonly></td>";
			        	   } else{	// 지원자가 없다면
			        		schjbstr += "<td><input type='text' value='지원하기' onclick='schjbApply(this,"+hlist[j].schjbId+")' readonly></td></tr>";
			        	   }
			           } else if (hlist[j].posId == 4){
			        	   schjbstr += "<tr><td><input type='text' value='안내' readonly></td>";
			        	   if(hlist[j].jbskId){ //지원자가 이미 있다면
			        	   	schjbstr += "<td><input type='text' value='"+hlist[j].jbskName+"("+hlist[j].jbskId+")' onclick='schjbCncl(this,"+hlist[j].schjbId+")' readonly></td>";
			        	   } else{	// 지원자가 없다면
			        		schjbstr += "<td><input type='text' value='지원하기' onclick='schjbApply(this,"+hlist[j].schjbId+")' readonly></td></tr>";
			        	   }
			           } else if (hlist[j].posId == 5){
			        	   schjbstr += "<tr><td><input type='text' value='경호' readonly></td>";
			        	   if(hlist[j].jbskId){ //지원자가 이미 있다면
			        	   	schjbstr += "<td><input type='text' value='"+hlist[j].jbskName+"("+hlist[j].jbskId+")' onclick='schjbCncl(this,"+hlist[j].schjbId+")' readonly></td>";
			        	   } else{	// 지원자가 없다면
			        		schjbstr += "<td><input type='text' value='지원하기' onclick='schjbApply(this,"+hlist[j].schjbId+")' readonly></td></tr>";
			        	   }
			           }
			     	}
					schjbstr += "</table><br>"
				}
				document.getElementById("schJb").innerHTML = schjbstr;
			}, error:function(request,status,error){
			    alert("오류! 오류!");
			}
		})
    	
	}
	//-->
</script>
${sessionScope.memName} 님의 스케줄<br>

<div id="t"></div>
<br>
<div id="schJb"></div>
<br>
<div id="rst"></div>