/*
 * 사업자 등록번호 유효성검사
 * 
 */

$(document).ready(
	function (){
		$('input:button[name=checkBizID]').on(
			'click',
			function checkBizID() {
				if( !$('input:text[name=jobpBno]').val() ){
					alert("사업자번호를 입력해주세요");
					return false;
				} else {
					var bizID = $('input:text[name=jobpBno]').val();
				    var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1);
				    var tmpBizID, i, chkSum=0, c2, remander;
				    var result;
				    
				    bizID = bizID.replace(/-/gi,'');	// 들어있는 - 를 모두 빈칸으로 치환함
				 
				    for (i=0; i<=7; i++) {
				        chkSum += checkID[i] * bizID.charAt(i);
				    }
				 
				    c2 = "0" + (checkID[8] * bizID.charAt(8));
				    c2 = c2.substring(c2.length - 2, c2.length);
				    chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1));
				    remander = (10 - (chkSum % 10)) % 10 ;
				 
				    if (Math.floor(bizID.charAt(9)) == remander) {
				    	alert('사업자등록번호 형식에 맞는 번호입니다');
				    	// TODO : 맞는 사업자 등록번호일 시, bizID 앞 6자리 파싱해서 공공데이터 포털날리고
				    	// 폼 만들어서 선택하게끔
				    	var bizName = $('input:text[name=jobpCn]').val();
				    	var parseBizID = bizID.substring(0, 6);
				    	alert(parseBizID)
				    	result = true ; // OK!
				    } else {
				    	alert('사업자등록번호 형식에 맞지 않습니다');
				        result = false;
				    }
				    return result;
				}
			}
		);
	}
);