<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp"%>

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
	function disable(){
		$("input[name='pos']").each(function(){
			if($(this).val() != 6  ){
				$(this).prop('checked', false);
			}
		})
	}
	
	function disableAll(){
		$("#all").prop('checked', false);
	}
	
	
	function result(){
		var gender = $("#gender:checked").val();
		var position = '';
		$("input[name='pos']:checked").each(function(){
			position +=  $(this).val() + "," 
		});
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
				var user = $.parseJSON(data);
				if(user!=''){
					var str ='<table border="1"><tr><th>이름 </th><th>ID</th><th>성별</th><th>나이</th><th>전화번호 </th><th>주소</th><th>팀장경력</th><th>스캔경력</th><th>예도경력</th><th>안내경력</th><th>경호경력</th></tr>';
					for (var i =0; i<user.length; i++){
						var birth = (new Date().getFullYear() - new Date(user[i].jbskBd).getFullYear()) + 1;
						str += "<tr onclick='toResume("+i+")'><td>"+user[i].jbskName+"</td>"
							+ "<td id='id"+i+"'>"+user[i].jbskId+"</td>"
						if(user[i].jbskGender == '1'){
							str += "<td>남</td>"
						} else {
							str += "<td>여</td>"
						}
						str += "<td>"+birth+"</td><td>"+user[i].jbskTel+"</td><td>"+user[i].jbskAdd2+" "+user[i].jbskAdd3+"</td><td>"
							+	user[i].reader+"회</td><td>"+user[i].scan+"회</td><td>"+user[i].sword+"회</td><td>"+user[i].guide+"회</td><td>"
							+	user[i].guard+"회</td></tr>"
					}
					str += "</table>"
					$("#temp").html(str);
					
				} else {
					$("#temp").text("검색결과가 없습니다!")
				}
				$("#place").val('주소');
				$("input[name='gender']").each(function(){
					$(this).prop('checked',false);
				})
				disable();
				$("#all").prop('checked', true);
				
			}, error:function(request,status,error){
				alert();
			}
		})
	}
	
	function toResume(i){
		var jbskId = $("#id"+i).text();
		location.href = "rsmDetail.do?jbskId="+jbskId;
	}

</script>
<div class="container">
<h2>이력서 검색 페이지</h2>

<table border="1">
	<tr>
		<th>성별</th>
		<td> <input type="radio" id="gender" name="gender" value="1">남자<input type="radio" id="gender" name="gender" value="2">여자</td>
	</tr>
	<tr>	
		<th>직무</th>
		<td> 
			<input type="checkbox"  name="pos" onclick="disableAll()" value="1">팀장
			<input type="checkbox"  name="pos" onclick="disableAll()" value="2">스캔
			<input type="checkbox"  name="pos" onclick="disableAll()" value="3">예도
			<input type="checkbox"  name="pos" onclick="disableAll()" value="4">안내
			<input type="checkbox"  name="pos" onclick="disableAll()" value="5">경호
			<input type="checkbox" id="all" name="pos" onclick="disable()" value="6" checked>전체
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
	
	

	<div id="temp">
		
	</div>
</div>