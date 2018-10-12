<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<script src="${js}recCng.js"></script>
<script type="text/javascript">
	//<!--
	
	var recStart = '${recDto.recStart}';
	var st = new Date(recStart).format("yyyy/MM/dd hh:mm");
	
	var recEnd = '${recDto.recEnd}';
	var et = new Date(recEnd).format("yyyy/MM/dd hh:mm");;

	$(document).ready(function(){
	   	appTable();
	   	$("#st").text(st);
	   	$("#et").text(et);	
	});

	function recApply() {
		var memType = ${sessionScope.memType}
		if(memType==1){
			var recId = $("#recId").val()
			var jbskId = '${sessionScope.memid}';
			var posId = $("#pos option:selected").val();
			$.ajax({
		    	method : "POST",
		    	url : "ajaxRecCrrApply.do",
		    	cache : false,
				async : false,
				data : {
					recId : recId,
					posId : posId,
					jbskId : jbskId
				},
				datatype : "text",
				success : function(data){
					if(data == 1){
						alert("지원성공했습니다.")
					} else if (data==2){ 
						alert("이미 지원한 공고입니다.")
					} else {
						alert("지원에 실패했습니다. 다시 시도해주세요.")
					}
					
				}, error:function(request,status,error){
					alert();
				}
			})
		} else {
			alert("지원할 수 없는 형태의 사용자입니다.")
		}
	}
	
	function recCncl() {
		var memType = ${sessionScope.memType}
		if(memType==1){
			var recId = $("#recId").val()
			var jbskId = '${sessionScope.memid}';
			$.ajax({
		    	method : "POST",
		    	url : "ajaxRecCrrCk.do",
		    	cache : false,
				async : false,
				data : {
					recId : recId,
					jbskId : jbskId
				},
				datatype : "text",
				success : function(data){
					var con;
					if (data == 0){
						alert("지원하지 않은 공고입니다.");
						con = false;
					} else if (data == 1){
						con = confirm("현재 지원되어 있는 직무는 '팀장' 입니다. 지원취소 하시겠습니까?")
					}  else if (data == 2){
						con = confirm("현재 지원되어 있는 직무는 '스캔' 입니다. 지원취소 하시겠습니까?")
					}  else if (data == 3){
						con = confirm("현재 지원되어 있는 직무는 '예도' 입니다. 지원취소 하시겠습니까?")
					}  else if (data == 4){
						con = confirm("현재 지원되어 있는 직무는 '안내' 입니다. 지원취소 하시겠습니까?")
					}  else if (data == 5){
						con = confirm("현재 지원되어 있는 직무는 '경호' 입니다. 지원취소 하시겠습니까?")
					}  else if (data == 6){
						con = confirm("현재 지원되어 있는 직무는 '기타' 입니다. 지원취소 하시겠습니까?")
					}
					
					if(con){
						recCnclConfirm();
					}
					
				}, error:function(request,status,error){
					alert();
				}
			})
		} else {
			alert("지원할 수 없는 형태의 사용자입니다.")
		}
	}
	
	function recCnclConfirm() {
		var recId = $("#recId").val()
		var jbskId = '${sessionScope.memid}';
		$.ajax({
	    	method : "POST",
	    	url : "ajaxRecCrrCncl.do",
	    	cache : false,
			async : false,
			data : {
				recId : recId,
				jbskId : jbskId
			},
			datatype : "text",
			success : function(data){
				if(data == 1){
					alert("지원취소했습니다.")
				} else {
					alert("취소에 실패했습니다. 다시 시도해주세요.")
				}
				
			}, error:function(request,status,error){
				alert();
			}
		})
		
	}
	
	function recMod() {
		var memType = ${sessionScope.memType}
		if(memType==1){
			var recId = $("#recId").val()
			var jbskId = '${sessionScope.memid}';
			var posId = $("#pos option:selected").val();
			var posName;
			if(posId==1){
				posName="팀장";
			} else if (posId==2){
				posName="스캔"
			} else if (posId==3){
				posName="예도"
			} else if (posId==4){
				posName="안내"
			} else if (posId==5){
				posName="경호"
			} else if (posId==6){
				posName="기타"
			}
			$.ajax({
		    	method : "POST",
		    	url : "ajaxRecCrrCk.do",
		    	cache : false,
				async : false,
				data : {
					recId : recId,
					jbskId : jbskId
				},
				datatype : "text",
				success : function(data){
					var con;
					if(posId == data){
						alert("현재 지원한 직무와 같은 직무입니다.");
						con = false;
					} else if (data == 0){
						alert("지원하지 않은 공고입니다.");
						con = false;
					} else if (data == 1){
						con = confirm("현재 지원되어 있는 직무는 '팀장' 입니다. '" +posName+ "'직무로 다시 지원하시겠습니까?")
					}  else if (data == 2){
						con = confirm("현재 지원되어 있는 직무는 '스캔' 입니다. '" +posName+ "'직무로 다시 지원하시겠습니까?")
					}  else if (data == 3){
						con = confirm("현재 지원되어 있는 직무는 '예도' 입니다. '" +posName+ "'직무로 다시 지원하시겠습니까?")
					}  else if (data == 4){
						con = confirm("현재 지원되어 있는 직무는 '안내' 입니다. '" +posName+ "'직무로 다시 지원하시겠습니까?")
					}  else if (data == 5){
						con = confirm("현재 지원되어 있는 직무는 '경호' 입니다. '" +posName+ "'직무로 다시 지원하시겠습니까?")
					}  else if (data == 6){
						con = confirm("현재 지원되어 있는 직무는 '기타' 입니다. '" +posName+ "'직무로 다시 지원하시겠습니까?")
					}
					
					if(con){
						recModConfirm(posId);
					}
					
				}, error:function(request,status,error){
					alert();
				}
			})
		} else {
			alert("지원할 수 없는 형태의 사용자입니다.")
		}
	}
	
	function recModConfirm(posId) {
		var recId = $("#recId").val()
		var jbskId = '${sessionScope.memid}';
		$.ajax({
	    	method : "POST",
	    	url : "ajaxRecCrrMod.do",
	    	cache : false,
			async : false,
			data : {
				recId : recId,
				jbskId : jbskId,
				posId : posId
			},
			datatype : "text",
			success : function(data){
				if(data == 1){
					alert("수정성공했습니다.")
				} else {
					alert("수정에 실패했습니다. 다시 시도해주세요.")
				}
			}, error:function(request,status,error){
				alert();
			}
		})
	}
	
	function appTable(){
		var appstr ="<select id='pos'>";
		var posIds = document.getElementsByName("posId");
		
		for (var i=0; i<posIds.length; i++){
			var posId = posIds[i].value
			var posName;
			if(posId==1){
				posName = "팀장";
			} else if(posId==2){
				posName = "스캔";
			} else if(posId==3){
				posName = "예도"
			} else if(posId==4){
				posName = "안내"
			} else if(posId==5){
				posName = "경호"
			} else {
				posName = "기타"
			}
			appstr += "<option value='"+posId+"'>"+posName+"</option>"  
		}
		appstr += "</select>"
		$("#app").html(appstr);
	}
	
	
	//-->
