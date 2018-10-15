<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp"%>
<%@ include file="/setting/setting.jsp" %>


<div class="container">
	
	<div class="row justify-content-md-center">
		<h2>회원가입페이지</h2>
		<br>
	</div>
	<div class="row justify-content-md-center">
		<div class="col-sm-4">
			<a href="registerJbp.do">
				<div class="card card-success">
					<div class="card-header">구인자회원가입</div>
					<div class="card-body">
						<img src="tempsnipProv.png" class="img-responsive" style="width: 100%" alt="Image">
					</div>
					<div class="card-footer">공고를 등록하고 인재를 찾는 분</div>
				</div>
			</a>
		</div>

		<div class="col-sm-4">
			<a href="registerJbsk.do">
				<div class="card card-success">
					<div class="card-header">구직자회원가입</div>
					<div class="card-body">
						<img src="tempsnipSeek.png" class="img-responsive" style="width: 100%" alt="Image">
					</div>
					<div class="card-footer">이력서를 등록하고 알바를 구하는 분</div>
				</div>
			</a>
		</div>
	</div>
</div>
<br>

<%@ include file="/setting/design_setting_footer.jsp"%>