<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp"%>
<%@ include file="/setting/setting.jsp"%>
<!DOCTYPE html>
<script src="${js}jbpReg.js"></script>
<script src="${js}jbpSMS.js"></script>
<h2>구인자 회원가입 페이지</h2>
<body onload="inputfocus()">
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
				<td><input type="number" id="authNumCk" maxlength="10"
					placeholder="인증번호를 입력해주세요." size="43"> <input type="hidden"
					id="authCk" value="0"> <input type="hidden" id="authNum"
					value="0"> <input type="button" value="인증번호확인"
					onclick="jbpAuthCheck()" size="5"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="가입"> <input
					type="reset" value="취소" onclick="location='main.do'"></th>
			</tr>
		</table>
	</form>













<div class="container" style="margin-top:150px;">
      <h1 class="text-center">구인자 회원가입</h1>

<!-- message -->
<div id="message">
  <div class="alert alert-success" role="alert">
  <strong>회원가입에 성공했습니다!</strong>
  </div>
</div>

      <!-- form -->
      <form method="post">
        <div class="form-group row">
          <label for="inputCustom" class="col-sm-2 col-form-label">아이디</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="inputCustom" placeholder="Custom input" maxlength="15">
            <small class="text-muted"></small>
          </div>
        </div>
        <div class="form-group row">
          <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
          <div class="col-sm-10">
            <input type="email" class="form-control" id="inputEmail" placeholder="Email">
            <small class="text-muted"></small>
          </div>
        </div>
        <div class="form-group row">
          <label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword" placeholder="Password" maxlength="15">
            <small class="text-muted"></small>
          </div>
        </div>
        <div class="form-group row">
          <label for="rePassword" class="col-sm-2 col-form-label">비밀번호확인</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="rePassword" placeholder="rePassword" maxlength="15">
            <small class="text-muted"></small>
          </div>
        </div>
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
        <div class="form-group row">
          <div class="offset-sm-2 col-sm-10">
            <button type="button" id="submit" class="btn btn-primary">Sign in or Send</button>
          </div>
        </div>
      </form>
    </div>
<!-- end form -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" integrity="sha384-3ceskX3iaEnIogmQchP8opvBy3Mi7Ce34nWjpBIwVTHfGYWQS9jwHDVRnpKKHJg7" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js" integrity="sha384-XTs3FgkjiBgo8qjEjBk0tGmf3wPrWtA6coPfQDfFEY8AnYJwjalXCiosYRBIBZX8" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js" integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK" crossorigin="anonymous"></script>
<script src="svd.js"></script>
  <script>
  var settings = {
			//  set #id for validation email
			emailID: '#inputEmail',
			//  set text for validation email
			ErrorTextEmail: 'Enter valid email',
			 
			//  set #id for validation password
			passwordID: '#inputPassword',
			//  set text for validation password
			ErrorTextPassword: '비밀번호 길이를 6-15자 이내로 입력하세요 ',
			//  set value required chars for validation password
			MinCharsPass: '6',
			
			//  set #id for validation password
			rePasswordID: '#rePassword',
			//  set text for validation password
			ErrorTextrePassword: '비밀번호가 일치하지 않습니다',
			 
			//  set #id for validation custom
			Custom: '#inputCustom',
			//  set text for validation password
			ErrorTextCustom: '아이디를 4-15 내로 입력하세요. 영어, 숫자만 가능합니다',
			//  set value required chars for validation custom form
			MinCharsCustom: '4'
            }
  </script>
</body>

<%@ include file="/setting/design_setting_footer.jsp"%>