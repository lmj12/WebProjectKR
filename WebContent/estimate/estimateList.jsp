<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp"%>
<!DOCTYPE html>
<div class="container">
<script type="text/javascript">
	//<!--
	function toEstForm(recCrrId, jbskName, jbskGender, posId, jbskId, jbskPic, recId, estId){	//자바스크립트 단독으로 post타입 넘기는 형태.
		  var form = document.createElement("form");
	      form.setAttribute("method", "post");
	      form.setAttribute("action", "estView.do");
	      
	      var recCrrIdipt = document.createElement("input");
	      recCrrIdipt.setAttribute("type", "hidden");
	      recCrrIdipt.setAttribute("name", "recCrrId");
	      recCrrIdipt.setAttribute("value", recCrrId);
	      
	      var jbskNameipt = document.createElement("input");
	      jbskNameipt.setAttribute("type", "hidden");
	      jbskNameipt.setAttribute("name", "jbskName");
	      jbskNameipt.setAttribute("value", jbskName);
	      
	      var jbskGendeript = document.createElement("input");
	      jbskGendeript.setAttribute("type", "hidden");
	      jbskGendeript.setAttribute("name", "jbskGender");
	      jbskGendeript.setAttribute("value", jbskGender);
	      
	      var posIdipt = document.createElement("input");
	      posIdipt.setAttribute("type", "hidden");
	      posIdipt.setAttribute("name", "posId");
	      posIdipt.setAttribute("value", posId);
	      
	      var jbskIdipt = document.createElement("input");
	      jbskIdipt.setAttribute("type", "hidden");
	      jbskIdipt.setAttribute("name", "jbskId");
	      jbskIdipt.setAttribute("value", jbskId);
	      
	      var jbskPicipt = document.createElement("input");
	      jbskPicipt.setAttribute("type", "hidden");
	      jbskPicipt.setAttribute("name", "jbskPic");
	      jbskPicipt.setAttribute("value", jbskPic);
	      
	      var recIdipt = document.createElement("input");
	      recIdipt.setAttribute("type", "hidden");
	      recIdipt.setAttribute("name", "recId");
	      recIdipt.setAttribute("value", recId);
	      
	      var estIdipt = document.createElement("input");
	      estIdipt.setAttribute("type", "hidden");
	      estIdipt.setAttribute("name", "estId");
	      estIdipt.setAttribute("value", estId);
	      
	      form.appendChild(recCrrIdipt);
	      form.appendChild(jbskNameipt);
	      form.appendChild(jbskGendeript);
	      form.appendChild(posIdipt);
	      form.appendChild(jbskIdipt);
	      form.appendChild(jbskPicipt);
	      form.appendChild(recIdipt);
	      form.appendChild(estIdipt);
	      
	      document.body.appendChild(form);
	      form.submit();
	}
	
	//-->
</script>
<h2>사후평가 창</h2>
	<table border='1'>
		<tr>
			<th>이름</th><th>아이디</th><th>성별</th><th>직무</th><th>평가상태</th><th>평가하기</th>
		</tr>
	<c:forEach var="estDto" items="${lists}">
		<tr>
			<td>${estDto.jbskName}</td><td>${estDto.jbskId}</td>
			<c:if test="${estDto.jbskGender eq 1}">
				<td>남</td>
			</c:if>
			<c:if test="${estDto.jbskGender eq 2}">
				<td>여</td>
			</c:if>
			<c:if test="${estDto.posId eq 1}">
				<td>팀장</td>
			</c:if>
			<c:if test="${estDto.posId eq 2}">
				<td>스캔</td>
			</c:if>
			<c:if test="${estDto.posId eq 3}">
				<td>예도</td>
			</c:if>
			<c:if test="${estDto.posId eq 4}">
				<td>안내</td>
			</c:if>
			<c:if test="${estDto.posId eq 5}">
				<td>경호</td>
			</c:if>
			<c:if test="${estDto.posId eq 6}">
				<td>기타</td>
			</c:if>
			<c:if test="${estDto.estId != 0 }">
				<td>
					평가완료
				</td>
				<td><input type="button" onclick="toEstForm('${estDto.recCrrId}', '${estDto.jbskName}', '${estDto.jbskGender}', '${estDto.posId}','${estDto.jbskId}', '${estDto.jbskPic}', '${estDto.recId}','${estDto.estId}' )" value="확인하기"></td>
			</c:if>
			<c:if test="${estDto.estId == 0 }">
				<td>
					미평가
				</td>
				<td><input type="button" onclick="toEstForm('${estDto.recCrrId}', '${estDto.jbskName}', '${estDto.jbskGender}', '${estDto.posId}','${estDto.jbskId}', '${estDto.jbskPic}', '${estDto.recId}',0 )" value="평가하기"></td>
			</c:if>
		</tr>
	</c:forEach>
</table>
</div>