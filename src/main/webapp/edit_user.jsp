<!-- head -->
<%@include file="include/head.jsp"%>
<!-- head end -->


</head>

<body>



	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->


	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->

	<main id="main" class="main">

		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Edit User</h1>
			</div>
		</div>



		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-6">

					<div class="card">
						<div class="card-body">
							<br />

							<%
							int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
							UserService service = new UserService();

							UserDto dto = service.getuserInfoById(id, config, request);
							%>

							<!-- Floating Labels Form -->
							<form autocomplete="off" action="UserServlet" method="post"
								class="row g-3 needs-validation" novalidate>

								<div class="col-md-12 col-12 mt-3">
									<label for="yourName" class="form-label" style="color: #f00;">
										Name</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="Name"><i
											class="ri-user-fill " style="color: #f02c10;"></i></span> <input
											type="text" name="Name" class="form-control" id="name"
											value="<%=dto.getName()%>" required> <input
											type="hidden" value="<%=id%>" name="Id">


									</div>
								</div>



								<div class="col-md-12 col-12 mt-3">
									<label for="yourName" class="form-label" style="color: #f00;">
										Mobile No.</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="PhoneNo."><i
											class="bi bi-phone-fill " style="color: #f02c10;"></i></span> <input
											onblur="checkNameAvail(this.value,'<%=id%>','Mobile No.');"
											type="number" name="Mobile_no" class="form-control"
											id="mobile_no" value="<%=dto.getMobile_no()%>" required>
										<div class="invalid-feedback">Please, enter your Phone
											No.!</div>
									</div>
								</div>




								<div class="col-md-12 col-12 mt-3">
									<label for="yourPassword" class="form-label"
										style="color: #f00;">Password</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="Password"><i
											class="ri-lock-2-fill " style="color: #f02c10;"></i></span> <input
											type="PASSWORD" name="Password" class="form-control"
											id="password" value="<%=dto.getPassword()%>" required>
										<div class="invalid-feedback">Please enter your
											password!</div>
									</div>
								</div>


								<div class="col-md-12 col-12 mt-3">
									<label for="yourUsername" class="form-label"
										style="color: #f00;">Address</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="Address"><i
											class="bi bi-geo-alt-fill " style="color: #f02c10;"></i></span> <input
											type="text" name="Address" class="form-control" id="address"
											value="<%=dto.getAddress()%>" required>
										<div class="invalid-feedback">Please choose a Address.</div>
									</div>
								</div>
								<!--  Status codes Start -->

								<div class="col-md-12 col-12 mt-3">
									<div class="form-floating control mb-3">
										<select class="form-select" id="status" name="Status"
											aria-label="working post">

											<option value="Active"
												<%if (dto.getStatus().equals("Active")) {
							out.print("selected='selected'");
						}%>>Active</option>

											<option value="Block"
												<%if (dto.getStatus().equals("Block"))

							{
								out.print("selected='selected'");
							
							}%>>Block</option>

										</select> <label for=" status">Status</label>

										<div class="invalid-feedback">Please, select user
											Status!</div>

									</div>

								</div>

								<div class="text-center mt-4">
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