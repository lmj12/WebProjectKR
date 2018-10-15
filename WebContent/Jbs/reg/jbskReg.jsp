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
<!-- 
<body onload="inputfocus()">
	
	<h2> 구직자 회원가입 </h2>

	<form method="post" action="jbskReg.do" name="jbskReg"> 실시간 처리 전
	<form name="inputform" method="post" action="jbskReg.do" enctype="multipart/form-data" onsubmit="return inputcheck()">
	FIXME : 어디에 쓰이는 지 몰라 주석처리 	
	<input type="hidden" name='confirm' value="0">
		<table border="1">
			<tr>
				<th colspan="3">
					구직자 회원가입
				</th>
			</tr>
			<tr>
				TODO : maxlength DB상의 들어가는 길이 보고 전부 맞춰주세요
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
				<td colspan="2">
					<input class="input" type="text" name="jbskName" maxlength="10">
				</td>
			
			</tr>
			<tr>
				<th> 생년월일 </th>
				<td colspan="2">
					<input class="input" type="date" name="jbskBd">
				</td>
			</tr>
			<tr>
				<th> 성별 </th>
				<td colspan="2">
					<input type="radio" name="jbskGender" value="1">남
					<input type="radio" name="jbskGender" value="2">여
				</td>
				
			</tr>
			
			<tr>
				<th rowspan="5">주소</th>
			<tr>
				<td colspan="2">
					<input type="button" value="주소찾기" onclick="searchPostcode()">
				</td>
				<td>
					
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" name="jbAddress" id="jbAddress" placeholder="도" readonly>
					정확한 용도를 모르겠으나 주소검색 시 검색창 꺼지게 만들어 줌
					혹시 추후 주소 파싱해오는데 지장 생기면 body 태그 닫히는 곳 까지 내려버려도 무관함
					<span id="guide" style="color:#999"></span>
				</td>
				
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" id="rdAddress" name="rdAddress" placeholder="시" readonly>
				</td>
				
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" id="zipcode" name="zipcode" placeholder="구" readonly>
				</td>
				
			</tr>
			
			<tr>
				<th> 이메일 </th>
				<td colspan="2">
					 <input type="text" name="jbskEmail1" maxlength="50"> @ 
                       	 <select name="jbskEmail2" id="jbskEmail2">
                        		<option>naver.com</option>	
                        	    <option>daum.net</option>
                        	    <option>gmail.com</option>
                         	   <option>nate.com</option>
                         	   <option>직접입력</option>    
                        	
                        	    <option value="1">naver.com</option>
                        	    <option value="2">daum.net</option>
                        	    <option value="3">gmail.com</option>
                         	   <option value="4">nate.com</option>
                         	   <option value="5">직접입력</option>                        
                        </select>
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
				<td colspan="2">
					<input type="number" id="authNumCk" maxlength="10" placeholder="인증번호를 입력해주세요.">
					<input type="hidden" id="authCk" value="0">
					<input type="button" value="인증번호확인" onclick="authCheck()">
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
					<input type="radio" name="jbskinfotype" value="1">수신안함
					<input type="radio" name="jbskinfotype" value="2">메일
					<input type="radio" name="jbskinfotype" value="3">SMS
					<input type="radio" name="jbskinfotype" value="4">메일, SMS
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
-->
	
	
	
	
	
	
<body>
	<div class="container" style="margin-top:150px;">
      <h1 class="text-center">구직자 회원가입</h1>

<!-- message -->
<div id="message">
  <div class="alert alert-success" role="alert">
  <strong>회원가입에 성공했습니다!</strong>
  </div>
