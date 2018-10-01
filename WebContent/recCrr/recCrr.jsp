<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="${js}recCrr.js"></script>

<h2>recCrr 내용입니다</h2>
<button id="addTR">Add</button>
<form>
	<input type="hidden" name="listCnt" value="0">
	<table id="table" border="1">
		<tr>
			<td><input type="text" name="idx[]" value="" /></td>
		</tr>
	</table>
</form>