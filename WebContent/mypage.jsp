<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2><span>${sessionScope.memid}</span>님의 마이페이지입니다</h2>
<form name="jbpmytopform" method="post" action="mypage.do" >
<table border="1">	
	<tr>
		<th> <input type="text" name="jbksearch"> </th>
		<td> <input type="button" value="검색"> </td>
		<td> <input type="button" name="change" value="정보수정" onclick="location='jbpView.do'"> </td>
		<td> <input type="button" value="팀" onclick="location=''"></td>
		<td> <input type="button" value="스케줄" onclick="location=''"> </td>
	</tr>	
</table>
</form>

<br><br>
<form name="jbkmybtmform" method="post" action="mypage.do" >
<table border="1">
	<tr>
		<td> <input type="button" name="out" value="회원탈퇴" onclick="location='jbpDel.do'"></td>
	</tr>
</table>
</form>