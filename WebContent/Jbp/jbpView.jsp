<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp" %>
<%@ include file="/setting/design_setting_upper.jsp" %>
<h2>구인자 정보수정 뷰</h2>


<c:if test="${result eq 0}">
	<script type="text/javascript">
			<!--
			alert( modifyerror );
			//-->
		</script>
		<meta http-equiv="refresh" content="0; url=main.do">
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="mypage.do"/>
</c:if>



<%@ include file="/setting/design_setting_footer.jsp" %>