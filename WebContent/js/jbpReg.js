
function erroralert( msg ) {
	alert( msg );
	history.back();
} 


$(document).ready(
	function() {
		// FIXME : 개발용 사업자번호 자동입력
		$('input:text[name=jobpBno]').val('1078614075');
		$('.idresult').val("아이디0");
		
		$('input[name=jobpId]').on(
			'keyup',
			function(event){
				
				var keyVal = $(this).val();		
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
                    var inputVal = $(this).val();
                    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));                         
                    var jobpId = $('input[name=jobpId]').val();
					if(jobpId.length<4|| jobpId.length>15) {
						$('.idresult').val("아이디를 4~15자까지 입력해주세요.");
						
					}else{						
						if( jobpId ){
							$.ajax(
								{
									type : "POST",
									data : 
										{
											jobpId :  $('input[name=jobpId]').val()
										},
									url : 'Jbp/idcheck.jsp',
									dataType : 'xml',
									success : function(data){							
										$('.idresult').val($(data).find('message').text());
									},
									error : function(e){
										$('.idresult').val(e.message);
										
									}
								}
							);
							
						}
					} 
				}
				
				
				$('input[name=jobpId]').val()
			}			
		);
		
		//전화번호 - 없이 입력하도록
			$('input[name=jobpTel]').on(
					'keyup',
					function(event){
						var tel = $('input[name=jobpTel]').val();
						if(tel){
							if(($('input[name=jobpTel]').val().indexOf('-')!=-1)||(tel.length<9||tel.length>11)){
								$('.telresult').val("사용할 수 없다");
							}else{
								$('.telresult').val("사용할 수 있다");
							}
						}
						$('input[name=jobpTel]').val()
					}
			);	
		
		$('input[name=jobpPasswd]').on(
				'keyup',
				function(event){
					var jobpPasswd = $('input[name=jobpPasswd').val();
					
					if($('input[name=jobpPasswd]').val().length<6|| $('input[name=jobpPasswd]').val().length>15){
						$('.passwdresult').val("비밀번호를 6~15자까지 입력해주세요.");
					}else{
						if(isNaN(jobpPasswd)){
							$('.passwdresult').val("사용할 수 있는 비밀번호입니다.");
						}else{
							$('.passwdresult').val("영문, 숫자, 특수문자를 혼합해주세요");	
						}
					}
				}
			);
		
		//비밀번호가 같으면 사용할 수 있다
		//다르면 사용할 수 없다
		$('input[name=rejobpPasswd]').on(
			'keyup',
			function(event){
			var repasswd = $('input[name=rejobpPasswd]').val();
			if(isNaN(repasswd)){
				if($('input[name=jobpPasswd]').val()== $('input[name=rejobpPasswd]').val()){
					
					$('.repasswdresult').val('사용할 수 있는 비밀번호입니다.');	// FIXME : (임시)유효성검사 만든 후, 재작업 필요
				}else{
					$('.repasswdresult').val('사용할 수 없는 비밀번호입니다');	// FIXME : (임시)유효성검사 만든 후, 재작업 필요
				}
			}
			$('input[name=rejobpPasswd]').val()
			}
		);
		
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
				    	
				    	bizListCheck();
				    	
				    	function bizListCheck() {
				    		var serviceKey = 'zHRNYJ97QejMrVzKWNS6Hmc8j9Gd8oJ7p4LKd3MfUsTbmSI%2F2v3inaBqZm%2FTDmxvJPYg7gQ1QOEfbnPWE%2FRQvg%3D%3D';
							var jbpName = $('input:text[name=jobpCn]').val();
							var jbpNumber = parseBizID;
							var url = "http://apis.data.go.kr/B552015/NpsBplcInfoInqireService/getBassInfoSearch?serviceKey";
							
							$.ajax(
									{
										type : 'GET',
										url : url,
										data : {
											serviceKey : serviceKey,
										//	wkpl_nm : jbpName,
											bzowr_rgst_no : jbpNumber,
										},
										dataType : 'json',
										success : function(data){
											alert('성공');
											var xmlDoc = data.responseXML;
											document.open();
											document.write(xmlDoc);
										},
										error : function(e){
											alert('error : ' + e);
										}
									}	
							);
				    	}
				    	
				    	result = true ; // OK!
				    } else {
				    	alert('사업자등록번호 형식에 맞지 않습니다');
				        result = false;
				    }
				    return result;
				}
			}
		);	// 사업자번호 유효성 검사
	}
);




