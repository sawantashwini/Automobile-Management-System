<%@page import="com.dto.ItemDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.ItemService"%>


<!-- head -->
<%@include file="include/head.jsp"%>
<!-- head end -->
</head>



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
		<%@include file="breadcrumbs/vehicles.jsp"%>
		<!--  Breadcrumbs End--> 

		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Add Company</h1>
			</div>
		</div>



		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-8">

					<div class="card">
						<div class="card-body">
							<br />

							<!-- Floating Labels Form -->
							<form action="CompanyServlet"
								class="row g-4 needs-validation d-flex justify-content-center"
								novalidate method="post" autocomplete="off">

								<input type="hidden" name="User_id_fk" id="user_id_fk"
									value="<%=user_id%>">
								<div class="col-md-5">
									<div class="control form-floating">
										<input type="text" class="form-control" id="name"
											onblur="checkNameAvail(this.value,'0','Company');"
											name="Name" placeholder="Name" required> <label
											for="name">Company Name</label>
										<div class="invalid-feedback">Please, enter Company
											Name!</div>
									</div>
								</div>

								<div class="col-md-5">
									<div class="control form-floating">
										<input type="number" class="form-control"
											placeholder="Service_Count" id="service_count"
											name="Service_count" required> <label
											for="service_count">Service Count</label>
										<div class="invalid-feedback">Please, Enter Service
											Count!</div>
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