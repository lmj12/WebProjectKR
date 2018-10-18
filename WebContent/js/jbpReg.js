



$(document).ready(
	function() {
		$('input:button[name=checkBizID]').on(
				'click',
				function(){
					window.open("jbpBizCheckMove.do","","width=250px, heigt=200px");
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
		

	
///////////////////////////////////////////////////////////////////////////////////////////
		$(settings.passwordID).keyup(
			function() {
				var password = $.trim($(settings.passwordID).val()).length * 1;
				if (password > Math.round(settings.MinCharsPass - 1)) {
					$(this).parents('.form-group').addClass(
							'is-valid');
					$(this).addClass('is-valid');
					$(this).parents('.form-group').removeClass(
							'is-invalid');
					$(this).removeClass('is-invalid');
					var passwordS = $.trim($(settings.passwordID).val());
					$(this).parents('.form-group').find(
							'.text-muted').css('display',
							'none');
				} else if (password < settings.MinCharsPass) {
					$(this).parents('.form-group').addClass(
							'is-invalid');
					$(this).addClass('is-invalid');
					$(this).parents('.form-group').find(
							'.text-muted').text(
							settings.ErrorTextPassword);
					$(this).parents('.form-group').find(
							'.text-muted').css('display',
							'block');
				} else if (password > settings.ComplexMinCharsPass) {
					$(this).parents('.form-group').addClass(
							'is-invalid');
					$(this).addClass('is-invalid');
					$(this).parents('.form-group').find(
							'.text-muted').text(
							settings.ErrorTextComplexPassword);
					$(this).parents('.form-group').find(
							'.text-muted').css('display',
							'block');
				}
			});
		$(settings.rePasswordID).keyup(
			function(){
				var rePassword = $.trim($(settings.rePasswordID).val());
				var password = $(settings.passwordID).val();
				if(rePassword == password){
					$(this).parents('.form-group').addClass(
							'is-valid');
					$(this).addClass('is-valid');
					$(this).parents('.form-group').removeClass(
							'is-invalid');
					$(this).removeClass('is-invalid');
					var passwordS = $.trim($(settings.rePasswordID).val());
					$(this).parents('.form-group').find(
							'.text-muted').css('display',
							'none');
				} else if (rePassword != password){
					$(this).parents('.form-group').addClass(
							'is-invalid');
					$(this).addClass('is-invalid');
					$(this).parents('.form-group').find(
							'.text-muted').text(
							settings.ErrorTextrePassword);
					$(this).parents('.form-group').find(
							'.text-muted').css('display',
							'block');
				}
			});
		
		$(settings.ID).keyup(
			function() {
				var id = $.trim($(settings.ID).val()).length * 1;
				if (id > Math
						.round(settings.MinCharsID - 1)) {
					$(this).parents('.form-group')
							.addClass('is-valid');
					$(this).addClass(
							'is-valid');
					$(this).parents('.form-group')
							.removeClass('is-invalid');
					$(this).removeClass(
							'is-invalid');
					var idS = $.trim($(
							settings.ID).val());
					$(this).parents('.form-group')
							.find('.text-muted').css(
									'display', 'block');
					$.ajax({
							type : "POST",
							data : {
									jobpId :  $('input[name=jobpId]').val()
									},
							url : 'Jbp/idcheck.jsp',
							dataType : 'xml',
							success : function(data){
								$(settings.ID)
								.parents('.form-group')
								.find('.text-muted')
								.text( $(data).find('message').text() );
							},
							error : function(e){
								$('.idresult').val(e.message);
							}
					});
					
				} else if (id < settings.MinCharsID) {
					$(this).parents('.form-group')
							.addClass('is-invalid');
					$(this).addClass(
							'is-invalid');
					$(this)
							.parents('.form-group')
							.find('.text-muted')
							.text(
									settings.ErrorTextId);
					$(this).parents('.form-group')
							.find('.text-muted').css(
									'display', 'block');
				}
			});
			$(settings.telID).keyup(
				function(){
					var tel = $.trim($(settings.telID).val());
					if( tel.indexOf('-') != -1 || tel.length < 9 || tel.length > 11 ){
						$(this).parents('.form-group')
								.addClass('is-invalid');
						$(this).addClass(
								'is-invalid');
						$(this)
								.parents('.form-group')
								.find('.text-muted')
								.text(
										settings.ErrorTextTel);
						$(this).parents('.form-group')
								.find('.text-muted').css(
										'display', 'block');
					} else {
						$(this).parents('.form-group')
								.addClass('is-valid');
						$(this).addClass(
								'is-valid');
						$(this).parents('.form-group')
								.removeClass('is-invalid');
						$(this).removeClass(
								'is-invalid');
						$(this).parents('.form-group')
								.find('.text-muted').css(
										'display', 'none');
					}
				}
			);
			
			// submit 시 액션
			$('#submit').on('click', function() {
				var id = $.trim($(settings.ID).val());
				var passwd = $.trim($(settings.passwordID).val());
				var repasswd = $.trim($(settings.rePasswordID).val());
				var jobpOption = $.trim($(settings.jobpOptionID).val());
				var tel = $.trim($(settings.telID).val());
				if (id == '' || passwd == '' || repasswd == '' || jobpOption == '' || tel == '') {
					alert('입력 칸들을 확인하고 채워주세요');
					$('.form-group').addClass('is-invalid');
					$('.form-control').addClass('is-invalid');
					return false;
				} else if( $(settings.telConfirm).val() == 0 ){
					alert('휴대폰 인증을 하셔야 회원가입을 하실 수 있습니다');
					return false;
				} else if($(settings.ID)
							.parents('.form-group')
							.find('.text-muted')
							.text().indexOf('없')!=-1){
						erroralert("ID 중복여부를 확인해주세요");
						$(settings.ID).focus();
						return false;
				} else {
					var form = $(this);
					$.ajax({
						type : form.attr('method'),
						url : form.attr('action'),
						data : form.serialize()
					}).done(function(data) {
						$("#message").css('display', 'block');
						setTimeout(location.replace('Lgn.do'), 2000);
				      }).fail(function(data) {
				        // Optionally alert the user of an error here...
				      });
					}
				
			});				
		});

//function isValidEmailAddress(emailAddress) {
//	var pattern = new RegExp(
//			/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
//	return pattern.test(emailAddress);
//}



/*$(document).submit(		

function inputcheck(){
	var inputerror="입력형식에 맞지 않습니다.";
	if( !inputform.jobpId.value){
		alert("아이디를 입력하세요");
		inputform.jobpId.focus();
		return false;
	}else if( !inputform.jobpPasswd.value ) {
		alert( "비밀번호를 입력하세요");
		inputform.jobpPasswd.focus();
		return false;
	}else if(inputform.jobpPasswd.value){
		if( inputform.jobpPasswd.value.length <6 || inputform.jobpPasswd.value.length >15) {
		alert( "비밀번호길이를 확인하세요" );
		inputform.jobpPasswd.focus();
		return false;
		}
	}else if(!inputform.rejobpPasswd.value) {
		alert( "비밀번호확인란을 입력하세요" );
		inputform.rejobpPasswd.focus();
		return false;
	} else if(inputform.jobpPasswd.value != inputform.rejobpPasswd.value ) {
		alert( "비밀번호가 일치하지 않습니다." );
		inputform.rejobpPasswd.focus();
		return false;
	}else if(!inputform.jobpTel.value) {
		erroralert( "전화번호를 입력하세요" );
		inputform.jobpTel.focus();
		return false;
	} else if(inputform.jobpTel.value){
			if( inputform.jobpTel.value.length <9 || inputform.jobpPasswd.value.length >11) {
					erroralert( "전화번호길이를 확인하세요" );
					inputform.jobpTel.focus();		
					return false;
			} else if( inputform.jobpTel.value.indexOf( "-" ) != -1 ) {
					erroralert("전화번호에서 '-'를 빼주세요");
					inputform.jobpTel.focus();		
					return false;
			}
	}
	 for (var i=0; i<inputform.jobpId.value.length; i++){
            var ch = inputform.jobpId.value.charAt(i);//문자를 반환(정수형), 범위 검사 가능
            //입력된 문자를 검사
            if ( ( ch < "a" || ch > "z") && (ch < "A" || ch > "Z") && (ch < "0" || ch > "9" ) ){
             alert("아이디는 영문과 숫자로만 입력 가능 합니다!");
             inputform.jobpId.select();
             return false;
            }
     }

	
	
	
	
	//영문, 숫자, 특수문자 2종 이상 혼용해 비밀번호
	var chk =0;
	if(settings.passwordID.search(/[0-9]/g) != -1) chk++;
	if(settings.passwordID.search(/[a-z]/ig) != -1) chk ++;
	if(settings.passwordID.search(/[!@#$%^&*()?_~]/g) != -1) chk++;
	if(chk < 2){
		alert("비밀번호는 숫자, 영문, 특수문자를 두 가지 이상 혼합하여야 합니다.");
		return false;
	}
	
	//동일 숫자 3자리 이상, 동일 문자 3자리 이상이면 안됨
	var SamePass_0 =0; //동일숫자 카운트
	var SamePass_1 =0;	//동일문자 카운트
	var chr_pass_0;
	var chr_pass_1;
	
	for(var i=0; i<settings.passwordID.length; i++){
		chr_pass_0 = settings.passwordID.charAt(i);
		chr_pass_1 = settings.passwordID.charAt(i+1);
		
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
);

*/