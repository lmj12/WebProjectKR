<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp"%>
<%@ include file="/setting/setting.jsp" %>


<div class="container">
	<h2>회원가입페이지</h2>
	<div class="row">
		<div class="col-sm-3">
			<a href="registerJbp.do">
				<div class="panel panel-success">
					<div class="panel-heading">구인자회원가입</div>
					<div class="panel-body">
						<img src="" class="img-responsive" style="width: 100%" alt="Image">
					</div>
					<div class="panel-footer">공고를 등록하고 인재를 찾는 분</div>
				</div>
			</a>
		</div>

		<div class="col-sm-3">
			<a href="registerJbsk.do">
				<div class="panel panel-success">
					<div class="panel-heading">구직자회원가입</div>
					<div class="panel-body">
						<img src="" class="img-responsive" style="width: 100%" alt="Image">
					</div>
					<div class="panel-footer">이력서를 등록하고 알바를 구하는 분</div>
				</div>
			</a>
		</div>
	</div>
</div>
<br>

<%@ include file="/setting/design_setting_footer.jsp"%>