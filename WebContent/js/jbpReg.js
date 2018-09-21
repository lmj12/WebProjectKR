$(document).ready(
	function() {
		// FIXME : 개발용 사업자번호 자동입력
		$('input:text[name=jobpBno]').val('107-86-14075');
		
		
		$('input[name=jobpId]').on(
			'keyup',
			function(event){
				var jobpId = $('input[name=jobpId]').val();
				var keyVal = $(this).val();
				
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[^a-z]/gi,'')); 
				} else if(jobpId=="") {
					$('.idresult').text("아이디를 입력하지 않았습니다.");
				
					if($('input[name=jobpId]').val().length<4|| $('input[name=jobpId]').val().length>15) {
						$('.idresult').text("아이디를 4~15자까지 입력해주세요.");
					} else if( jobpId ){
						$.ajax(
							{
								type : "POST",
								data : 
									{
										jobpId : jobpId 
									},
								url : 'Jbp/idcheck.jsp',
								dataType : 'xml',
								success : function(data){							
									$('.idresult').text($(data).find('message').text());
								},
								error : function(e){
									$('.idresult').text(e.message);
								}
							}
						);
					}
				}
			}
		);
		//전화번호 - 없이 입력하도록
			$('input[name=jobpTel]').on(
					'keyup',
					function(event){
						var tel = $('input[name=jobpTel]').val();
						if(tel){
							if($('input[name=jobpTel]').val().indexOf('-')!=-1){
								$('.telresult').text("사용할 수 없다");
							}else{
								$('.telresult').text("사용할 수 있다");
							}
						}
						$('input[name=jobpTel]').val()
					}
			);	
		$('input[name=jobpId]').on(
				'keyup',
				function(event){
					var jobpId = $('input[name=jobpId]').val();
					
				}
			);
		$('input[name=jobpPasswd]').on(
				'keyup',
				function(event){
					if($('input[name=jobpPasswd]').val()==""){
						$('.passwdresult').text("비밀번호를 입력하지 않았습니다.");
					}
					if($('input[name=jobpPasswd]').val().length<6|| $('input[name=jobpPasswd]').val().length>15){
						$('.passwdresult').text("비밀번호를 6~15자까지 입력해주세요.");
					}
				}
			);
		
		//비밀번호가 같으면 사용할 수 있다
		//다르면 사용할 수 없다
		$('input[name=rejobpPasswd]').on(
			'keyup',
			function(event){
			var repasswd = $('input[name=rejobpPasswd]').val();
			if(repasswd){
				if($('input[name=jobpPasswd]').val()== $('input[name=rejobpPasswd]').val()){
					
					$('.repasswdresult').text('사용할 수 있는 아이디입니다');	// FIXME : (임시)유효성검사 만든 후, 재작업 필요
				}else{
					$('.repasswdresult').text('사용할 수 없는 아이디입니다');	// FIXME : (임시)유효성검사 만든 후, 재작업 필요
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

