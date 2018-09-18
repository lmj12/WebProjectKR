<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<h2> 구직자 회원가입 </h2>

<body onload="loginfocus()">
	<form method="post" action="jbskReg.do" name="jbskReg">
		<table border="1">
			<tr>
				<th colspan="2">
					구직자 회원가입
				</th>
			</tr>
			<tr>
				<th rowspan="3"> 아이디 </th>
			</tr>
			<tr>
				<td> <input class="input" type="text" name="jbskId" maxlength="15" placeholder="아이디를 입력하세요">
			</tr>
			<tr>
				<td>
					Ajax 처리공간입니다.
				</td>
			</tr>
			<tr>
				<th> 패스워드 </th>
				<td>
					<input class="input" type="password" name="jbskPasswd" maxlength="15">
				</td>
			</tr>
			<tr>
				<th rowspan="3"> 비번확인 </th>
			</tr>
			<tr>
				<td>
					<input class="input" type="password" name="jbskRePasswd" maxlength="15">
				</td>
			</tr>
			<tr>
				<td>
					Ajax 처리공간입니다.
				</td>
			</tr>
			<tr>
				<th> 이름 </th>
				<td>
					<input class="input" type="text" name="jbskName" maxlength="15">
				</td>
			</tr>
			<tr>
				<th> 성별 </th>
				<td>
					<input type="radio" name="jbskGender" value="1">남
					<input type="radio" name="jbskGender" value="2">여
				</td>
			</tr>
			
			<tr>
				<th rowspan="5">주소</th>
			<tr>
				<td>
					<input type="button" value="주소찾기">
				</td>
			</tr>
			<tr>
				<td>
					<input class="input" type="text" name="jbskAdd1" maxlength="15">
				</td>
			</tr>
			<tr>
				<td>
					<input class="input" type="text" name="jbskAdd2" maxlength="15">
				</td>
			</tr>
			<tr>
				<td>
					<input class="input" type="text" name="jbskAdd3" maxlength="15">
				</td>
			</tr>
			
			<tr>
				<th> 이메일 </th>
				<td>
					 <input type="input" name="jbskEmail1" maxlength="50">@
                       	 <select name="jbskEmail2">
                        	    <option>naver.com</option>
                        	    <option>daum.net</option>
                        	    <option>gmail.com</option>
                         	   <option>nate.com</option>
                         	   <option>직접입력</option>                        
                        </select>
                </td>
            </tr>
			<tr>
				<th rowspan="2"> 전화번호 </th>
				<td>
					<input class="input" type="text" name="jbskTel" maxlength="25"  placeholder="- 없이 전화번호를 입력하세요">
					<input type="button" value="인증">
				</td>
			<tr>
				<td>
					Ajax 처리공간입니다.
				</td>
			<tr>
			</tr>
			<tr>
				<th> 사진 </th>
				<td>
					<input type="file" name="jbskPic">
				</td>
			</tr>
			<tr>
				<th> 정보수신유형 </th>
				<td>
					<input type="radio" name="jbskInfoType" value="1">전화SMS만 수신
					<input type="radio" name="jbskInfoType" value="2">이메일로만 수신
					<input type="radio" name="jbskInfoType" value="3">둘 다 수신
				</td>
			</tr>
			<tr>	
				<th colspan="2">
					<input class="inputbutton" type="submit" value="가입">
					<input class="inputbutton" type="reset" value="취소">
				</th>
			</tr>
		</table>	
	</form>
</body>


