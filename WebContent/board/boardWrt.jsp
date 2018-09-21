<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 글쓰기 </h2>
<form method="post" action="writePro.do" name="writeform" onsubmit="return writecheck()">
    		<input type="hidden" name="num" value="${num}">
    		    	
    	<table>
    		<tr>
    			<th colspan="2" align="right">
    				<a href="list.jsp">${str_list}</a>&nbsp;&nbsp;&nbsp;
    			</th>    			
    		</tr>
    		<tr>
    			<th>글쓴이 </th>
    			<td> <input class="input" type="text" name="writer" maxlength="10"> </td>
    		</tr>
    		<tr>
    			<th> ${str_email} </th>
    			<td> <input class="input" type="text" name="email" maxlength="30"> </td>
    		</tr>
    		<tr>
    			<th> ${str_subject} </th>
    			<td> <input class="input" type="text" name="subject" maxlength="50"> </td>
    		</tr>
    		<tr>
    			<th> 내용 </th>
    			<td>
    				<textarea name="content" rows="10" cols="40"></textarea>
    			</td>
    		</tr>
    		<tr>
    			<th> ${str_passwd} </th>
    			<td> <input class="input" type="password" name="passwd" maxlength="12"> </td>
    		</tr>
    		<tr>
    			<th colspan="2">
    			<input class="inputbutton" type="submit" value="글작성">
    			<input class="inputbutton" type="reset" value="글작성 취소">
    			<input class="inputbutton" type="button" value="목록으로" onclick ="location='list.do'">
    		</th>
    		</tr>
    	</table>
    	</form>