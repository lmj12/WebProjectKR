<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>

<script type="text/javascript">
	//<!--
	function alertTeam(){
		if(confirm("팀 가입 요청이 있습니다. 확인하시겠습니까?")){
			location.href="teamReqCk.do"
		} 
	}
	function toModify(){
		if(${sessionScope.memType eq 2}){
			location.href="jbpView.do"
		} else if(${sessionScope.memType eq 1}) {
			location.href="jbskView.do"
		}
	}
	//-->
</script>
<h2><span>${sessionScope.memid}</span>님의 마이페이지입니다</h2>
<table border="1">	
	<tr>
		<th> <input type="text" name="jbksearch"> </th>
		<td> <input type="button" value="검색"> </td>
		<td> <input type="button" name="change" value="정보수정" onclick="toModify()"> </td>
		<c:if test="${sessionScope.memType eq 2}">
			<td> <input type="button" name="out" value="회원탈퇴" onclick="location='jbpDel.do'"></td>		
		</c:if>
		<c:if test="${sessionScope.memType eq 1}">	
			<td> <input type="button" name="out" value="회원탈퇴" onclick="location='jbskDel.do'"></td>
			<c:if test="${sessionScope.teamReq eq '1' }">
				<script type="text/javascript">
					//<!--
					alertTeam();
					//-->
				</script>
			</c:if>
		</c:if>
	</tr>
</table>

<c:if test="${sessionScope.memType eq 2}">
	<jsp:include page="recMyView.do" flush="false"/>		
</c:if>

<c:if test="${sessionScope.memType eq 1}">
	<jsp:include page="recCrrMy.do" flush="false"/>
	<c:if test="${sessionScope.teamReq eq '1' }">
		<script type="text/javascript">
			//<!--
			alertTeam();
			//-->
		</script>
	</c:if>
</c:if>

<script type="text/javascript">
	//<!--
	function alertTeam(){
		if(confirm("팀 가입 요청이 있습니다. 확인하시겠습니까?")){
			location.href="teamReqCk.do"
		} 
	}
	function toModify(){
		if(${sessionScope.memType eq 2}){
			location.href="jbpView.do"
		} else if(${sessionScope.memType eq 1}) {
			location.href="jbskView.do"
		}
	} 
	//-->
</script>

<%@ include file="/setting/design_setting_footer.jsp" %>