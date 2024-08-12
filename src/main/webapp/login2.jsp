
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dto.ProjectDto"%>
<%@page import="com.service.ProjectService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<%
ProjectService project_head_ser = new ProjectService();
ProjectDto project_head_dto = project_head_ser.getProjectInfoById(1, config, request);
%>

<title><%=project_head_dto.getNAME()%></title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- logos -->
<link href="ProjectImage/<%=project_head_dto.getId()%>.jpg" rel="icon">
<link href="ProjectImage/<%=project_head_dto.getId()%>.jpg"
	rel="apple-touch-icon">

<style>

/* Corner div */
.corner-div {
	position: absolute;
	right: 0;
	left: 80%;
	z-index: 0; /* Set a lower z-index */
}

.body {
	background: url(assets/img/back.jpg) no-repeat center/cover;
	margin-top: 2%
}

.login-logo {
	width: 50px;
	height: 50px;
}

.admin {
	font-size: 35px;
	color: #f03606;
}

.card-login {
	background-color: transparent !important;
	opacity: 100%;
	padding: 10px 40px 20px;
	border-radius: 15px;
	box-shadow: 5px 5px 10px 10px rgb(55, 54, 54);
	box-shadow: 100% black;
	margin: 0 auto;
	width: 40%;
	position: relative;
}

.card-title {
	letter-spacing: 5px;
}

.ccard-img {
	width: 100%;
	height: 300px;
}

.project_name {
	color: #fff;
	font-size: 30px;
	font-family: Arial Black;
}

@media ( max-width : 1100px) {
	.card-login {
		width: 50%;
	}
	.ccard-img {
		max-width: 100%;
		height: 200px;
	}
}

@media ( max-width : 690px) {
.project_name {
	color: #fff;
	font-size: 15px;
}
	.center-div {
		width: 80vw;
		margin: 0 auto;
		background-color: transparent !important;
		opacity: 100%;
		padding: 10px 40px 20px;
		border-radius: 15px;
		box-shadow: 5px 5px 10px 10px rgb(55, 54, 54);
		box-shadow: 100% black;
		margin: 0 auto;
		position: relative;
		left: 0; /* Add this to ensure it's not pushed to the right */
	}
	.corner-div {
		display: none;
		right: 0;
		z-index: 0;
		right: 0; /* Set a lower z-index */
	}
}

.register .card-title {
	text-align: center;
	font-size: 30px;
}

.submit-btn {
	color: #fff;
	background-color: #f03606;
	border-color: #f03606;
	box-shadow: rgb(49, 132, 253);
}
</style>
<link href="assets/vendor/fontawesome-free/css/all.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<style type="text/css">
.control input {
	height: 100% !important;
	font-size: 13px !important;
	padding: 18px 8px 3px 11px !important;
}

.control select {
	height: 100% !important;
	font-size: 13px !important;
	padding: 18px 8px 3px 11px !important;
}
.admin b {
    font-family: 'Odor Mean Chey', sans-serif;
    font-weight: 900;
}
</style>

</head>

<body class="body">

	<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy");

	String current_year = sdf.format(new Date());

	sdf = new SimpleDateFormat("MM");
	String current_month = sdf.format(new Date());

	sdf = new SimpleDateFormat("MM/yyyy");

	String current_monthyear = sdf.format(new Date());

	sdf = new SimpleDateFormat("yyyy-MM-dd");
	String current_date = sdf.format(new Date());

	String current_year_with_month, current_year_only;

	int current_month1 = Integer.parseInt(current_month);
	int current_year1 = Integer.parseInt(current_year);

	int find_next_year = current_year1 + 1;
	int find_pre_year = current_year1 - 1;

	if (current_month1 > 3) {

		//current_year_with_month = "05/" + current_year + "-04/" + find_next_year;
		current_year_only = current_year + "-" + find_next_year;

	} else {
		//current_year_with_month = "05/" + find_pre_year + "-04/" + current_year;
		current_year_only = find_pre_year + "-" + current_year;
	}
	%>

	<%
	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");

	if (msg.equalsIgnoreCase("NoLogin")) {
	%>
	<div id="msg_alert"
		class="d-flex justify-content-center row p-3 col-12"
		style="position: fixed;">
		<div class="col-sm-6">
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				<i class="bi bi-exclamation-octagon me-1"></i><strong>UnSuccess!</strong>
				Wrong Username and Password.
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</div>
	</div>
	<%
	}
	%>
	<!--  alert massages end-->

	<div class="d-flex justify-content-center " style="margin-top: 10px;">
		<a href="index.jsp" class=" d-flex align-items-center w-auto"> <img
			src="ProjectImage/<%=project_head_dto.getId()%>.jpg"
			onerror="this.src='assets/img/back.jfif'" alt=""
			class="login-logo" style="height: 120px; width: 150px;  border: 1px solid; border-radius: 15px;
			">

		</a>
	</div>

	<div class="d-flex justify-content-center ">
		<a href="index.jsp" class=" d-flex align-items-center w-auto"> <span
			class="admin d-lg-block"><b class="project_name" style="color: #0a0505;"><%=project_head_dto.getNAME()%></b></span>
		</a>
	</div>
	<!-- End Logo -->
	<section class=" min-vh-100">

		<div class="d-flex justify-content-center align-items-center">
			<div class="card-login text-center center-div">

				<div class="card-body">

					<div class="pt-4 pb-2">
						<h5 class="card-title" style="font-family: fantasy;">Login</h5>

					</div>
					<form class="row g-3 needs-validation" action="LoginServlet"
						method="post" novalidate>
						<div class="col-12">
							<div class="input-group has-validation">
								<div class="input-group-text" id="inputGroupPrepend">
									<i class="fa fa-user" style="color: #f00;"></i>
								</div>
								<div class="form-floating control">
									<input type="text" class="control form-control" id="mobile_no"
										name="Mobile_no" placeholder="Mobile No" required> <label
										style="color: #f00;" for="password">Enter your Mobile
										No.</label>

								</div>
								<div class="invalid-feedback">Please Enter your Mobile
									No.!</div>

							</div>
						</div>

						<div class="col-12">
							<div class="input-group has-validation">
								<div class="input-group-text" id="inputGroupPrepend">
									<i class="fa-solid fa-lock" style="color: #f00;"></i>
								</div>
								<div class="form-floating control">
									<input type="password" class="form-control" id="password"
										name="Password" placeholder="password" required> <label
										style="color: #f00;" for="password">Enter your
										Password</label>
								</div>
								<div class="invalid-feedback">Please Enter your Password!</div>
							</div>
						</div>

						<%-- <div class="input-group">
							<label class="input-group-text" for=""><i
								class="ri-time-fill" style="color: #f00;"></i></label> <select
								class="form-select" id="session" name="session"
								aria-label="working post">
								<option value="N/A" Selected='selected'>Select Session
									Year</option>

								<option value="<%=current_year_only%>" selected="selected"><%=current_year_only%></option>

								<option value="2022-2023">2022-2023</option>
								<option value="2023-2024">2023-2024</option>
								<option value="2024-2025">2024-2025</option>


							</select>
						</div> --%>


						<input type="hidden" name="currentSession"
							value="<%=current_year_only%>"> <br> <br>


						<div class="text-center">
							<button class="submit-btn" type="submit">Login</button>
						</div>
						<br>
					</form>

				</div>
			</div>
			<div class="corner-div">
				<img src="assets/img/mykhandwa.jfif"  class="ccard-img">
			</div>

		</div>


	</section>
	<!-- End #main -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="fa fa-angle-double-up"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>