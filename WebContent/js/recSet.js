
var a = new Date();
var b = new Date(recwrite.recEnd.value);


if((a -b)==0){
	alert("날짜가 같습니다");
	return false;
}else if(a>b){
	alert("날짜를 다시 설정해주세요");
	return false;
}else if(!recwrite.recEnd.value){
	alert("날짜를 입력해주세요");
	return false;
}