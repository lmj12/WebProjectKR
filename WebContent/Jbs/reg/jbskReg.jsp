<%@page import="java.net.URLEncoder"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	//<!--
	var authNum = 0;
	//-->
</script>
<head>
	<meta charset="UTF-8">
	<title> 구직자 회원가입 </title>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="./js/jbskReg2.js"></script>
	<script src="./js/jbskReg.js"></script>
	
	
</head>
<body onload="inputfocus()">
	
	<h2> 구직자 회원가입 </h2>

	<!-- <form method="post" action="jbskReg.do" name="jbskReg"> 실시간 처리 전-->
	<form name="inputform" method="post" action="jbskReg.do" enctype="multipart/form-data" onsubmit="return inputcheck()">
	<input type="hidden" name='confirm' value="0">
		<table border="1">
			<tr>
				<th colspan="3">
					구직자 회원가입
				</th>
			</tr>
			<tr>
				<!-- TODO : maxlength DB상의 들어가는 길이 보고 전부 맞춰주세요 -->
				<th> 아이디 </th>
				<td> <input class="input" type="text" name="jbskId" maxlength="15">
				<td>
					<input class="idresult" type="text" maxlength="15" readonly>
				</td>
			</tr>
			<tr>
				<th> 패스워드 </th>
				<td>
					<input class="input" type="password" name="jbskPasswd" maxlength="15">
				</td>
				<td>
					<input class="passwdresult" type="text" maxlength="15" readonly>
				</td>
			</tr>
			<tr>
				<th> 비번확인 </th>
				<td>
					<input class="input" type="password" name="jbskRePasswd" maxlength="15">
				</td>
				<td>
					<input class="repasswdresult" type="text" maxlength="15" readonly>
				</td>
			</tr>
			<tr>
				<th> 이름 </th>
				<td>
					<input class="input" type="text" name="jbskName" maxlength="10">
				</td>
				<td>
					
				</td>
			</tr>
			<tr>
				<th> 생년월일 </th>
				<td>
					<input class="input" type="date" name="jbskBd">
				</td>
				<td>
					
				</td>
			</tr>
			<tr>
				<th> 성별 </th>
				<td>
					<input type="radio" name="jbskGender" value="1">남
					<input type="radio" name="jbskGender" value="2">여
				</td>
				<td>
					
				</td>
			</tr>
			
			<tr>
				<th rowspan="5">주소</th>
			<tr>
				<td>
					<input type="button" value="주소찾기" onclick="searchPostcode()">
				</td>
				<td>
					
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="jbAddress" id="jbAddress" placeholder="도 / 시" readonly>
					<!-- 정확한 용도를 모르겠으나 주소검색 시 검색창 꺼지게 만들어 줌 -->
					<!-- 혹시 추후 주소 파싱해오는데 지장 생기면 body 태그 닫히는 곳 까지 내려버려도 무관함 -->
					<span id="guide" style="color:#999"></span>
				</td>
				<td>
					
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="rdAddress" name="rdAddress" placeholder="시 / 구" readonly>
				</td>
				<td>
					
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="zipcode" name="zipcode" placeholder="구 / 동" readonly>
				</td>
				<td>
					
				</td>
			</tr>
			
			<tr>
				<th> 이메일 </th>
				<td>
					 <input type="text" name="jbskEmail1" maxlength="50">@
                       	 <select name="jbskEmail2" id="jbskEmail2">
                        		<option>naver.com</option>	
                        	    <option>daum.net</option>
                        	    <option>gmail.com</option>
                         	   <option>nate.com</option>
                         	   <option>직접입력</option>    
                        	
                        	   <!--  <option value="1">naver.com</option>
                        	    <option value="2">daum.net</option>
                        	    <option value="3">gmail.com</option>
                         	   <option value="4">nate.com</option>
                         	   <option value="5">직접입력</option>     -->                    
                        </select>
                </td>
                <td>
					<input class="input" type="text" name="jbskEmail3" maxlength="15" readonly>
				</td>
            </tr>
			<tr>
				<th> 휴대전화 </th>
				<td>
					<input class="input" type="text" name="jbskTel" id="jbskTel" maxlength="15">
					<input type="button" value="문자발송" onclick="telAuth()">
				</td>
				<td>
					<input class="telresult" type="text" maxlength="15" readonly>
				</td>
			</tr>
			<tr>
				<th>인증번호 입력</th>
				<td>
					<input type="number" id="authNumCk" maxlength="10" placeholder="인증번호를 입력해주세요.">
					<input type="hidden" id="authCk" value="0">
					<input type="hidden" id="authNum" value="0">
					<input type="button" value="인증번호확인" onclick="authCheck()">
				</td>
			</tr>
			<tr>
				<th> 사진 </th>
				<td>
					<input class="input" type="file" name="jbskPic" id="file">
				</td>
				<td>
					<input class="input" type="text" name="jbskPic2" maxlength="15" readonly>
				</td>
				
			</tr>
			<tr>
				<th> 정보수신동의 </th>
				<td>
					<input type="radio" name="jbskinfotype" value="1">수신안함
					<input type="radio" name="jbskinfotype" value="2">메일
					<input type="radio" name="jbskinfotype" value="3">SMS
					<input type="radio" name="jbskinfotype" value="4">메일, SMS
				</td>
				<td>
					
				</td>
			</tr>
			<tr>	
				<th colspan="3">
					<input class="inputbutton" type="submit" value="가입">
					<input class="inputbutton" type="reset" value="취소" onclick="location='main.do'">
				</th>
			</tr>
		</table>	
	</form>
	
	
	

	</body>
</html>

<%@ include file="/setting/design_setting_footer.jsp" %>