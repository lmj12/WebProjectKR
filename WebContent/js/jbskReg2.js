$(document).ready(
	function() {
		 jQuery.ajaxSettings.traditional = true; 
		 $.ajaxSettings.traditional = true;

		// FIXME : 개발용 사업자번호 자동입력
		
		$('.idresult').val(" ");
		
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
	
function telAuth(){
	authNum = Math.floor(Math.random()*1000000);
	var tel = $("#jbskTel").val();
	$.ajax({
    	method : "POST",
    	url : "ajaxSendSMS.do",
    	cache : false,
		async : false,
		data : {
			authNum : authNum,
			tel : tel
		},
		datatype : "text",
		success : function(data){
			if(data == 200){
				alert("문자를 발송했습니다.")
			} else if(data == 412){
				alert("핸드폰 번호를 확인해주세요.")
			} else {
				alert("에러가 발생헀습니다. 잠시 후 다시 시도해주세요.")
			}
		}, error:function(request,status,error){
			alert("오류가 발생했습니다. 다시 시도해주세요.");
		}
	})
}

function authCheck(){
	if(authNum!=0){
		var authNumCk = $("#authNumCk").val();
		if(authNumCk == authNum){
			alert("인증에 성공헀습니다.")
			$("#authCk").val("1");
		} else {
			alert("인증에 실패했습니다. 인증번호를 다시 확인해주세요.")
		}
	} else {
		alert("문자발송을 먼저 진행해주세요.")
	}
}

function previewImage(targetObj, View_area) {
	var preview = document.getElementById(View_area); //div id
	var ua = window.navigator.userAgent;

  //ie일때(IE8 이하에서만 작동)
	if (ua.indexOf("MSIE") > -1) {
		targetObj.select();
		try {
			var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
			var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


			if (ie_preview_error) {
				preview.removeChild(ie_preview_error); //error가 있으면 delete
			}

			var img = document.getElementById(View_area); //이미지가 뿌려질 곳

			//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
			img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
		} catch (e) {
			if (!document.getElementById("ie_preview_error_" + View_area)) {
				var info = document.createElement("<p>");
				info.id = "ie_preview_error_" + View_area;
				info.innerHTML = e.name;
				preview.insertBefore(info, null);
			}
		}
  //ie가 아닐때(크롬, 사파리, FF)
	} else {
		var files = targetObj.files;
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
			if (!file.type.match(imageType))
				continue;
			var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
			if (prevImg) {
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img"); 
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '140px'; 
			img.style.height = '180px';
			preview.appendChild(img);
			if (window.FileReader) { // FireFox, Chrome, Opera 확인.
				var reader = new FileReader();
				reader.onloadend = (function(aImg) {
					return function(e) {
						aImg.src = e.target.result;
					};
				})(img);
				reader.readAsDataURL(file);
			} else { // safari is not supported FileReader
				//alert('not supported FileReader');
				if (!document.getElementById("sfr_preview_error_"
						+ View_area)) {
					var info = document.createElement("p");
					info.id = "sfr_preview_error_" + View_area;
					info.innerHTML = "not supported FileReader";
					preview.insertBefore(info, null);
				}
			}
		}
	}
}
