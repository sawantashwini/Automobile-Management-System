
<!-- ======= Header ======= -->
<%@include file="include/head.jsp"%>
<!-- ======= Header end======= -->

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
		<%@include file="breadcrumbs/othermodule.jsp"%>
		<!--  Breadcrumbs End-->

		<div class="row justify-content-center">
			<div class="pagetitle col-lg-10 text-center">
				<h1>Add Other Dealer</h1>
			</div>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-10">

					<div class="card" style="border-radius: 25px;">


						<div class="card-body">
							<br />

							<!-- Floating Labels Form -->
							<form action="DealerOtherServlet" method="post"
								autocomplete="off"
								class="row g-3 needs-validation d-flex justify-content-center"
								novalidate>
								<input type="hidden" name="User_id_fk" id="user_id_fk"
									value="<%=user_id%>"> <input type="hidden"
									id="c_y_session" name="C_y_session"
									value="<%=current_session%>">
								<div class="col-sm-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="name" name="Name"
											onblur="checkNameAvail(this.value,'0','Other');"
											placeholder=" Name" required> <label for="Name">
											Name</label>
										<div class="invalid-feedback">Please, Enter Name !</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="control form-floating">
										<input type="number" class="form-control" id="mobile_no"
											name="Mobile_no" placeholder="Mobile_no"> <label
											for="mobile_no">Mobile No.</label>
										<div class="invalid-feedback">Please, Enter Mobile
											Number!</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="gst_no"
											name="Gst_no" placeholder="gst_no" > <label
											for="gst_no">Gst in</label>
										<div class="invalid-feedback">Please, Enter Gst in!</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="control form-floating">
										<input type="number" step="0.01" class="form-control"
											id="opening_due" name="Opening_due"
											placeholder="Opening_due No." value="0" required min="0">
										<label for="opening_due">Due</label>
										<div class="invalid-feedback">Please, Enter Due !</div>
									</div>
								</div>

								<div class="col-md-12 col-12 mb-2">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Address"
											id="address" name="Address"></textarea>
										<label for="address">Address</label>
									</div>
								</div>



								<div class="text-center">
									<button type="submit" class="submit-btn">Submit</button>

								</div>


							</form>
							<!-- End floating Labels Form -->

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