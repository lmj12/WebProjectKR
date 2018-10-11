$(document).ready(
	function (){
		$('input:button[name=checkBizID]').on(
			'click',
			function(){
				window.open(this);
				var rowItem = '<table>';
				
				rowItem += '</table>';
			}
		);
		
		function checkBizID() {
			if( !$('input:text[name=jbpNumber]').val() ){
				alert("사업자번호를 입력해주세요");
				return false;
			} else {
				alert("체크");
				var bizID = $('input:text[name=jbpNumber]').val();
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
			    	result = true ; // OK!
			    } else {
			    	alert('사업자등록번호 형식에 맞지 않습니다');
			        result = false;
			    }
			    return result;
			}
		}
		
	}
);