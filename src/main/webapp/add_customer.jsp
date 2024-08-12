
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
		<%@include file="breadcrumbs/sell.jsp"%>
		<!--  Breadcrumbs End--> 

		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Add Customer</h1>
			</div>
		</div>



		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-10">

					<div class="card">


						<div class="card-body">
							<br />

							<!-- Floating Labels Form -->
							<form action="CustomerServlet" method="post" autocomplete="off"
								class="row g-3 needs-validation d-flex justify-content-center"
								novalidate>
								<input type="hidden" name="User_id_fk" id="user_id_fk"
									value="<%=user_id%>">
								<div class="col-md-6 col-12">
									<div class="control form-floating">
										<input type="text" class="form-control" id="name" name="Name"
											onblur="checkNameAvail(this.value,'0','Customer');"
											placeholder="Name" required> <label for="Name">
											Name</label>
										<div class="invalid-feedback">Please, Enter Customer
											Name !</div>
									</div>
								</div>

								<div class="col-md-6 col-12">
									<div class="control form-floating">
										<input type="number" class="form-control" id="mobile_no"
											name="Mobile_no" placeholder="Mobile_no  " >
										<label for="mobile_no">Mobile no.</label>
										<div class="invalid-feedback">Please, Enter Mobile
											Number!</div>
									</div>
								</div>


								<div class="col-md-6 col-12">
									<div class="control form-floating">
										<input type="text" class="form-control" id="gst_no"
											name="Gst_no" placeholder="Gst_no" > <label
											for="gst_no">GST In</label>
										<div class="invalid-feedback">Please, Enter GST Number!</div>
									</div>
								</div>


								<div class="col-md-6 col-12">
									<div class="control form-floating">
										<input type="number" class="form-control" id="opening_due"
											name="Opening_due" placeholder="Opening_due " value="0"
											required step=0.01 min="0"> <label for="opening_due">Opening
											due</label>
										<div class="invalid-feedback">Please, Enter Opening due
											!</div>
									</div>
								</div>

								<div class="col-md-12 col-12">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Address"
											id="address" Name="Address"  style="height: 70px"></textarea>
										<label for="Customer Address"> Address</label>
										<div class="invalid-feedback">Please, Enter Customer
											Address !</div>
									</div>
								</div>

								<input type="hidden" id="c_y_session" name="C_y_session"
									value="<%=current_session%>"> <input type="hidden"
									id="in_date" name="In_date" value="<%=current_date%>">


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