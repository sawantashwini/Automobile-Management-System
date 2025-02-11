
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


		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Edit Category</h1>
			</div>
		</div>



		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-8">

					<div class="card">
						<div class="card-body">
							<br />

							<!-- Floating Labels Form -->

							<%											 
								int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
									ItemCategoryService service = new ItemCategoryService();
									ItemCategoryDto dto = service.getCategoryInfoById(id, config, request);
							%>


							<!-- Floating Labels Form -->
							<form autocomplete="off" action="ItemCategoryServlet"
								method="post"
								class="row g-3 needs-validation d-flex justify-content-center"
								novalidate>

								<div class="col-md-4 md-4">
									<div class="control form-floating">
										<input type="hidden" name="Id" value="<%=id%>"> <input
											type="hidden" name="User_id_fk" value="<%=user_id%>">

										<input type="text" class="form-control" id="name"
											onblur="checkNameAvail(this.value,<%=id%>,'Category');"
											name="Name" value="<%=dto.getName()%>" placeholder="name"
											required> <label for="name">Category Name</label>
										<div class="invalid-feedback">Please, enter Category
											name!</div>
									</div>
								</div>


								<!--  Status codes Start -->

								<div class="col-md-4">
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

										<div class="invalid-feedback">Please, select category
											Status!</div>

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