
<!-- ======= Header ======= -->
<%@include file="include/head.jsp"%>
<!-- ======= Header end======= -->

<script src="js/sell.js" type="text/javascript"></script>

</head>

<body>



	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->


	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->
	
	<main id="main" class="main">

		<!-- ======= Breadcrumbs ======= -->
		<%@include file="breadcrumbs/user.jsp"%>
		<!--  Breadcrumbs End-->
		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Add User</h1>
			</div>
		</div>



		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-6">

					<div class="card">
						<div class="card-body">
							<br />

							<!-- Floating Labels Form -->

							<form autocomplete="off" action="UserServlet" method="post"
								class="row mb-4 mt-2 needs-validation" novalidate>

								<div class="col-md-12 col-12 mt-3">
									<label for="yourName" class="form-label" style="color: #f00;">
										Name</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="name"><i
											class="ri-user-fill " style="color: #f03c10;"></i></span> <input
											type="text" name="Name" class="form-control" id="name"
											required>

										<div class="invalid-feedback">Please, enter your name!</div>
									</div>
								</div>
								<br> <br>
								<div class="col-md-12 col-12 mt-3">
									<label for="yourMobileno" class="form-label"
										style="color: #f00;"> Mobile No.</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="PhoneNo."><i
											class="bi bi-phone-fill " style="color: #f03c10;"></i></span> <input
											onblur="checkNameAvail(this.value,'0','Mobile No.');"
											type="number" name="Mobile_no" class="form-control"
											id="mobile_no" required>
										<div class="invalid-feedback">Please, enter your mobile
											No.!</div>
									</div>
								</div>
								<br> <br>

								<div class="col-md-12 col-12 mt-3">
									<label for="yourPassword" class="form-label"
										style="color: #f00;">Password</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="Password"><i
											class="ri-lock-2-fill " style="color: #f03c10;"></i> </span> <input
											type="PASSWORD" name="Password" class="form-control"
											id="password" required>
										<div class="invalid-feedback">Please enter your
											password!</div>
									</div>
								</div>

								<br> <br>

								<div class="col-md-12 col-12 mt-3">
									<label for="yourUsername" class="form-label"
										style="color: #f00;">Address</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="Address"><i
											class="bi bi-geo-alt-fill " style="color: #f03c10;"></i></span> <input
											type="text" name="Address" class="form-control" id="address"
											required>
										<div class="invalid-feedback">Please choose a Address.</div>
									</div>
								</div>

								<div class="text-center mt-4">
									<button type="submit" class="submit-btn">Submit</button>
								</div>

							</form>
							<!-- End General Form Elements -->

						</div>
					</div>
				</div>

			</div>
		</section>

	</main>
	<!-- End main -->
	<br />
	<br />


	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>

</html>