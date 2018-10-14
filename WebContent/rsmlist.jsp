<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
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
            var jibun = data.jibunAddress.split(" ");
            var jibunAdd = jibun[0] +" "+jibun[1] + " " +  jibun[2];
            document.getElementById('place').value = jibunAdd;

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

document.getElementById("inputform").onsubmit = function() {result()};

	function result(){
		var gender = $("#gender:checked").val();
		var position = $("#position:checked").val();
		var place = $("#place").val();
		$.ajax({
	    	method : "POST",
	    	url : "ajaxRsmSearch.do",
	    	cache : false,
			async : false,
			data : {
				gender : gender,
				position : position,
				place : place
			},
			datatype : "json",
			success : function(data){
				
			}, error:function(request,status,error){
				alert();
			}
		})
	}

</script>
<h2>이력서 검색 페이지</h2>

<table border="1">
	<tr>
		<th>성별</th>
		<td> <input type="radio" id="gender" name="gender" value="1">남자<input type="radio" id="gender" name="gender" value="2">여자</td>
	</tr>
	<tr>	
		<th>직무</th>
		<td> 
			<input type="checkbox" id="position" name="pos" value="1">팀장
			<input type="checkbox" id="position" name="pos" value="2">스캔
			<input type="checkbox" id="position" name="pos" value="3">예도
			<input type="checkbox" id="position" name="pos" value="4">안내
			<input type="checkbox" id="position" name="pos" value="5">경호
			<input type="checkbox" id="position" name="pos" value="6">전체
		</td>
	</tr>

	<tr>
		<th>지역</th>
		<td><input type="text" name="place" id="place" placeholder="주소" readonly>					
					<span id="guide" style="color:#999"></span>
						<input type="button" value="주소찾기" onclick="searchPostcode()">
		</td>				
	</tr>
	<tr>
		<th colspan='2'><input type="button" value="검색" onclick='result()'></th>
	</tr>
</table>

	<br><br>	
	
	

	<table id="temp" border="1">
		<tr>
			<th>이름 </th>
			<th>성별</th>
			<th>나이</th>
			<th>전화번호 </th>
			
			<th>주소</th>
			<th>팀장경력</th>
			<th>스캔경력</th>
			<th>예도경력</th>
			<th>안내경력</th>
			<th>경호경력</th>
			<th>기타경력</th>
			
			
		</tr>
		<tr id="see">
			<td id="name">	</td>
			<td id="gen">	</td>
			<td id="age">	</td>
			<td id="tel">	</td>
			<td id="adr">	</td>
			<td id="teamh">	</td>	
			<td id="scan">	</td>
			<td id="wed">	</td>
			<td id="info">	</td>
			<td id="secu">	</td>
			<td id="else">	</td>
		</tr>
	</table>
	
		