var inputerror="입력형식에 맞지 않습니다.";
function inputfocus() {
	inputform.jobpId.focus();
}
function inputcheck(){
	if( !inputform.jobpId.value){
		alert("아이디를 입력하세요");
		inputform.jobpId.focus();
		return false;
	}else if(inputform.jobpId.value){
		if( inputform.jobpId.value.length <4 || inputform.jobpId.value.length >15) {
		alert( "아이디길이를 확인하세요" );
		inputform.jobpId.focus();
		return false;
		}
	}
	
	 for (i=0; i<inputform.jobpId.value.length; i++)
     {
            var ch = inputform.jobpId.value.charAt(i);//문자를 반환(정수형), 범위 검사 가능

            //입력된 문자를 검사

            if ( ( ch < "a" || ch > "z") && (ch < "A" || ch > "Z") && (ch < "0" || ch > "9" ) )
            {
             alert("아이디는 영문과 숫자로만 입력 가능 합니다!");
             inputform.jobpId.select();
             return false;
            }
     }

	
	
	if( ! inputform.jobpPasswd.value ) {
		alert( "비밀번호를 입력하세요");
		inputform.jobpPasswd.focus();
		return false;
	}else if( inputform.jobpPasswd.value.length <6 || inputform.jobpPasswd.value.length >15) {
		alert( "비밀번호길이를 확인하세요" );
		inputform.jobpPasswd.focus();
		return false;
	}else if(! inputform.rejobpPasswd.value) {
		alert( "비밀번호확인란을 입력하세요" );
		inputform.rejobpPasswd.focus();
		return false;
	} else if(inputform.jobpPasswd.value != inputform.rejobpPasswd.value ) {
		alert( "비밀번호가 일치하지 않습니다." );
		inputform.rejobpPasswd.focus();
		return false;
	}else if(! inputform.jobpTel.value) {
		erroralert( "전화번호를 입력하세요" );
		inputform.jobpTel.focus();
		return false;
	} else if(inputform.jobpTel.value){
			if( inputform.jobpTel.value.length <9 || inputform.jobpPasswd.value.length >11) {
					erroralert( "전화번호를 확인하세요" );
					inputform.jobpTel.focus();
					return false;	
			} else if( inputform.jobpTel.value.indexOf( "-" ) != -1 ) {
					erroralert("전화번호에서 '-'를 빼주세요");
					inputform.jobpTel.focus();
					return false;
			}
	}
	//영문, 숫자, 특수문자 2종 이상 혼용해 비밀번호
	var chk =0;
	if(inputform.jobpPasswd.value.search(/[0-9]/g) != -1) chk++;
	if(inputform.jobpPasswd.value.search(/[a-z]/ig) != -1) chk ++;
	if(inputform.jobpPasswd.value.search(/[!@#$%^&*()?_~]/g) != -1) chk++;
	if(chk <2){
		alert("비밀번호는 숫자, 영문, 특수문자를 두 가지 이상 혼합하여야 합니다.");
		return false;
	}
	
	//동일 숫자 3자리 이상, 동일 문자 3자리 이상이면 안됨
	var SamePass_0 =0; //동일숫자 카운트
	var SamePass_1 =0;	//동일문자 카운트
	var chr_pass_0;
	var chr_pass_1;
	
	for(var i=0; i<inputform.jobpPasswd.value.length; i++){
		chr_pass_0 = inputform.jobpPasswd.value.charAt(i);
		chr_pass_1 = inputform.jobpPasswd.value.charAt(i+1);
		
		if(!isNaN(chr_pass_0)){
			//동일숫자 카운트
			if(chr_pass_0 == chr_pass_1){
				SamePass_0 = SamePass_0 +1;
			}
		}else{
			//동일문자 카운트
			if(chr_pass_0 == chr_pass_1){
				SamePass_1 = SamePass_1 +1;
			}
		}
	}
	if(SamePass_0 >= 2){
		alert("동일한 숫자를 연속으로 3번이상 사용할 수 없습니다.");
		return false;
	}
	if(SamePass_1 >= 2){
		alert("동일문자를 연속으로 3번이상 사용할 수 없습니다.");
		return false;
	}
	
}