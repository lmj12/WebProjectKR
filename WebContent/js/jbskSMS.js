var authNum = 0;

function jbpTelAuth(){
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
				$("#authNum").val(authNum)
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

function jbpAuthCheck(){
	if(authNum!=0){
		var authNumCk = $("#authNumCk").val();
		if(authNumCk == authNum){
			alert("인증에 성공헀습니다.")
			$("#telConfirm").val("1");
		} else {
			alert("인증에 실패했습니다. 인증번호를 다시 확인해주세요.")
		}
	} else {
		alert("문자발송을 먼저 진행해주세요.")
	}
}