$(document).ready(
		function(){
			// TODO : 주석 좀 많이 달아주세요 
			$('input[name=jobpId]').on(
				'keyup',
				function(event){
					var jobpId = $('input[name=jobpId]').val();
					
					if( jobpId){
						$.ajax({
							type : "POST",
							data : {
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
						});
					}
				}
			);
			
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
					
		}		
	);