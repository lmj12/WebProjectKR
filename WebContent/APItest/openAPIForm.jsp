<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="../setting/setting.jsp"%>


<form method="get" action="openAPIView.do">
	<table>
		<tr>
			<th> 상호명 </th>
			<td> <input type="text" name="jbpName"/> </td>
		</tr>
		<tr>
			<th> 사업자번호 </th>
			<td> <input type="text" name="jbpNumber"/> 
				 <input type="button" name="checkBizID" value="확인">
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="전송"/>
			</th>
		</tr>
	</table>
</form>
