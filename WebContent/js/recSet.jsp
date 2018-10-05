<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
var b= (document.getElementsByName("recEnd").value);

var dateTime = (new Date(b));


Date.prototype.toString = function() {
    return `${this.getFullYear()}-${this.getMonth() + 1}-${this.getDate()}''${this.getHours()}:${this.getMinutes()}:${this.getSeconds()}`;
}

var now = new Date();



function writefocus(){
	var x = document.getElementsByName("recEnd").required;
	x=true;
}


function writecheck(){
	if(!recwrite.recEnd.value){
		alert("날짜를 입력해주세요");
		return false;
	}else if(!recwrite.reccontent.value){
		alert("내용을 입력해주세요");
		return false;
	}else if(!recwrite.recSite.value){
		erroralert("사이트를 입력해주세요.");
		return false;
	}else if(rewrite.addpos.clicked == false){
		alert("직무를 설정해주세요");
		return false;
	}else if(document.getElementById('addpos').clicked == false){
		   alert("직무를 선택해주세요");
		   return false;
	}
	if(document.getElementById('confirm').value == 0 ) {
		erroralert( "직무를 선택해주세요" );
		return false;
	}	
}
var cnt = 0;

function add(){
	++cnt;
	var addposx = document.getElementById("addposx");
	var tr = document.createElement("tr");
	for(var i=0; i<10; i++){
	tr.innerHTML = "<select name='posPos"+cnt+"'>"
		+ 	"<option value='1' selected>팀장</option>"	
		+	"<option value='2'>스캔</option>"	
		+	"<option value='3'>예도</option>"	
		+	"<option value='4'>안내</option>"
		+	"<option value='5'>경호</option>"		
		+	"<option value='6'>기타</option>"
		+	"</select>"
		+ 	"&nbsp;"
		+"<input type='button' value='삭제' onclick='delitem("+cnt+")'> ";
		+"<input type='button' value='삭제' onclick='delitem("+cnt+")'> ";
	tr.setAttribute("id", "id_"+cnt);
	//addposx.appendChild(td);
	tr.colSpan =3;
	addposx.appendChild(tr);
	
	}
}

function delitem(){
	var addposx=document.getElementById("addposx");
	var deldiv = document.getElementById("id_"+cnt);
	addposx.removeChild(deldiv);
}






</script>