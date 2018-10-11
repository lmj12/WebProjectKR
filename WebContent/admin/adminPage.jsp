<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp" %>
<!DOCTYPE html>

<h2>관리자 페이지</h2>


<script type="text/javascript">
	//<!--
	function getAdminPage() {
		var pageSlt = $("#adminpage option:selected").val();
		
		if(pageslt == 1){
			gongji();
		}else if(pageslt == 2){
			gonggo();
		}else if(pageslt == 3){
			singo();
		}else if(pageslt ==4){ // 회원관리
			member();
		}
		
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
					str = "<table><tr><th>제목</th><th>작성자</th><th>작성날자</th></tr>"
					for (var i=0; articles.length; i++)
						str += "<tr onclick='toArticle("+articles[i].boardId+")'><td>"+articles[i].boardTitle+"</td><td>"+articles[i].boarduserId+"</td><td>"+articles[i].boardregTime+"</td></tr></table>"
					}
					str += "<tr><th colspan='3'><input type='button' value='글 작성' onclick='noticeWrt()'></th></tr>"
					$("#rst").html(str);
				} else {
					$("#rst").text("검색 결과가 없습니다. 아이디를 다시 확인해 주세요.")
				}
			}
		})
	}
		
	function toArticle(boardId){
		alert(boardId);
	}
	
	function noticeWrt(){
		location.replace("");//TODO: 공지쓰는 페이지로 이동
	}
	
	function gonggo(){
		$.ajax({
		    method : "POST",
		    url : "ajaxAdmRec.do",
	    	cache : false,
			async : false,
			data : {
				boardId : boardId,
			},
			datatype : "json",
			success : function(data){
				var user = $.parseJSON(data);
				if(data){
					var str = ''
					str = "<table><tr><th>ID</th><th>이름</th><th>요청 보내기</th></tr>"
					str += "<tr><td>"+user.jbskId+"</td><td>"+user.jbskName+"</td><td><input type='button' onclick='teamReq()'></td></tr></table>"
					$("#rst").html(str);
				} else {
					$("#rst").text("검색 결과가 없습니다. 아이디를 다시 확인해 주세요.")
				}
			}
		})
	}
	
	function singo(){
		
	}
	
	function member(){
		
	}
	//-->
</script>
<br>

<select name="adminpage" id="adminpage">
	<option value="1">공지관리</option>
	<option value="2">공고관리</option>
	<option value="3">신고관리</option>
	<option value="4">회원관리</option>
</select>

<input type="button" value="조회" onclick="getAdminPage()">


<div id="rst">

</div>
