<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 구직자 회원가입 </title>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
</head>
<body>

	<script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function searchPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('rdAddress').value = fullRoadAddr;
	                document.getElementById('jbAddress').value = data.jibunAddress;
	
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	
	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	
	                } else {
	                    document.getElementById('guide').innerHTML = '';
	                }
	            }
	        }).open();
	    }
	</script>
	
	<h2> 구직자 회원가입 </h2>

	<form method="post" action="jbskReg.do" name="jbskReg">
		<table border="1">
			<tr>
				<th colspan="2">
					구직자 회원가입
				</th>
			</tr>
			<tr>
				<th> 아이디 </th>
				<td> <input class="input" type="text" name="jbskId" maxlength="15">
			</tr>
			<tr>
				<th> 패스워드 </th>
				<td>
					<input class="input" type="password" name="jbskPasswd" maxlength="15">
				</td>
			</tr>
			<tr>
				<th> 비번확인 </th>
				<td>
					<input class="input" type="password" name="jbskRePasswd" maxlength="15">
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
					<input type="button" value="주소찾기" onclick="searchPostcode()">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="jbAddress" placeholder="지번주소" readonly>
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
					<input class="input" type="text" name="jbskTel" maxlength="15">
					<input type="button" value="인증">
				</td>
			<tr>
				<td>
					'- 제외하고 입력하세요'
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
				<th> 포지션 </th>
				<td>
					<input type="checkbox" name="jbskInfoType" value="1">업무1
					<input type="checkbox" name="jbskInfoType" value="2">업무2
					<input type="checkbox" name="jbskInfoType" value="3">업무3
					<input type="checkbox" name="jbskInfoType" value="4">업무4
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


</html>