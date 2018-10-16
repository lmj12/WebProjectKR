
// Daum Api 주소 검색 

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
            document.getElementById('recSite').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('recSite').value = fullRoadAddr;
            document.getElementById('recSite').value = data.jibunAddress;
            document.getElementById('ok').value = 1;
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

	// Date Picker
	$(document).find('.from, .to').addClass('hasDatepicker').datepicker();	

	var dateFormat = 
		"mm/dd/yy",
		from = $( ".from" ).datepicker({
				language : "kr",
				defaultDate: "+1w",
				changeMonth: true,
			}),
		to = $( ".to" ).datepicker({
				language : "kr",
				defaultDate: "+1w",
				changeMonth: true,
			});
	function getDate( element ) {
		var date;
		try {
			date = $.datepicker.parseDate( dateFormat, element.value );
		} catch( error ) {
			date = null;
		}
		return date;
	}
	
	// 기간 산출 및 출력
	$(document).on(
		'change',
		'.from',
		function(event){
			var stDate = new Date( $(this).val() );
		    var edDate = new Date( $(this).parent('td').siblings('td').find('.to').val() );
		    var btMs = edDate.getTime() - stDate.getTime() ;
		    var btDay = btMs / (1000*60*60*24) ;
		    
		    if( $(this).parent('td').siblings().find('.fromTo').val() != NaN){
		    	if(btDay >= 30){
		    		btDay = btDay / 30;
		    		$(this).parent('td').siblings('td').find('.fromTo').val(parseInt(btDay) + ' 개월');
		    	} else {
		    		$(this).parent('td').siblings('td').find('.fromTo').val('1 개월');
		    	}
		    }
		}
	);
	$(document).on(
		'change',
		'.to',
		function(event){
			var stDate = new Date( $(this).parent('td').siblings('td').find('.from').val() );
		    var edDate = new Date( $(this).val() );
		    var btMs = edDate.getTime() - stDate.getTime() ;
		    var btDay = btMs / (1000*60*60*24) ;
		    
			if( $(this).parent('td').siblings().find('.fromTo').val() != NaN){
		    	if(btDay >= 30){
		    		btDay = btDay / 30;
		    		$(this).parent('td').siblings('td').find('.fromTo').val(parseInt(btDay) + ' 개월');
		    	} else {
		    		$(this).parent('td').siblings('td').find('.fromTo').val('1 개월');
		    	}
			}
		}
	);
	
	

function writefocus(){
	var x = document.getElementsByName("recEnd").required;
	x=true;
}

function len(){
	var content =recwrite.reccontent;
	 if(content.value.length>1000){
			erroralert("글자수를 제한해주세요");
			content.value = content.value.substring(0, 1000);
			content.focus();
			return false;
		}
}
function writecheck(){	
	if(!recwrite.recEnd.value){
		alert("날짜를 입력해주세요");
		return false;
	}else if(!recwrite.reccontent.value){
		alert("내용을 입력해주세요");
		return false;
	}else if( recwrite.confirm.value == 0 ) {
		erroralert( "직무를 선택해주세요");
		recwrite.confirm.focus();
		return false;
	}else if(!recwrite.recEnd.value){
		alert("날짜를 입력해주세요");
		return false;
	}else if(!recwrite.recEndTime.value){
		alert("시간을 입력해주세요");
		return false;
	}else if(recwrite.ok.value ==0){
		erroralert("주소찾기 버튼을 눌러주세요");
		recwrite.ok.focus();
		return false;
	}
	var elem = document.getElementsByName('posPos') ;
	
	var points = []; 
	for(var i=0 ;i<elem.length ;i++){  
	    if (elem[i].value){  
	    points.push(elem[i].value);   
	    } 
	} 
	var id= document.getElementById('id');
	id.setAttribute("value", points);
	
}


//모집상태 변경
function change(){
	var target = document.getElementById("sta");
	var t = target.options[target.selectedIndex].value;
		
	var val = document.getElementById("val");
	val.setAttribute("value", t);

}

//직무추가
function add(){
	++cnt;
	var addposx = document.getElementById("addposx");
	var tr = document.createElement("tr");
	tr.innerHTML = "<select id='s"+cnt+"' name='posPos'>"
		+ 	"<option value='1' selected>팀장</option>"	
		+	"<option value='2'>스캔</option>"	
		+	"<option value='3'>예도</option>"	
		+	"<option value='4'>안내</option>"
		+	"<option value='5'>경호</option>"		
		+	"<option value='6'>기타</option>"
		+	"</select>"
		+ 	"&nbsp;"
		+"<input type='button' value='삭제' onclick='delitem("+cnt+")'> ";
		+"<input type='button' value='삭제' onclick='delitem("+cnt+")'> ";
	tr.setAttribute("id", "id_"+cnt);
	//addposx.appendChild(td);

	addposx.appendChild(tr);
	
	document.recwrite.confirm.value =1;
	
}
//직무제거

function delitem(cnt){
	var addposx = document.getElementById("addposx");	
	var deldiv = document.getElementById("id_"+cnt); 
	addposx.removeChild(deldiv);
}