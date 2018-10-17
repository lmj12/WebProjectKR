<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>

<%@ include file="/setting/setting.jsp" %>
<style>
	header {
	    height: 110px;
	    background: #333;
	    color: white;
	}
	
	#main {
	    padding-top:70px;
	}
	
	.navbar {
	  border-radius: 0;
	  transition: all 0.3s ease-out;
	}
	
	.affix {
	  position: fixed;
	  top: 0;
	  right: 0;
	  left: 0;
	  z-index: 1030;
	}
	
	/* fixed to top styles */
	.affix.navbar {
	  background-color: #333;
	}
	.affix.navbar .nav-item>a, 
	.affix.navbar .navbar-brand {
	    color: #d2dae2;
	}
/* 	table {
		table-layout: fixed;
		margin: 10px 10px 10px 10px;
	} */
	th, td {
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	.container table,
	thead {
		border-radius: 0px 0px 15px 0px;
		background-color: #ffffff;
	}
	table td {
		color: #3d3d3d;
	}
	table th {
		color: #3d3d3d;
		text-align: center;
	}
	.card {
		background-color: #333;
	}
	.card-header {
		background-color: #333;
		color: #d2dae2;
	}
	.card-body {
		background-color: #333;
	}
	li a .nav-style {
		color: white;
	}
		.navbar-light .navbar-nav .nav-link {
    	color: #dcdde1;
	}
	.navbar-light .navbar-nav .nav-link:focus, .navbar-light .navbar-nav .nav-link:hover {
  		color: #f5f6fa;
	}
	.navbar-light .navbar-brand {
  		color: #f5f6fa;
	}
	.navbar-light .navbar-nav .nav-link:focus, .navbar-light .navbar-nav .nav-link:hover {
 		color: #333;
	}
</style>
<style media="screen">
 body { background-color:#4b4b4b; font-family:'Roboto'; color:white;}
 h1 { margin-bottom:50px;}
   .text-center{
     text-align: center;
     font-weight: bold;
   }
   #message{
     display: none;
   }
 </style>
<!DOCTYPE html>
<script type="text/javascript">
//<!--
	function checkBizID() {
			if( !$('input[name=bzowr_rgst_no]').val() ){
				alert("사업자번호를 입력해주세요");
			} else {
				var bizID = $('input[name=bzowr_rgst_no]').val();
			    var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1);
			    var tmpBizID, i, chkSum=0, c2, remander;
			    var result;
			    
			    bizID = bizID.replace(/-/gi,'');	// 들어있는 - 를 모두 빈칸으로 치환함
			 
			    for (i=0; i<=7; i++) {
			        chkSum += checkID[i] * bizID.charAt(i);
			    }
			 
			    c2 = "0" + (checkID[8] * bizID.charAt(8));
			    c2 = c2.substring(c2.length - 2, c2.length);
			    chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1));
			    remander = (10 - (chkSum % 10)) % 10 ;
			 
			    if (Math.floor(bizID.charAt(9)) == remander) {
			    	alert('사업자등록번호 형식에 맞는 번호입니다');
			    	// TODO : 맞는 사업자 등록번호일 시, bizID 앞 6자리 파싱해서 공공데이터 포털날리고
			    	// 폼 만들어서 선택하게끔
			    	var bizName = $('input[name=wkpl_nm]').val();
			    	var parseBizID = bizID.substring(0, 6);
			    	ajaxCk(bizName,parseBizID,bizID)
			    } else {
			    	alert('사업자등록번호 형식에 맞지 않습니다');
			    }

			}
		}
	function ajaxCk(bizName,parseBizID,bizID){
		$.ajax({
				method : 'POST',
				url : 'jbpPublicCheck.do',
				cache : false,
				async : false,
				data : {
					wkpl_nm : bizName,
					bzowr_rgst_no : parseBizID,
				},
				datatype : "text",
				success: function(data){
					if(data!=""){
						var item = $.parseJSON(data);
						var jobpCn = item.wkplNm
						var jobpBno = bizID
						opener.document.getElementById("jobpBno").value = jobpBno;
						opener.document.getElementById("jobpCn").value = jobpCn;
						window.close();
					} else {
						alert("등록된 정보가 없습니다!")
					}
					
	            },
				error : function(request,status,error){
					alert("code : "+request.status+"<br>"
		    				+"message : "+request.responseText+"<br>"
		    				+"error : "+$(error).find('errMsg').html())
				}
			});
		
	}
	$(document).ready(function(){
	      document.body.style.overflow='hidden';  
	      if (navigator.userAgent.indexOf('Chrome')>-1) {  
				    window.resizeTo(550, 350);   
	      }  

	})


//-->
</script>

<div class="container">
	<div class="card">
		<div class="card-header text-center">
			<label>사업자번호를 입력해주세요</label>
		</div>
		<div class="card-body">
			<table class="table table-bordered" border="1">
				<tbody id="t">
					<tr>
						<th>
							업체명
						</th>
						<td>
							<input class="form-control" type="text" id="wkpl_nm" name="wkpl_nm">
						</td>
					</tr>
					<tr>
						<th>
							사업자번호
						</th>
						<td>
							<input class="form-control" type="text" id="bzowr_rgst_no" name="bzowr_rgst_no" maxlength="15">
							<button class="btn btn-primary" id="btn-checkBizId" name="checkBizId" onclick='checkBizID()'>확인</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div id="bizList" class="container">
	
	</div>
</div>


