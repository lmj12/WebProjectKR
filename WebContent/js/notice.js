function noticecheck(){
	if(!noticeform.boardtitle.value){
		alert("제목을 작성해주세요");
		return false;
	}else if(!noticeform.boardContent.value){
		erroralert("공지내용을 써주세요");
		return false;
	}else if(noticeform.boardContent.value ==0){
		erroralert("글을 작성해주세요");
		return false;
	}	
}

function writecheck(){
	if(!writeform.boardContent.value){
		alert("글내용을 작성해주세요");
		return false;
	}
}

function modifycheck(){
	if(!modifyform.boardContent.value){
		alert("글내용을 작성해주세요");
		return false;
	}
	
}

function vlen(){
	 var content = modifyform.boardContent;
	 if(content.value.length>1000){
		erroralert("글자수를 제한해주세요");
		content.value = content.value.substring(0, 1000);
		content.focus();
		return false;
	}else if(content.value.length ==0){
		erroralert("글을 작성해주세요");
		return false;
	}else if(!content.value){
		erroralert("글을 작성해주세요");
		content.focus();
		return false;
	}
}
function len2(){
	var content = writeform.boardContent;
	 if(content.value.length>1000){
		erroralert("글자수를 제한해주세요");
		content.value = content.value.substring(0, 1000);
		content.focus();
		return false;
	}else if(content.value.length ==0){
		erroralert("글을 작성해주세요");
		return false;
	}
}