<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>
<script src="./js/schJbWrt.js"></script>
<input type="button" onclick="makeTable()" value="홀추가">
<input type="button" onclick="schJbWrt()" value="작성완료">
<div id="s">
   
</div>

<script type="text/javascript">
   //<!--

   	var schId = ${schId};
	var cnt = 1;
	$(document).ready(
      function(){
            makeTable();         
      }      
   )

   //-->
</script>


<%@ include file="/setting/design_setting_footer.jsp" %>