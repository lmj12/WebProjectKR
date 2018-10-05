<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/setting.jsp" %>
<script type="text/javascript">
	//<!--
	function alertTeam(){
		if(confirm("팀 가입 요청이 있습니다. 확인하시겠습니까?")){
			location.href="teamReqCk.do"
		} 
	}
	//-->
</script>

<h2><span>${sessionScope.memid}</span>님의 마이페이지입니다</h2>
<form name="jbpmytopform" method="post" action="mypage.do" >
<table border="1">	
	<tr>
		<th> <input type="text" name="jbksearch"> </th>
		<td> <input type="button" value="검색"> </td>
		<td> <input type="button" name="change" value="정보수정" onclick="location='jbpView.do'"> </td>
	<c:if test="${sessionScope.teamId ne 0 }">
		<td> <input type="button" value="팀" onclick="location='teamList.do'"></td>
		<td> <input type="button" value="스케줄" onclick="location=''"> </td>
	</c:if>
	<c:if test="${sessionScope.memType eq 1}">
    	<td>  <input type="button" value="신고게시판" onclick="location='boardList.do'"> </td>  
    	<td> <input type="button" value="이력서" onclick="location='iptCrr.do'"> </td>
    	<c:if test="${sessionScope.teamReq eq 1}">
    		<script type="text/javascript">
				//<!--
				alertTeam();
				//-->
			</script>
    	</c:if>  		
    </c:if>
    	<td> <input type="button" value="메인으로" onclick="location='main.do'"></td>
		<td> <input type="button" value="로그아웃" onclick="location='logout.do'"></td>
	</tr>	
</table>
</form>

<c:if test="${sessionScope.memType eq 2}">
<tr>
	
			<jsp:include page="recMyView.do" flush="false"/>
		
</tr>
</c:if>

<br><br>
<form name="jbkmybtmform" method="post" action="mypage.do" >
<table border="1">
	<tr>
		<td> <input type="button" name="out" value="회원탈퇴" onclick="location='jbpDel.do'"></td>
	</tr>
</table>
</form>