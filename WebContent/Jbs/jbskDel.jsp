<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/setting.jsp" %>
<%@ include file="/setting/design_setting_upper.jsp" %>
    <h2>회원탈퇴 페이지</h2>
    
		<c:if test="${result eq 1}">
			${sessionScope.memid= null}
			<c:redirect url="main.do"/>
		</c:if>
		
<%@ include file="/setting/design_setting_footer.jsp" %>