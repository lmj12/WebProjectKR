$(document).ready(
		function(){			
			$('input[name=jobpPasswd]').on(
				'keyup',
				function(event){
					var jobpPasswd = $('input[name=jobpPasswd]').val();
					if(jobpPasswd){
						if(isNaN(jobpPasswd)){
							$('.passwdresult').text('사용할 수 있습니다');
						}else{
							$('.passwdresult').text('사용할 수 없습니다.');
						}
					}
					$('input[name=jobpPasswd]').val()
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
					$('.repasswdresult').text('사용할 수 있다');
				}else{
					$('.repasswdresult').text('사용할 수 없다');
				}
			}
			$('input[name=rejobpPasswd]').val()
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
					
		}		
	);