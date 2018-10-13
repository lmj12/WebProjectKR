<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>
<!DOCTYPE html>
<style>
	/* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
</style>
<h2>스케줄 뷰 페이지</h2><br>
<script type="text/javascript">
	var jobpId = sessionStorage.getItem("jobpId");
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
	st.setMonth(st.getMonth()-1);
	var et = new Date(eti[0],eti[1],eti[2],eti[3],eti[4],eti[5]);
	et.setMonth(et.getMonth()-1);
	//<!--
	$(document).ready(
		function(){
			makeTable();
			schJb();
			setInterval("schJb()",30000);

		}
	)
	
	function tocal(){
		location.replace("tocal.do");
	}
	function makeTable(){
		var shour = st.getHours();
		var ehour = et.getHours();
		var schstr = "<table border='1'><tr><th>시간</th><th>스케줄</th></tr>"
			schstr += 	"<tr><th>"+(shour-1)+":00</th><td></td></tr>"
			schstr += 	"<tr><th>"+(shour-1)+":30</th><td></td></tr>"
		for (var i=shour; i<=ehour; i++ ){
			schstr +=	"<tr><th>"+i+":00</th><td class='sch' onclick='viewModal()'>스케줄있음</td></tr>"
			schstr +=	"<tr><th>"+i+":30</th><td class='sch' onclick='viewModal()'>스케줄있음</td></tr>"
		}
		schstr += 	"<tr><th>"+(ehour+1)+":00</th><td></td></tr>"
		schstr += 	"<tr><th>"+(ehour+1)+":30</th><td></td></tr>"
		if(memType==2){
			schstr += 	"<tr><th colspan='2'><input type='button' value='수정' onclick='schMod(schId)'><input type='button' value='삭제' onclick='schDel(schId)'></th></tr></table>"
		}
		document.getElementById("t").innerHTML = schstr;
	}
	
	function viewModal(){
		var schJb = document.getElementById('schJb');
		schJb.style.display = "block";
	}
	
	window.onclick = function(event) {
		var schJb = document.getElementById('schJb');
        if (event.target == schJb) {
        	schJb.style.display = "none";
        }
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
					
					alert("삭제성공!")
					document.location.replace('main.do');
					
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
					schId : schId,
					jbskId : jbskId,
				},
				datatype : "text",
				success : function(data){	// TODO : 	반환하는거 확인 아직 못함
					if(data==1){
						alert("성공");
						schJb();
					} else if (data==0){
						alert("지원에 실패했습니다. 잠시 후 다시 시도해주세요.")
					} else if (data==2){
						alert("한번에 한 직무만 지원할 수 있습니다.")
					}
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
			if( (jbskId+")") == apId[1]){	//	지원자 id랑 세션id가 일치하면
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
						if(data==1){
							alert("성공");
							schJb();
						} else if (data==0){
							alert("취소에 실패했습니다 잠시 후 다시 시도해주세요.")
						} else if (data==2){
							alert("지원하지 않은 직무입니다.")
						}
					},	error:function(request,status,error){
					    $("#rst").text("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			}
		 } else {
			alert("지원 취소가능한 유저가 아닙니다.");
		} 
	}
	
	function schjbMod(cnt, schjbId){
		var sel = $("#s"+cnt+" option:selected").val();	//수정하기위해 선택된 포지션의 value;
			$.ajax({
		    	method : "POST",
		    	url : "ajaxSchJbMod.do",
		    	cache : false,
				async : false,
				data : {
					sel : sel,
					schjbId : schjbId
				},
				datatype : "text",
				success : function(data){
					if(data==1){
						alert("수정완료");
						schJb();
					} else {
						alert("수정실패");
					}
				}, error:function(request,status,error){
				    alert("schJb 수정 오류!");
				}
			})
	}
	
	function schjbDel(schjbId){
		$.ajax({
	    	method : "POST",
	    	url : "ajaxSchJbDel.do",
	    	cache : false,
			async : false,
			data : {
				schjbId : schjbId
			},
			datatype : "text",
			success : function(data){
				if(data==1){
					alert("삭제완료");
					schJb();
				} else {
					alert("삭제실패");
				}
			}, error:function(request,status,error){
			    alert("schJb 삭제 오류!");
			}
		})
	}
	function schjbInsert(hallNum, object){
		$.ajax({
	    	method : "POST",
	    	url : "ajaxSchJbWrt.do",
	    	cache : false,
			async : false,
			data : {
				hallNum : hallNum,
				schId : schId
			},
			datatype : "text",
			success : function(data){
				if(data==1){
					alert("추가완료");
					schJb();
				} else {
					alert("추가실패");
				}
			}, error:function(request,status,error){
			    alert("schJb 추가 오류!");
			}
		})
	}
	function makeHall(hallNum){
		if(memType==2){
			var hallNum = hallNum+1;
			$.ajax({
		    	method : "POST",
		    	url : "ajaxSchHallWrt.do",
		    	cache : false,
				async : false,
				data : {
					hallNum : hallNum,
					schId : schId
				},
				datatype : "text",
				success : function(data){
					if(data==1){
						alert("홀추가완료");
						schJb();
					} else {
						alert("홀추가실패");
					}
				}, error:function(request,status,error){
				    alert("schJb 홀추가 오류!");
				}
			})
		} else {
			alert("권한이 없습니다.")
		}
		
	}
	
	function delHall(hallNum){
		$.ajax({
	    	method : "POST",
	    	url : "ajaxSchHallDel.do",
	    	cache : false,
			async : false,
			data : {
				hallNum : hallNum,
				schId : schId
			},
			datatype : "text",
			success : function(data){
				alert("홀삭제완료");
				schJb();
			}, error:function(request,status,error){
			    alert("schJb 홀삭제 오류!");
			}
		})
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
				var schjbstr='<div class="modal-content">';
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
					if (hlist.length!=0){
					schjbstr += "<div id='"+(i+1)+"'><input type='button' value='홀 추가' onclick='makeHall("+(i+1)+")'><table border='1'><th rowspan='"+(list.length*2)+"'>"+(i+1)+"번 홀</th><th>업무</th><th>지원자</th></tr>";
					
						if(memType==1){	//구직자일경우 보여질 테이블 만들기.
							for (var j=0; j<hlist.length; j++){
					           if(hlist[j].posId == 1){	//팀장의 경우
					        	   schjbstr += "<tr><td><input type='text' value='팀장' readonly></td>";
					        	   if(hlist[j].jbskId){ //지원자가 이미 있다면
					        	   	schjbstr += "<td><input type='text' value='"+hlist[j].jbskName+"("+hlist[j].jbskId+")' onclick='schjbCncl(this,"+hlist[j].schjbId+")' readonly>";
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
						} else {
							var cnt=0;
							for (var j=0; j<hlist.length; j++){
								 if(hlist[j].posId == 1){	//팀장의 경우
						        	   schjbstr += "<tr><td><select id='s"+cnt+"'><option value='1' selected>팀장</option><option value='2'>스캔</option><option value='3'>"
							            + "예도</option><option value='4'>안내</option><option value='5'>경호</option></select></td>"
						        	   if(hlist[j].jbskId){ //지원자가 이미 있다면
						        	   	schjbstr += "<td><input type='text' value='"+hlist[j].jbskName+"("+hlist[j].jbskId+")' onclick='schjbCncl(this,"+hlist[j].schjbId+")' readonly>";
						        	   } else{	// 지원자가 없다면
						        		schjbstr += "<td><input type='text' value='지원하기' onclick='schjbApply(this,"+hlist[j].schjbId+")' readonly><input type='button' value='수정' onclick='schjbMod("+cnt+","+hlist[j].schjbId+")'><input type='button' value='삭제' onclick='schjbDel("+hlist[j].schjbId+")'></td></tr>";
						        	   }
							           cnt++;
						          } else if(hlist[j].posId == 2){	//스캔의 경우
						        	   schjbstr += "<tr><td><select id='s"+cnt+"'><option value='1' >팀장</option><option value='2' selected>스캔</option><option value='3'>"
							            + "예도</option><option value='4'>안내</option><option value='5'>경호</option></select></td>"
						        	   if(hlist[j].jbskId){ //지원자가 이미 있다면
						        	   	schjbstr += "<td><input type='text' value='"+hlist[j].jbskName+"("+hlist[j].jbskId+")' onclick='schjbCncl(this,"+hlist[j].schjbId+")' readonly>";
						        	   } else{	// 지원자가 없다면
						        		schjbstr += "<td><input type='text' value='지원하기' onclick='schjbApply(this,"+hlist[j].schjbId+")' readonly><input type='button' value='수정' onclick='schjbMod("+cnt+","+hlist[j].schjbId+")'><input type='button' value='삭제' onclick='schjbDel("+hlist[j].schjbId+")'></td></tr>";
						        	   }
						        	   cnt++;
						          } else if(hlist[j].posId == 3){	//예도의 경우
						        	   schjbstr += "<tr><td><select id='s"+cnt+"'><option value='1' >팀장</option><option value='2'>스캔</option><option value='3' selected>"
							            + "예도</option><option value='4'>안내</option><option value='5'>경호</option></select></td>"
						        	   if(hlist[j].jbskId){ //지원자가 이미 있다면
						        	   	schjbstr += "<td><input type='text' value='"+hlist[j].jbskName+"("+hlist[j].jbskId+")' onclick='schjbCncl(this,"+hlist[j].schjbId+")' readonly>";
						        	   } else{	// 지원자가 없다면
						        		schjbstr += "<td><input type='text' value='지원하기' onclick='schjbApply(this,"+hlist[j].schjbId+")' readonly><input type='button' value='수정' onclick='schjbMod("+cnt+","+hlist[j].schjbId+")'><input type='button' value='삭제' onclick='schjbDel("+hlist[j].schjbId+")'></td></tr>";
						        	   }
						        	   cnt++;
						          } else if(hlist[j].posId == 4){	//안내
						        	   schjbstr += "<tr><td><select id='s"+cnt+"'><option value='1' >팀장</option><option value='2'>스캔</option><option value='3'>"
							            + "예도</option><option value='4' selected>안내</option><option value='5'>경호</option></select></td>"
						        	   if(hlist[j].jbskId){ //지원자가 이미 있다면
						        	   	schjbstr += "<td><input type='text' value='"+hlist[j].jbskName+"("+hlist[j].jbskId+")' onclick='schjbCncl(this,"+hlist[j].schjbId+")' readonly>";
						        	   } else{	// 지원자가 없다면
						        		schjbstr += "<td><input type='text' value='지원하기' onclick='schjbApply(this,"+hlist[j].schjbId+")' readonly><input type='button' value='수정' onclick='schjbMod("+cnt+","+hlist[j].schjbId+")'><input type='button' value='삭제' onclick='schjbDel("+hlist[j].schjbId+")'></td></tr>";
						        	   }
						        	   cnt++;
						          } else if(hlist[j].posId == 5){	//경호
						        	   schjbstr += "<tr><td><select id='s"+cnt+"'><option value='1' >팀장</option><option value='2' >스캔</option><option value='3'>"
							            + "예도</option><option value='4'>안내</option><option value='5' selected>경호</option></select></td>"
						        	   if(hlist[j].jbskId){ //지원자가 이미 있다면
						        	   	schjbstr += "<td><input type='text' value='"+hlist[j].jbskName+"("+hlist[j].jbskId+")' onclick='schjbCncl(this,"+hlist[j].schjbId+")' readonly>";
						        	   } else{	// 지원자가 없다면
						        		schjbstr += "<td><input type='text' value='지원하기' onclick='schjbApply(this,"+hlist[j].schjbId+")' readonly><input type='button' value='수정' onclick='schjbMod("+cnt+","+hlist[j].schjbId+")'><input type='button' value='삭제' onclick='schjbDel("+hlist[j].schjbId+")'></td></tr>";
						        	   }
						        	   cnt++;
						          } 
							}
							schjbstr += "<tr><th colspan='3'><input type='button' value='필요인원추가' onclick='schjbInsert("+(i+1)+",this)'><input type='button' value='홀 삭제' onclick='delHall("+(i+1)+")'></th></tr>"
						}
					schjbstr += "</table></div><br>"
					}
				}
				schjbstr += "</div>"
				document.getElementById("schJb").innerHTML = schjbstr;
			}, error:function(request,status,error){
			    alert("오류! 오류!");
			}
		})
    	
	}
	
	function schPrev(){
		$.ajax({
	    	method : "POST",
	    	url : "ajaxSchPrev.do",
	    	cache : false,
			async : false,
			data : {
				jobpId : jobpId,
				stime :  st.getTime()
			},
			datatype : "json",
			success : function(data){
				var sch = $.parseJSON(data);
				if (sch){
					$("#schJb").text('')
					schId = sch.schId;
					schContent = sch.schContent;
					st = new Date(Number(sch.schstartTime));
					et = new Date(Number(sch.schendTime));
					makeTable();
				} else {
					alert("이전 스케줄이 없습니다.")
				}
			}, error:function(request,status,error){
				alert("prev에러");
			}
		})
			
	}
	function schNext(){
		$.ajax({
	    	method : "POST",
	    	url : "ajaxSchNext.do",
	    	cache : false,
			async : false,
			data : {
				jobpId : jobpId,
				etime : et.getTime()
			},
			datatype : "json",
			success : function(data){
				var sch = $.parseJSON(data);
				if (sch){
					$("#schJb").text('')
					schId = sch.schId;
					schContent = sch.schContent;
					st = new Date(Number(sch.schstartTime));
					et = new Date(Number(sch.schendTime));
					makeTable();
				} else {
					alert("다음 스케줄이 없습니다.")
				}
			}, error:function(request,status,error){
				alert("next에러");
			}
		})
	}
	//-->
</script>
<table><tr><th>
<input type="button" value="달력으로" onclick="tocal()">
<input type="button" value="이전스케줄" onclick="schPrev()">
<input type="button" value="다음스케줄" onclick="schNext()">
</th></tr></table><br>
${sessionScope.memName} 님의 스케줄<br>

<div id="t"></div>
<br>
<div id="schJb" class="modal">
</div>
<br>
<div id="rst"></div>

<%@ include file="/setting/design_setting_footer.jsp" %>