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
		}else if(pageSlt ==4){ // 회원관리
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
					str = "<table border='1'><tr><th>제목</th><th>작성자</th><th>작성날자</th></tr>"
					for (var i=0; i<articles.length; i++){
						str += "<tr onclick='toArticle("+articles[i].boardId+")'><td>"+articles[i].boardTitle+"</td><td>"+articles[i].boarduserId+"</td><td>"+articles[i].boardregTime+"</td></tr>"
					}
					str += "<tr><th colspan='3'><input type='button' value='글 작성' onclick='noticeWrt()'></th></tr></table>"
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
					str = "<table border='1'><tr><th>업체명</th><th>작성자</th><th>시작일</th><th>종료일</th><th>상태</th></tr>"
					for (var i=0; i<recs.length; i++){	
						str += "<tr onclick='toRecruit("+recs[i].recId+")'><td>"+recs[i].jobpCn+"</td><td>"+recs[i].jobpId+"</td><td>"+recs[i].stime+"</td><td>"+recs[i].etime+"</td>"
						if(recs[i].recStatus==0){
							str += "<td>모집중</td></tr>"
						} else if(recs[i].recStatus==1){
							str += "<td>모집완료</td></tr>"
						} else if(recs[i].recStatus==2){
							str += "<td>완료</td></tr></table>"
						}
					}
					$("#rst").html(str);
				} else {
					$("#rst").text("검색 결과가 없습니다. 아이디를 다시 확인해 주세요.")
				}
			}
		})
	}
		
	function toRecruit(recId){
		location.replace("recView.do?recId="+recId+"&pageNum=1")
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
					str = "<table border='1'><tr><th>작성자</th><th>작성날자</th></tr>"
					for (var i=0; i<singolist.length; i++){
						var boardId = singolist[i].boardId.split("_");
						str += "<tr onclick='toArticle("+boardId[0]+", "+boardId[1]+" )'><td>"+singolist[i].boarduserId+"</td><td>"+singolist[i].boardregTime+"</td></tr>"
					}
					str += "<tr><th colspan='2'><input type='button' value='미정'></th></tr></table>"
					$("#rst").html(str);
				} else {
					$("#rst").text("검색 결과가 없습니다.")
				}
			}
		})
	}
	
	function member(){
		
	}
	//-->
	
		
	function toArticle(boardId,boardId2){
		var bdId = boardId + "_" + boardId2
		location.replace("boardView.do?boardId="+bdId+"&pageNum=1&number=1")
	}
	
	function noticeWrt(){
		location.replace("");//TODO: 공지쓰는 페이지로 이동
	}
	
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
