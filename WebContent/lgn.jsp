<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/setting/design_setting_upper.jsp"%>
<%@ include file="/setting/setting.jsp"%>

<div class="container py-5">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-6 mx-auto">
					<!-- form card login -->
					<div class="card rounded-0">
						<div class="card-header">
							<h3 class="mb-0">로그인</h3>
						</div>
						<div class="card-body">
							<form class="form" role="form" action="memberLogin.do" autocomplete="off" id="formLogin" novalidate="" method="POST">
								<div class="form-group">
									<div class="custom-controls-stacked d-block my-3">
										<label class="custom-control custom-radio"> 
										<input id="radioStacked2" name="radio-stacked" value="jbsk" type="radio" class="custom-control-input" required> 
											<span class="custom-control-indicator"></span> 
											<span class="custom-control-description">구직자</span>
										</label> <label class="custom-control custom-radio"> 
										<input id="radioStacked1" name="radio-stacked" value="jbp" type="radio" class="custom-control-input" required> 
											<span class="custom-control-indicator"></span> 
											<span class="custom-control-description">구인자</span>
										</label> <label class="custom-control custom-radio"> 
										<input id="radioStacked3" name="radio-stacked" value="adm" type="radio" class="custom-control-input" disabled required>
											<span class="custom-control-indicator"></span> 
											<span class="custom-control-description">관리자</span>
										</label>
									</div>
								</div>
								<div class="form-group">
									<label for="uname1">아이디</label> 
									<input type="text" name="id" class="form-control form-control-lg rounded-0" name="uname1"
										id="uname1" required="true">
									<div class="invalid-feedback">아이디를 입력해주세요</div>
								</div>
								<div class="form-group">
									<label>비밀번호</label> 
									<input type="password" name="passwd" class="form-control form-control-lg rounded-0" id="pwd1"
										required="true" autocomplete="new-password">
									<div class="invalid-feedback">패스워드를 입력해주세요</div>
								</div>
								<div>
									<label class="custom-control custom-checkbox"> 
									<input type="checkbox" class="custom-control-input"> 
										<span class="custom-control-indicator"></span> 
										<span class="custom-control-description small text-dark">Remember me !!</span>
									</label>
								</div>
								<button type="submit" class="btn btn-success btn-lg float-right" id="btnLogin">Login</button>
							</form>
						</div>
						<!--/card-block-->
					</div>
					<!-- /form card login -->

				</div>


			</div>
			<!--/row-->

		</div>
		<!--/col-->
	</div>
	<!--/row-->
</div>
<!--/container-->

<script type="text/javascript">
	$("#btnLogin").click(function(event) {

		//Fetch form to apply custom Bootstrap validation
		var form = $("#formLogin")

		if (form[0].checkValidity() === false) {
			event.preventDefault()
			event.stopPropagation()
		}

		form.addClass('was-validated');
	});
//-->
</script>
<%@ include file="/setting/design_setting_footer.jsp"%>