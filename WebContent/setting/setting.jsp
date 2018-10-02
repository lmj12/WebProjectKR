<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">	//공용 펑션 error alert
//<!--
	function erroralert( msg ) {
		alert( msg );
		return false;
	} 
	
	function errorback( msg ) {
		alert( msg );
		history.back();
	} 
//-->
</script>

<!-- 세팅 경로 -->
<c:set var="setting" value="/KR_WebProject/setting/"/>

<%-- js 폴더 경로 --%>
<c:set var="js" value="/KR_WebProject/js/"/>
	<!-- jQuery 파일 -->
	<script src="${js}jquery-3.3.1.js"></script>

