<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp"%>
<%@ include file="/setting/setting.jsp"%>
<!DOCTYPE html>
<script src="./js/jbpReg.js"></script>
<script src="./js/jbpSMS.js"></script>
<style>
<!-- 회원가입 스타일 -->
	.card {
		background-color: #f5f6fa;
		color: #353b48;
	}
	.card-header {
		background-color: #f5f6fa;
		color: #353b48;
	}
	.card-body {
		background-color: white;
		color: #353b48;
	}
	
</style>
<body>
<!-- 	구버전 (부트스트랩 미적용)
<h2>구인자 회원가입 페이지</h2>
	<form name="inputform" action="jbpReg.do" method="post"
		onsubmit="return inputcheck()">
		<input type="hidden" name='confirm' value="0">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td width="300"><input type="text" name="jobpId"
					placeholder="아이디를 4~15자까지 입력하세요, 영어, 숫자만 가능합니다" size="55" autofocus></td>
				<td><input class="idresult" type="text" readonly></td>
			</tr>
 
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="jobpPasswd"
					placeholder="비밀번호를 영어와 숫자를 사용해 6~15자로 입력하세요" size="55"></td>
				<td><input class="passwdresult" type="text" readonly></td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
				<td><input type="password" name="rejobpPasswd"
					placeholder="같은 비밀번호를 입력하세요" size="55"></td>
				<td><input class="repasswdresult" type="text" readonly>
				</td>
			</tr>

			<tr>
				<th>사업자번호</th>
				<td><input type="text" name="jobpBno" value="1078614075"
					readonly></td>
				<td><input type="button" name="checkBizID" value="확인"></td>
			</tr>
			<tr>
				<th>업체명</th>
				<td><input type="text" name="jobpCn"></td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td><input type="text" name="jobpTel" id="jobpTel"
					placeholder="지역번호 포함해서 '-'없이 전체전화번호를 입력하세요" size="43"> <input
					type="button" value="문자발송" onclick="jbpTelAuth()" size="5">
				</td>
				<td><input class="telresult" type="text" value="전화번호를 입력해주세요"
					readonly></td>
			</tr>
			<tr>
				<th>인증번호 입력</th>
				<td><input type="number" id="authNumCk" maxlength="10" placeholder="인증번호를 입력해주세요." size="43"> <input type="hidden"
					id="authCk" value="0"> <input type="hidden" id="authNum" value="0"> <input type="button" value="인증번호확인"
					onclick="jbpAuthCheck()" size="5"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="가입"> 
				<input type="reset" value="취소" onclick="location='main.do'"></th>
			</tr>
		</table>
	</form>
	 -->

<div class="container" style="margin-top:150px;">
	<!-- message -->
	<div id="message">
	  <div class="alert alert-success" role="alert">
	  <strong>회원가입에 성공하셨습니다<br>3초 뒤 로그인 페이지로 이동합니다</strong>
	  </div>
	</div>
	<div class="card">
		<div class="card-header">
			<h1 class="text-center">구인자 회원가입</h1>
		</div>
		<div class="card-body">
			      <!-- form -->
	      <form name="inputform" action="jbpReg.do" method="post">
	        <div class="form-group row">
	          <label for="jobpId" class="col-sm-2 col-form-label">아이디</label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" id="jobpId" name="jobpId" placeholder="아이디를 4-15 내로 입력하세요. 영어, 숫자만 가능합니다" maxlength="15">
	            <small class="text-muted"></small>
	          </div>
	        </div>
	<!--	이메일 폼        
	         <div class="form-group row">
	          <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
	          <div class="col-sm-10">
	            <input type="email" class="form-control" id="inputEmail" placeholder="Email">
	            <small class="text-muted"></small>
	          </div>
	        </div> -->
	        <div class="form-group row">
	          <label for="jobpPasswd" class="col-sm-2 col-form-label">비밀번호</label>
	          <div class="col-sm-10">
	            <input type="password" class="form-control" id="jobpPasswd" name="jobpPasswd" placeholder="비밀번호 길이를 6-15자 이내로 입력하세요." maxlength="15">
	            <small class="text-muted"></small>
	          </div>
	        </div>
	        <div class="form-group row">
	          <label for="rejobpPasswd" class="col-sm-2 col-form-label">비밀번호확인</label>
	          <div class="col-sm-10">
	            <input type="password" class="form-control" id="rejobpPasswd" name="jobpPasswd" placeholder="Password" maxlength="15">
	            <small class="text-muted"></small>
	          </div>
	        </div>
	        <div class="form-group row">
	          <label for="jobpBno" class="col-sm-2 col-form-label">사업자번호</label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" id="jobpBno" name="jobpBno" value="1078614075" placeholder="사업자번호" readonly>
	            <input type="button" name="checkBizID" value="검색">
	            <small class="text-muted"></small>
	          </div>
	        </div>
	        <div class="form-group row">
	          <label for="jobpCn" class="col-sm-2 col-form-label">업체명</label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" id="jobpCn" name="jobpCn" placeholder="업체명">
	            <small class="text-muted"></small>
	          </div>
	        </div>
	        <div class="form-group row">
	          <label for="jobpTel" class="col-sm-2 col-form-label">연락처</label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" id="jobpTel" name="jobpTel" 
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
	        
	
	        <div class="form-group row">
	          <div class="offset-sm-2 col-sm-10 text-center">
	            <button type="submit" id="submit" class="btn btn-success">가입</button>
	            <button type="reset" class="btn btn-danger" onclick="location='main.do'">취소</button>
	          </div>
	        </div>
	      </form>
	    </div>
		</div>
	</div>
      





    
<!--    체크박스 폼
		<div class="form-group row">
          <label class="col-sm-2">Checkbox</label>
          <div class="col-sm-10">
            <div class="form-check">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox"> Check me out
              </label>
            </div>
          </div>
        </div> 
-->
<!-- end form -->
<!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" integrity="sha384-3ceskX3iaEnIogmQchP8opvBy3Mi7Ce34nWjpBIwVTHfGYWQS9jwHDVRnpKKHJg7" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js" integrity="sha384-XTs3FgkjiBgo8qjEjBk0tGmf3wPrWtA6coPfQDfFEY8AnYJwjalXCiosYRBIBZX8" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js" integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK" crossorigin="anonymous"></script>
 -->
<script>
  var settings = {
//			emailID: '#inputEmail',
//			ErrorTextEmail: 'Enter valid email',
			ID: '#jobpId',
			ErrorTextId: '아이디를 4-15 내로 입력하세요. 영어, 숫자만 가능합니다',
			MinCharsID: '4',
			
			passwordID: '#jobpPasswd',
			ErrorTextPassword: '비밀번호 길이를 6-15자 이내로 입력하세요',
			ErrorTextComplexPassword: '숫자, 영문, 특수문자를 두 가지 이상 혼합하여야 합니다.',
			MinCharsPass: '6',
			ComplexMinCharsPass: '3',
			
			rePasswordID: '#rejobpPasswd',
			ErrorTextrePassword: '비밀번호가 일치하지 않습니다',
			 
			jobpOption : '#jobpBno',
			ErrorTextOption : '사업자번호와 업체명을 확인해주세요',
			
			Tel : '#jobpTel',
			ErrorTextTel : '올바르지 않은 형식의 전화번호입니다',
			ErrorTextTelAuth : '핸드폰 인증을 진행해주세요'
            }
  </script>
</body>

<%@ include file="/setting/design_setting_footer.jsp"%>