</script>
<h2>공고내용 페이지</h2>

<table border="1">
	
<c:if test="${sessionScope.memType eq 2}">
		<tr>
			<th>지원자수 </th>
			<td align="center">${recDto.crrCnt} </td>
		</tr>
</c:if>

		<tr>
			<th>공고번호</th>
			<td align="center">${recDto.recId}<input type="hidden" id="recId" value="${recDto.recId}"></td>
			
		</tr>
		<tr>
			<th>직무 </th>
			<td align="center"> 
			<c:forEach var="recruitDto" items="${recruitDto}">
			<input type="hidden" value="${recruitDto.posId}" name="posId">
			<c:choose>
			  <c:when test="${recruitDto.posId eq 1}">
			  	팀장
			  </c:when>
			  <c:when test="${recruitDto.posId eq 2}">
			   	스캔
			  </c:when>
			  <c:when test="${recruitDto.posId eq 3}">
			   	예도
			  </c:when>
			  <c:when test="${recruitDto.posId eq 4}">
			   	안내
			  </c:when>
			  <c:when test="${recruitDto.posId eq 5}">
			   	경호
			  </c:when>
			  <c:otherwise>
			   	기타
			  </c:otherwise> 
			 </c:choose>
			 </c:forEach>
				</td>
		<tr>
			<th>시작일</th>
			<td id='st'></td>
		</tr>
		<tr>
			<th>종료일</th>
			<td id='et'></td>
		</tr>
		<tr>
			<th>공고상태</th>
			<td align="center"> 
				<c:if test="${recDto.recStatus eq 0}">
				    		모집중
				    </c:if>
				    <c:if test="${recDto.recStatus eq 1}">
				    		모집완료
				    </c:if>
				    <c:if test="${recDto.recStatus eq 2}">
				    		완료
				    </c:if>	
			</td>
		</tr>
		<tr>
			<th>공고내용</th>
			<td align="center">
				${recDto.getReccontent()}
			</td>
		</tr>
		<tr>
			<th>사업자이름</th>
			<td align="center">
				${jbpDto.jobpCn}
			</td>
		</tr>
		<tr>
			<th>사업자번호 </th>
			<td align="center">
				${jbpDto.jobpBno}
			</td>
		<tr>
			<th>주소</th>
			<td align="center">
				${recDto.getRecSite()}
			</td>
		</tr>
<c:if test="${sessionScope.memid eq jbpDto.jobpId}">
	<c:if test="${recDto.recStatus ne 2}">
		<tr>
		<th>공고상태변경</th>
				<td>				
				<select name="sta" id="sta">
					<option value="0" selected>모집중 </option>
					<option value="1">모집완료</option>
					<option value="2">완료</option>
				</select>					
				<input type="button" name="cng" value="변경" onclick="recCng(${recDto.recId})">
				<input type="hidden" id="val" name="val">			
				</td>						
		</tr>
	</c:if>
</c:if>
			<tr>
		<th colspan="4">
			<c:if test="${sessionScope.memid eq jbpDto.jobpId}">
				<input class="inputbutton" type="button" value="공고수정"
					onclick="location='recMod.do?recId=${recDto.recId}&pageNum=${pageNum}'">
				<input class="inputbutton" type="button" value="공고삭제"
					onclick="location='recDel.do?recId=${recDto.recId}&pageNum=${pageNum}'">
				<input type="button" value="지원현황"
					onclick="location='recCrrView.do?recId=${recDto.recId}'">
			</c:if>
			<input class="inputbutton" type="button" value="목록으로"
				onclick="hBack()">
		</th>
	</tr>	
</table>			
<br>
	
	
<table border='1'>
	<tr>
		<th colspan='4' id="app">
		
		</th>
		<th>
			<input type='button' value='지원' onclick='recApply()'>
			<input type='button' value='지원취소' onclick='recCncl()'>
			<input type='button' value='지원수정' onclick='recMod()'>
		</th>
	</tr>
</table>

<%@ include file="/setting/design_setting_footer.jsp" %>