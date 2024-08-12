<%@page import="com.dto.ColorDto"%>
<%@page import="com.service.ColorService"%>
<%@page import="java.util.ArrayList"%>

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
				<h1>Edit Color</h1>
			</div>
		</div>



		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-8">

					<div class="card">
						<div class="card-body">
							<br />

							<!-- Floating Labels Form -->
							<form autocomplete="off" action="ColorServlet" method="post"
								class="row g-3 needs-validation d-flex justify-content-center"
								novalidate>
								<br />


								<%
								int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
								ColorService service = new ColorService();
								ColorDto dto = service.getColorInfoById(id, config, request);
								%>

								<input type="hidden" name="User_id_fk" id="user_id_fk"
									value="<%=user_id%>"> <input type="hidden" name="Id"
									value="<%=id%>">

								<!-- Color name start-->
								<div class="col-md-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="name" name="Name"
											onblur="checkNameAvail(this.value,<%=id%>,'Color');"
											placeholder="Your Name" value="<%=dto.getName()%>" required>
										<label for="floatingName">Color </label>
										<div class="invalid-feedback">Please, Enter Color!</div>
									</div>
								</div>
								<!-- Color name end-->



								<!--  Status codes Start -->

								<div class="col-md-6">
									<div class="form-floating control mb-3">
										<select class="form-select" id="status" name="Status"
											aria-label="working post">
											<option value="Active"
												<%if (dto.getStatus().equals("Active")) {
	out.print("selected='selected'");
}%>>Active</option>

											<option value="Block"
												<%if (dto.getStatus().equals("Block")) {
	out.print("selected='selected'");
}%>>Block</option>

										</select> <label for="status">Status</label>
										<div class="invalid-feedback">Please, select Employee
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