<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Daum 주소 api 검색 </title>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="../js/jbskRegJS.js"></script>

</head>
<body>
<input type="text" id="zipcode" placeholder="우편번호" readonly>
<input type="button" onclick="searchPostcode()" value="우편번호 찾기">
<input type="text" id="rdAddress" placeholder="도로명주소" readonly>
<input type="text" id="jbAddress" placeholder="지번주소" readonly>
<input type="text" id="iptAddress" placeholder="상세주소를 입력해주세요">
<span id="guide" style="color:#999"></span>





</body>
</html>