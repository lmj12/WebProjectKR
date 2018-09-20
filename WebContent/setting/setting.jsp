<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- 세팅 경로 -->
<c:set var="setting" value="/KR_WebProject/setting/"/>

<%-- js 폴더 경로 --%>
<c:set var="js" value="/KR_WebProject/js/"/>
	<!-- jQuery 파일 -->
	<script src="${js}jquery-3.3.1.js"></script>
	<!-- 구직자 Daum Api 주소 불러오기 -->
	<script src="${js}jbskRegJS.js"></script>
	<!-- 구인자 사업자등록번호 유효성검사 -->
	<script src="${js}jbpBizCheck.js"></script>