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
	//-->
</script>
<c:if test="${sessionScope.teamReq eq '1' }">
	<script type="text/javascript">
		//<!--
		alertTeam();
		//-->
	</script>
</c:if>
<h2><span>${sessionScope.memid}</span>님의 마이페이지입니다</h2>
		

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


<%@ include file="/setting/design_setting_footer.jsp" %>