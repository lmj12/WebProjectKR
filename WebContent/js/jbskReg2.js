$(document).ready(
	function() {
		 jQuery.ajaxSettings.traditional = true; 
		 $.ajaxSettings.traditional = true;

		// FIXME : 개발용 사업자번호 자동입력
		
		$('.idresult').val("아이디0");
		
		$('input[name=jbskId]').on(
			'keyup',
			function(event){
				
				var keyVal = $(this).val();		
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
                    var inputVal = $(this).val();
                    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));                         
                    var jbskId = $('input[name=jbskId]').val();
					if(jbskId.length<4|| jbskId.length>15) {
						$('.idresult').val("아이디를 4~15자까지 입력해주세요.");
						
					}else{						
						if( jbskId ){
							$.ajax(
								{
									type : "POST",
									data : 
										{
											jbskId :  $('input[name=jbskId]').val()
										},
									url : 'Jbs/idcheck.jsp',
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
				
				
				$('input[name=jbskId]').val()
			}			
		);
		
		//전화번호 - 없이 입력하도록
			$('input[name=jbskTel]').on(
					'keyup',
					function(event){
						var tel = $('input[name=jbskTel]').val();
						if(tel){
							if(($('input[name=jbskTel]').val().indexOf('-')!=-1)||(tel.length<9||tel.length>11)){
								$('.telresult').val("사용할 수 없다");
							}else{
								$('.telresult').val("사용할 수 있다");
							}
						}
						$('input[name=jbskTel]').val()
					}
			);	
		
		$('input[name=jbskPasswd]').on(
				'keyup',
				function(event){
					var jbskPasswd = $('input[name=jbskPasswd').val();
					
					if($('input[name=jbskPasswd]').val().length<6|| $('input[name=jbskPasswd]').val().length>15){
						$('.passwdresult').val("비밀번호를 6~15자까지 입력해주세요.");
					}else{
						if(isNaN(jbskPasswd)){
							$('.passwdresult').val("사용할 수 있는 비밀번호입니다.");
						}else{
							$('.passwdresult').val("영문, 숫자, 특수문자를 혼합해주세요");	
						}
					}
				}
			);
		
		//비밀번호가 같으면 사용할 수 있다
		//다르면 사용할 수 없다
		$('input[name=jbskRePasswd]').on(
			'keyup',
			function(event){
			var repasswd = $('input[name=jbskRePasswd]').val();
			if(isNaN(repasswd)){
				if($('input[name=jbskPasswd]').val()== $('input[name=jbskRePasswd]').val()){
					
					$('.repasswdresult').val('사용할 수 있는 비밀번호입니다.');	// FIXME : (임시)유효성검사 만든 후, 재작업 필요
				}else{
					$('.repasswdresult').val('사용할 수 없는 비밀번호입니다');	// FIXME : (임시)유효성검사 만든 후, 재작업 필요
				}
			}
			$('input[name=jbskRePasswd]').val()
			}
		);
		
		
	}
);

	var inputerror="입력형식에 맞지 않습니다.";
	function inputfocus() {
		inputform.jbskId.focus();
	}
	
	function inputcheck(){
		
		var thumbext = document.getElementById("file").value; //파일을 추가한 input 박스의 값
		thumbext = thumbext.slice(thumbext.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
		
		var target = document.getElementById("jbskEmail2");

		
		if( !inputform.jbskId.value){
			alert("아이디를 입력하세요");
			inputform.jbskId.focus();
			return false;
		}else if( inputform.jbskId.value.length <4 || inputform.jbskId.value.length >15) {
			alert( "아이디길이를 확인하세요" );
			inputform.jbskId.focus();
			return false;
		}else if(!inputform.jbskPasswd.value || inputform.jbskPasswd.value == '') {
			alert( "비밀번호를 입력하세요");
			return false;
		}else if( inputform.jbskPasswd.value.length <6 || inputform.jbskPasswd.value.length >15) {
			alert( "비밀번호길이를 확인하세요" );
			return false;
		}else if(! inputform.jbskRePasswd.value) {
			alert( "비밀번호확인란을 입력하세요" );
			return false;
		}else if(inputform.jbskPasswd.value != inputform.jbskRePasswd.value ) {
			alert( "비밀번호가 일치하지 않습니다." );
			return false;
		}else if(! inputform.jbskName.value) {
			alert( "이름을 입력하세요" );
			return false;
		} else if(! inputform.jbskBd.value) {
			alert( "생년월일을 선택하세요" );
			return false;
		}else if(! inputform.jbskGender.value) {
			alert( "성별을 선택하세요" );
			return false;
		}else if(! inputform.jbAddress.value) {
			alert( "주소찾기를 이용하여 주소를 선택하세요" );
			return false;
		}else if(! inputform.rdAddress.value) {
			alert( "주소찾기를 이용하여 주소를 선택하세요" );
			return false;
		}else if(! inputform.zipcode.value) {
			alert( "주소찾기를 이용하여 주소를 선택하세요" );
			return false;
		}else if(! inputform.jbskEmail1.value) {
			alert( "이메일을 입력하세요" );
			return false;
		}else if(! inputform.jbskEmail2.value) {
			alert( "이메일 종류를 선택하세요" );
			return false;
		}else if( (inputform.jbskEmail1.value.indexOf("@") != -1 ) && (target.options[target.selectedIndex].text == "naver.com")){
			alert( "알맞은 이메일 형식을 입력하세요");
			return false;
		}else if( (inputform.jbskEmail1.value.indexOf("@") != -1 ) && (target.options[target.selectedIndex].text == "daum.net")){
			alert( "알맞은 이메일 형식을 입력하세요");
			return false;
		}else if( (inputform.jbskEmail1.value.indexOf("@") != -1 ) && (target.options[target.selectedIndex].text == "gmail.com")){
			alert( "알맞은 이메일 형식을 입력하세요");
			return false;
		}else if( (inputform.jbskEmail1.value.indexOf("@") != -1 ) && (target.options[target.selectedIndex].text == "nate.com")){
			alert( "알맞은 이메일 형식을 입력하세요");
			return false;
		}else if( (inputform.jbskEmail1.value.indexOf("@") == -1 ) && (target.options[target.selectedIndex].text == "직접입력")){
			alert( "알맞은 이메일 형식을 입력하세요");
			return false;
		}else if(! inputform.jbskTel.value) {
			alert( "전화번호를 입력하세요" );
			return false;
		}else if(( inputform.jbskTel.value.length <9 || inputform.jbskPasswd.value.length >11) 
		||( inputform.jbskTel.value.indexOf( "-" ) != -1) ){
			alert( "전화번호를 확인하세요" );
			return false;	
		}else if(! inputform.jbskPic.value) {
			alert( "사진을 업로드하세요" );
			console.log(thumbext);
			return false;
		} else if(thumbext != "jpg" && thumbext != "png"){ //확장자를 확인합니다.
			alert('이미지 파일은 jpg, png만 등록 가능합니다.');
			return false;
		}
		
		else if(! inputform.jbskinfotype.value) {
			alert( "정보수신동의를 선택하세요" );
			return false;
		}
		
		//영문, 숫자, 특수문자 2종 이상 혼용해 비밀번호
		var chk =0;
		if(inputform.jbskPasswd.value.search(/[0-9]/g) != -1) chk++;
		if(inputform.jbskPasswd.value.search(/[a-z]/ig) != -1) chk ++;
		if(inputform.jbskPasswd.value.search(/[!@#$%^&*()?_~]/g) != -1) chk++;
		if(chk <2){
			alert("비밀번호는 숫자, 영문, 특수문자를 두 가지 이상 혼합하여야 합니다.");
			return false;
		}
		
		//동일 숫자 3자리 이상, 동일 문자 3자리 이상이면 안됨
		var SamePass_0 =0; //동일숫자 카운트
		var SamePass_1 =0;	//동일문자 카운트
		var chr_pass_0;
		var chr_pass_1;
		
		for(var i=0; i<inputform.jbskPasswd.value.length; i++){
			chr_pass_0 = inputform.jbskPasswd.value.charAt(i);
			chr_pass_1 = inputform.jbskPasswd.value.charAt(i+1);
			
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
	

