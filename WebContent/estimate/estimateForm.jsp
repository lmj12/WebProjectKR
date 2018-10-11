<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp" %>
<%@ include file="/setting/setting.jsp" %>
<!DOCTYPE html>
<c:if test="${sessionScope.memType ne 1}">	<!--  구직자회원이 아니면  -->
<br>
	<form>
		<table border='1'>	<!-- TODO : hidden으로 지원이력 ID저장할 필요 존재. -->
			<tr><th>평가사항</th><th colspan='5'>점수</th></tr>
			<tr><th>업무이해능력 </th><th><img src='./setting/image/estimate/1.png' height='90' width='90'><br><input type="radio"  name='performance' value="1"></th><th><img src='./setting/image/estimate/2.png' height='90' width='90'><br><input type="radio" name='performance' value="2"></th>
			<th><img src='./setting/image/estimate/3.png' height='90' width='90'><br><input type="radio" name='performance' value="3" ></th><th><img src='./setting/image/estimate/4.png' height='90' width='90'><br><input type="radio" name='performance' value="4"></th><th><img src='./setting/image/estimate/5.png' height='90' width='90'><br><input type="radio" name='performance' value="5"></th></tr>
			<tr><th>시간준수 </th><th><img src='./setting/image/estimate/1.png' height='90' width='90'><br><input type="radio"  name='performance' value="1"></th><th><img src='./setting/image/estimate/2.png' height='90' width='90'><br><input type="radio" name='performance' value="2"></th>
			<th><img src='./setting/image/estimate/3.png' height='90' width='90'><br><input type="radio" name='performance' value="3" ></th><th><img src='./setting/image/estimate/4.png' height='90' width='90'><br><input type="radio" name='performance' value="4"></th><th><img src='./setting/image/estimate/5.png' height='90' width='90'><br><input type="radio" name='performance' value="5"></th></tr>
			<tr><th>자세 및 태도 </th><th><img src='./setting/image/estimate/1.png' height='90' width='90'><br><input type="radio"  name='performance' value="1"></th><th><img src='./setting/image/estimate/2.png' height='90' width='90'><br><input type="radio" name='performance' value="2"></th>
			<th><img src='./setting/image/estimate/3.png' height='90' width='90'><br><input type="radio" name='performance' value="3" ></th><th><img src='./setting/image/estimate/4.png' height='90' width='90'><br><input type="radio" name='performance' value="4"></th><th><img src='./setting/image/estimate/5.png' height='90' width='90'><br><input type="radio" name='performance' value="5"></th></tr>
		</table>
	</form>
</c:if>

<c:if test="${sessionScope.memType eq 1}"> <!--  구직자회원이면 -->
	<script type="text/javascript">	
		//<!--
		errorback("권한이 있는 사용자가 아닙니다.")
		//-->
	</script>
</c:if>

<%@ include file="/setting/design_setting_footer.jsp" %>