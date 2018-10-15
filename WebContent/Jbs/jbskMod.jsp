<%@page import="member.jobseeker.JobSeekerDataBean"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>

	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="./js/jbskMod.js"></script>
	<script src="./js/jbskReg.js"></script>
<div class="container">
<h2> 구직자 정보 수정 </h2>

	
	<form name="inputform" method="post" action="jbskMod.do" enctype="multipart/form-data" onsubmit="return inputcheck()">
	<input type="hidden" name='confirm' value="0">
		<table border="1">
			<tr>
				<th colspan="3">
					구직자 정보 수정
				</th>
			</tr>
			<tr>
				<!-- TODO : maxlength DB상의 들어가는 길이 보고 전부 맞춰주세요 -->
				<th> 아이디 </th>
				<td> <input class="input" type="text" name="jbskId" maxlength="15" value="${jbskDto.getJbskId()}" readonly>
				<td>
					<input class="idresult" type="text" maxlength="15" readonly>
				</td>
			</tr>
			<tr>
				<th> 패스워드 </th>
				<td>
					<input class="input" type="password" name="jbskPasswd" maxlength="15" value="${jbskDto.getJbskPasswd()}">
				</td>
				<td>
					<input class="passwdresult" type="text" maxlength="15" readonly>
				</td>
			</tr>
			<tr>
				<th> 비번확인 </th>
				<td>
					<input class="input" type="password" name="jbskRePasswd" maxlength="15" value="${jbskDto.getJbskPasswd()}" >
				</td>
				<td>
					<input class="repasswdresult" type="text" maxlength="15" readonly>
				</td>
			</tr>
			<tr>
				<th> 이름 </th>
				<td colspan="2">
					<input class="input" type="text" name="jbskName" maxlength="10" value="${jbskDto.getJbskName()}" readonly>
				</td>
				<td>
					
				</td>
			</tr>
			
			<tr>
				<th> 성별 </th>
				<td colspan="2">
					<input type="radio" name="jbskGender" value="1" <c:if test="${jbskDto.getJbskGender() eq '1'}">checked="checked" </c:if> />남
					<input type="radio" name="jbskGender" value="2" <c:if test="${jbskDto.getJbskGender() eq '2'}">checked="checked" </c:if> />여
				</td>
				
			</tr>
			
			<tr>
				<th rowspan="5">주소</th>
			<tr>
				<td colspan="2">
					<input type="button" value="주소찾기" onclick="searchPostcode();">
				</td>
				
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" name="jbAddress" id="jbAddress" placeholder="도" readonly value="${jbskDto.getJbskAdd1()}">
					<!-- 정확한 용도를 모르겠으나 주소검색 시 검색창 꺼지게 만들어 줌 -->
					<!-- 혹시 추후 주소 파싱해오는데 지장 생기면 body 태그 닫히는 곳 까지 내려버려도 무관함 -->
					<span id="guide" style="color:#999"></span>
				</td>
				
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" id="rdAddress" name="rdAddress" placeholder="시" readonly value="${jbskDto.getJbskAdd2()}">
				</td>
				
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" id="zipcode" name="zipcode" placeholder="구" readonly value="${jbskDto.getJbskAdd3()}">
				</td>
				
			</tr>
			
			<tr>
				<th> 이메일 </th>
				<td colspan="2">
					 <input type="text" name="jbskEmail1" id="jbskEmail1" maxlength="50" value="${jbskDto.getJbskEmail()}">@
                       	 <select name="jbskEmail2" id="jbskEmail2">
                        	    <option>naver.com</option>	
                        	    <option>daum.net</option>
                        	    <option>gmail.com</option>
                         	   <option>nate.com</option>
                         	   <option>직접입력</option>                        
                        </select>
                </td>
               
            </tr>
			<tr>
				<th> 전화번호 </th>
				<td>
					<input class="input" type="text" name="jbskTel" maxlength="15" value="${jbskDto.getJbskTel()}">
					
					<input type="button" value="인증">
				</td>
				<td>
					<input class="telresult" type="text" maxlength="15" readonly>
				</td>
			</tr>
			<tr>
				<th> 사진 </th>
				
				<td colspan="2">
					<input class="input" type="file" name="jbskPic" id="file" onchange="previewImage(this, 'View_area')">
					<div id='View_area' style='position:relative; width: 140px; height: 180px; color: black; border: 0px solid black; dispaly: inline; '></div>
				</td>
	
			</tr>
			<tr>
				<th> 정보수신동의 </th>
				<td colspan="2">
					<input type="radio" name="jbskinfotype" value="1" <c:if test="${jbskDto.getJbskinfotype() eq '1'}">checked="checked" </c:if> />수신안함
					<input type="radio" name="jbskinfotype" value="2" <c:if test="${jbskDto.getJbskinfotype() eq '2'}">checked="checked" </c:if> />메일
					<input type="radio" name="jbskinfotype" value="3" <c:if test="${jbskDto.getJbskinfotype() eq '3'}">checked="checked" </c:if> />SMS
					<input type="radio" name="jbskinfotype" value="4" <c:if test="${jbskDto.getJbskinfotype() eq '4'}">checked="checked" </c:if> />메일, SMS
				</td>
				<td>
					
				</td>
			</tr>
			<tr>	
				<th colspan="3">
					<input class="inputbutton" type="submit" value="수정">
					<input class="inputbutton" type="reset" value="취소" onclick="location='main.do'">
				</th>
			</tr>
		</table>	
	 </form>
	
	<script type="text/javascript">
	//<!--
		var a = document.getElementById("jbskEmail1").value;
		var b = a.replace("@naver.com","");
		document.getElementById("jbskEmail1").value = b;
	//-->
	</script>
	
	<script type="text/javascript">
	//<!--
		var a = document.getElementById("jbskEmail1").value;
		var b = a.replace("@daum.net","");
		document.getElementById("jbskEmail1").value = b;
	//-->
	</script>
	
	<script type="text/javascript">
	//<!--
		var a = document.getElementById("jbskEmail1").value;
		var b = a.replace("@gmail.com","");
		document.getElementById("jbskEmail1").value = b;
	//-->
	</script>
	
	<script type="text/javascript">
	//<!--
		var a = document.getElementById("jbskEmail1").value;
		var b = a.replace("@nate.com","");
		document.getElementById("jbskEmail1").value = b;
	//-->
	</script>
	
	 
	 
	 
</div>
<%@ include file="/setting/design_setting_footer.jsp" %>