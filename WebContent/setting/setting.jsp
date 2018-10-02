<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- Bootstrap 4 import CDN -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- 테마적용 예정중-->
	<!-- <link rel="stylesheet" type="text/css" href="../../bootstrap/theme.css"> -->

<<script type="text/javascript">	//공용 펑션 error alert
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

