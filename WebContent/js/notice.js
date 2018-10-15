function noticecheck(){
	if(!noticeform.boardtitle.value){
		alert("제목을 작성해주세요");
		return false;
	}else if(!noticeform.boardContent.value){
		erroralert("공지내용을 써주세요");
		return false;
	}
	
}