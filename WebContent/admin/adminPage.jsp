<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>
<!DOCTYPE html>

<h2>관리자 페이지</h2>


<script type="text/javascript">
	//<!--
	function getAdminPage() {
		var pageSlt = $("#adminpage option:selected").val();
		
		if(pageSlt == 1){
			gongji();
		}else if(pageSlt == 2){
			gonggo();
		}else if(pageSlt == 3){
			singo();
		}else if(pageSlt ==4){ // 구직자 회원 정렬
			jbskGet2();
		}else if(pageSlt ==5){ // 구인자 회원 정렬
			jobpGet2();
		}
		
	}
	
	
	function jbskGet2() {
		var jbskId = $("#jbskId").val();
		$.ajax({
		    method : "POST",
		    url : "ajaxJbskGet.do",
	    	cache : false,
			async : false,
			datatype : "json",
			success : function(data){
				var user = $.parseJSON(data);
					if(data){
						var str = ''
						str = "<table border='1'><tr><th>아이디</th><th>패스워드</th><th>등록일</th><th>이름</th><th>성별</th><th>생년월일</th><th>주소1</th><th>주소2</th><th>주소3</th><th>이메일</th><th>전화</th><th>정보수신유형</th><th>회원삭제</th></tr>"
						for (var i=0; i<user.length; i++){	
							
							var reg1 = new Date(user[i].jbskregdate);
							var reg2 = reg1.toLocaleDateString(); 
							
							var sysdate = new Date(user[i].jbskBd);
							var sysdate2 = sysdate.toLocaleDateString();
							
							if(user[i].jbskGender == 1){	// int 유형으로 받는 성별과 정보수신유형을 알맞은 값으로 변환
								user[i].jbskGender = "남성";
							}else{
								user[i].jbskGender = "여성";
							}
							
							if(user[i].jbskinfotype == 1){
								user[i].jbskinfotype = "수신 안함";
							}else if(user[i].jbskinfotype == 2){
								user[i].jbskinfotype = "메일";
							}else if(user[i].jbskinfotype == 3){
								user[i].jbskinfotype = "SMS";
							}else {
								user[i].jbskinfotype = "메일, SMS";
							}
							
							str += "<tr><input type='hidden' id='js"+i+"' value='"+user[i].jbskId+"'><td>"+user[i].jbskId+"</td><td>"+user[i].jbskPasswd+"</td><td>"+reg2+"</td><td>"+user[i].jbskName+"</td><td>"+user[i].jbskGender+"</td><td>"+sysdate2+"</td><td>"+user[i].jbskAdd1+"</td><td>"+user[i].jbskAdd2+"</td><td>"+user[i].jbskAdd3+"</td><td>"+user[i].jbskEmail+"</td><td>"+user[i].jbskTel+"</td><td>"+user[i].jbskinfotype+"</td><td><input type='button' value='회원삭제' onclick='jbskDELinADM("+i+")'></td><tr>"
						}
						str += "</table>"
						$("#rst").html(str);
					} else {
						$("#rst").html("검색결과가 없습니다.");
					}
				}
			
		})
		
	}
	
	function jobpGet2() {
		var jobpId = $("#jobpId").val();
		$.ajax({
		    method : "POST",
		    url : "ajaxJobpGet.do",
	    	cache : false,
			async : false,
			datatype : "json",
			success : function(data){
				var user = $.parseJSON(data);
					if(data){
						var str = ''
						str = "<table border='1'><tr><th>아이디</th><th>패스워드</th><th>등록일</th><th>업체명</th><th>사업자번호</th><th>전화번호</th><th>회원삭제</th></tr>"
						
						for (var i=0; i<user.length; i++){	

							var reg1 = new Date(user[i].jobpRegdate);
							var reg2 = reg1.toLocaleDateString(); 
							
							
							str += "<tr><input type='hidden' id='jp"+i+"' value='"+user[i].jobpId+"'><td>"+user[i].jobpId+"</td><td>"+user[i].jobpPasswd+"</td><td>"+reg2+"</td><td>"+user[i].jobpCn+"</td><td>"+user[i].jobpBno+"</td><td>"+user[i].jobpTel+"</td><td><input type='button' value='회원삭제' onclick='jobpDELinADM("+i+")'></td><tr>"
						}
						str += "</table>"
						$("#rst").html(str);
					} else {
						$("#rst").html("검색결과가 없습니다.");
					}
				}
			
		})
		
	}
	
	function gongji(){
		$.ajax({
		    method : "POST",
		    url : "ajaxAdmBoard.do",
	    	cache : false,
			async : false,
			datatype : "json",
			success : function(data){
				var articles = $.parseJSON(data);
				if(data){
					var str = ''
					str = "<table border='1'><tr><th>제목</th><th>작성자</th><th>작성날자</th></tr>"
					for (var i=0; i<articles.length; i++){
						str += "<tr onclick='toArticle("+articles[i].boardId+")'><td>"+articles[i].boardTitle+"</td><td>"+articles[i].boarduserId+"</td><td>"+articles[i].boardregTime+"</td></tr>"
					}
					str += "<tr><th colspan='3'><input type='button' value='글 작성' onclick='noticeWrt()'><input type='button' value='글 목록' onclick='notice()'></th></tr></table>"
					$("#rst").html(str);
				} else {
					$("#rst").text("검색 결과가 없습니다. 아이디를 다시 확인해 주세요.")
				}
			}
		})
	}
	
	
	function gonggo(){
		$.ajax({
		    method : "POST",
		    url : "ajaxAdmRec.do",
	    	cache : false,
			async : false,
			datatype : "json",
			success : function(data){
				var recs = $.parseJSON(data);
				if(data){
					var str = ''
					str = "<table border='1'><tr><th>업체명</th><th>작성자</th><th>시작일</th><th>종료일</th><th>상태</th><th>공고삭제</th></tr>"
					for (var i=0; i<recs.length; i++){	
						str += "<tr onclick='toRecruit("+recs[i].recId+")'><input type='hidden' id='gonggo"+i+"' value='"+recs[i].recId+"'><td>"+recs[i].jobpCn+"</td><td>"+recs[i].jobpId+"</td><td>"+recs[i].stime+"</td><td>"+recs[i].etime+"</td>"
						if(recs[i].recStatus==0){
							str += "<td>모집중</td>"
						} else if(recs[i].recStatus==1){
							str += "<td>모집완료</td>"
						} else if(recs[i].recStatus==2){
							str += "<td>완료</td>"
						}
						str += "<td onclick='event.cancelBubble=true;'><input type='button' value='공고삭제' onclick='gongoDELinADM("+i+")'></td></tr>"
					}
					$("#rst").html(str);
				} else {
					$("#rst").text("검색 결과가 없습니다. 아이디를 다시 확인해 주세요.")
				}
			}
		})
	}
		
	function toRecruit(recId){
		location.href = "recView.do?recId="+recId+"&pageNum=1";
	}
	
	function gongoDELinADM(i){
		var recId = $("#gonggo"+i).val()
		$.ajax({
		    method : "POST",
		    url : "ajaxgongoDELinADM.do",
	    	cache : false,
			async : false,
			data : {
				recId : recId
			},
			datatype : "text",
			success : function(data){
				if(data==1){
					alert("삭제완료")
					gonggo();
				} else {
					alert("삭제에 실패했습니다. 잠시 후 다시 시도해주세요.")
				}
			}, error:function(request,status,error){
    		    alert("서버와 연결이 좋지 않습니다. 잠시 후 다시 시도해주세요.")
    		}
		})
	}
	
	function jbskDELinADM(i){
		var jbskId = $("#js"+i).val()
		$.ajax({
		    method : "POST",
		    url : "ajaxjbskDelinADM.do",
	    	cache : false,
			async : false,
			data : {
				jbskId : jbskId
			},
			datatype : "text",
			success : function(data){
				if(data==1){
					alert("삭제완료")
					jbskGet2();
				} else {
					alert("삭제에 실패했습니다. 잠시 후 다시 시도해주세요.")
				}
			}, error:function(request,status,error){
    		    alert("서버와 연결이 좋지 않습니다. 잠시 후 다시 시도해주세요.")
    		}
		})
	}
	
	function jobpDELinADM(i){
		var jobpId = $("#jp"+i).val()
		$.ajax({
		    method : "POST",
		    url : "ajaxjobpDelinADM.do",
	    	cache : false,
			async : false,
			data : {
				jobpId : jobpId
			},
			datatype : "text",
			success : function(data){
				if(data==1){
					alert("삭제완료")
					jobpGet2();
				} else {
					alert("삭제에 실패했습니다. 잠시 후 다시 시도해주세요.")
				}
			}, error:function(request,status,error){
    		    alert("서버와 연결이 좋지 않습니다. 잠시 후 다시 시도해주세요.")
    		}
		})
		
	}
		
	
	function singo(){
		$.ajax({
		    method : "POST",
		    url : "ajaxAdmBoard2.do",
	    	cache : false,
			async : false,
			datatype : "json",
			success : function(data){
				var singolist = $.parseJSON(data);
				if(data){
					var str = ''
					str = "<table border='1'><tr><th>작성자</th><th>작성날자</th><th>상태</th></tr>"
					for (var i=0; i<singolist.length; i++){
						var boardId = singolist[i].boardId.split("_");
						var boardStatus = singolist[i].boardStatus;
						if(boardStatus==0){
							singolist[i].boardStatus ="검토중";
						}else if(boardStatus==1){
							singolist[i].boardStatus ="검토완료";
						}
						str += "<tr onclick='toArticle("+boardId[0]+", "+boardId[1]+" )'><td>"+singolist[i].boarduserId+"</td><td>"+singolist[i].boardregTime+"<td>"+singolist[i].boardStatus+"</td></tr>"
						
					}
				<!--	str += "<tr><th colspan='2'><input type='button' value='미정'></th></tr></table>"		-->
					$("#rst").html(str);
				} else {
					$("#rst").text("검색 결과가 없습니다.")
				}
			}, error:function(request,status,error){
    		    alert("서버와 연결이 좋지 않습니다. 잠시 후 다시 시도해주세요.")
    		}
		})
	}
	
	//-->
	
	
	function toStatus(boardStatus){
			if(boardStatus ==0){
				return "검토중";
			}else{
				return "검토완료";
			}
		}
	
		
	function toArticle(boardId,boardId2){
		var bdId = boardId + "_" + boardId2
		location.href ="boardView.do?boardId="+bdId+"&pageNum=1&number=1";
	}
	
	function notice(){
		location.href = "notice.do";
	}
	
	function noticeWrt(){
		location.href = "notWrt.do";//TODO: 공지쓰는 페이지로 이동
	}
	
</script>
<br>
<div class="container">
	<select name="adminpage" id="adminpage">
		<option value="1">공지관리</option>
		<option value="2">공고관리</option>
		<option value="3">신고관리</option>
		<option value="4">구직자관리</option>
		<option value="5">구인자관리</option>
	</select>
	
	<input type="button" value="조회" onclick="getAdminPage()">
	
	
	<div id="rst">
	
	</div>
</div>