</div>

      <!-- form -->
      <form name="inputform" action="jbskReg.do" method="POST" enctype="multipart/form-data" onsubmit="return inputcheck()">

        <div class="form-group row">
          <label for="jbskId" class="col-sm-2 col-form-label">아이디</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="jbskId" name="jbskId" placeholder="ID" maxlength="15">
            <small class="text-muted"></small>
          </div>
        </div>

        <div class="form-group row">
          <label for="jbskPasswd" class="col-sm-2 col-form-label">비밀번호</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="jbskPasswd" name="jbskPasswd" placeholder="Password" maxlength="15">
            <small class="text-muted"></small>
          </div>
        </div>
        <div class="form-group row">
          <label for="jbskRePasswd" class="col-sm-2 col-form-label">비밀번호확인</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="jbskRePasswd" placeholder="Password" maxlength="15">
            <small class="text-muted"></small>
          </div>
        </div>
        <div class="form-group row">
          <label for="jbskName" class="col-sm-2 col-form-label">이름</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="jbskName" name="jbskName" placeholder="이름">
            <small class="text-muted"></small>
          </div>
        </div>
        <div class="form-group row">
          <label for="jbskBd" class="col-sm-2 col-form-label">생년월일</label>
          <div class="col-sm-10">
            <input type="date" class="form-control" id="jbskBd" name="jbskBd" placeholder="생년월일">
            <small class="text-muted"></small>
          </div>
        </div>
        <div class="form-group row">
          <label for="jbskGender" class="col-sm-2 col-form-label">성별</label>
          <div class="col-sm-10">
         	 <input type="radio" name="jbskGender" value="1" required>남
			 <input type="radio" name="jbskGender" value="2" required>여
            <small class="text-muted"></small>
          </div>
        </div>
         <div class="form-group row">
          <label for="jbskEmail1" class="col-sm-2 col-form-label">Email</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="jbskEmail1" maxlength="50"> @ 
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
            <small class="text-muted"></small>
          </div>
        </div>
        <div class="form-group row">
          <label for="jbskId" class="col-sm-2 col-form-label">주소</label>
          <div class="col-sm-10">
          	<input type="button" value="주소찾기" onclick="searchPostcode()"><br>
          	<input type="text" name="jbAddress" id="jbAddress" placeholder="도" readonly><br>
      		<input type="text" id="rdAddress" name="rdAddress" placeholder="시" readonly><br>
          	<input type="text" id="zipcode" name="zipcode" placeholder="구" readonly>
            
					<!-- 정확한 용도를 모르겠으나 주소검색 시 검색창 꺼지게 만들어 줌 -->
					<!-- 혹시 추후 주소 파싱해오는데 지장 생기면 body 태그 닫히는 곳 까지 내려버려도 무관함 -->
					<span id="guide" style="color:#999"></span>
          </div>
          <small class="text-muted"></small>
        </div>
        <div class="form-group row">
          <label for="jbskTel" class="col-sm-2 col-form-label">연락처</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="jbskTel" name="jbskTel" 
            	placeholder="지역번호 포함해서 '-'없이 전체전화번호를 입력하세요">
            <input type="button" value="문자발송" onclick="jbpTelAuth()">
            <small class="text-muted"></small>
          </div>
        </div>
        <div class="form-group row">
          <label for="authNumCk" class="col-sm-2 col-form-label">인증번호입력</label>
          <div class="col-sm-10">
            <input type="number" class="form-control" id="authNumCk" name="authNumCk" placeholder="인증번호를 확인해주세요" maxlength="10">
            <input type="hidden" id="authNum" value="0"> 
            <input type="button" value="인증번호확인" onclick="jbpAuthCheck()" size="5">
            <small class="text-muted"></small>
          </div>
        </div>
        <!--    체크박스 폼		-->
		<div class="form-group row">
          <label class="col-sm-2">Checkbox</label>
          <div class="col-sm-10">
            <div class="form-check">
              <label class="form-check-label">
	            <input type="radio" name="jbskinfotype" value="1">수신안함</label>
              <label class="form-check-label">
				<input type="radio" name="jbskinfotype" value="2">메일</label>
			  <label class="form-check-label">
				<input type="radio" name="jbskinfotype" value="3">SMS</label>
			  <label class="form-check-label">
				<input type="radio" name="jbskinfotype" value="4">메일, SMS</label>
            </div>
          </div>
        </div> 
        <div class="form-group row">
          <label for="jbskPic" class="col-sm-2 col-form-label">사진</label>
          <div class="col-sm-10">
        	<input class="input" type="file" name="jbskPic" id="file" onchange="previewImage(this, 'View_area')">
			<div id='View_area' style='position:relative; width: 140px; height: 180px; color: black; border: 0px solid black; dispaly: inline; '></div>
		  </div>
        </div>
		

        <div class="form-group row">
          <div class="offset-sm-2 col-sm-10 text-center">
            <button type="submit" id="submit" class="btn btn-primary" onclick="inputcheck()">가입</button>
            <button type="reset" onclick="location='main.do'">취소</button>
          </div>
        </div>
      </form>
    </div>
    


<!-- end form -->
<!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" integrity="sha384-3ceskX3iaEnIogmQchP8opvBy3Mi7Ce34nWjpBIwVTHfGYWQS9jwHDVRnpKKHJg7" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js" integrity="sha384-XTs3FgkjiBgo8qjEjBk0tGmf3wPrWtA6coPfQDfFEY8AnYJwjalXCiosYRBIBZX8" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js" integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK" crossorigin="anonymous"></script>
 -->
  <script>
  var settings = {

			ID: '#jbskId',
			ErrorTextId: '아이디를 4-15 내로 입력하세요. 영어, 숫자만 가능합니다',
			MinCharsID: '4',
			
			passwordID: '#jbskPasswd',
			ErrorTextPassword: '비밀번호 길이를 6-15자 이내로 입력하세요 ',
			MinCharsPass: '6',
			
			rePasswordID: '#jbskRePasswd',
			ErrorTextrePassword: '비밀번호가 일치하지 않습니다',
			
			emailID: '#inputEmail',
			ErrorTextEmail: 'Enter valid email',
			 
			Tel : '#jbskTel',
			ErrorTextTel : '올바르지 않은 형식의 전화번호입니다',
			ErrorTextTelAuth : '핸드폰 인증을 진행해주세요'			
            }
  </script>
</body>
	
	
	
	
	

<%@ include file="/setting/design_setting_footer.jsp" %>