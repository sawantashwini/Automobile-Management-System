<%@page import="com.dto.CompanyDto"%>
<%@page import="com.service.CompanyService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
				<h1>Edit Company</h1>
			</div>
		</div>



		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-8">

					<div class="card">
						<div class="card-body">
							<br />

							<%
							int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
							CompanyService ser = new CompanyService();

							CompanyDto dto = ser.getCompanyInfoById(id, config, request);
							%>

							<!-- Floating Labels Form -->
							<form autocomplete="off" action="CompanyServlet" method="post"
								class="row g-3 needs-validation d-flex justify-content-center"
								novalidate>
								<input type="hidden" name="User_id_fk" id="user_id_fk"
									value="<%=user_id%>">
								<div class="col-md-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="name" name="Name"
											onblur="checkNameAvail(this.value,<%=id%>,'Company');"
											value="<%=dto.getName()%>" placeholder="Name" required>
										<input type="hidden" value="<%=id%>" name="Id"> <label
											for="name">Company Name</label>
										<div class="invalid-feedback">Please, enter Company
											Name!</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="control form-floating">
										<input type="text" class="form-control"
											placeholder="Service_Count" id="service_count"
											value="<%=dto.getService_count()%>" name="Service_count"
											required> <label for="service_count">Service
											Count</label>
										<div class="invalid-feedback">Please, Enter Service
											Count!</div>
									</div>
								</div>
								<div class="col-md-12">
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