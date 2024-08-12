<%@page import="com.dto.ItemDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.ItemService"%>

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

		 <!-- ======= Breadcrumbs ======= -->
		<%@include file="breadcrumbs/vehicles.jsp"%>
		<!--  Breadcrumbs End--> 
		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Add Color</h1>
			</div>
		</div>



		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-6">

					<div class="card">
						<div class="card-body">
							<br />

							<!-- Floating Labels Form -->
							<form
								class="row g-4 needs-validation d-flex justify-content-center"
								novalidate action="ColorServlet" method="post"
								autocomplete="off">
								<!-- Color name -->
								<input type="hidden" name="User_id_fk" id="user_id_fk"
									value="<%=user_id%>">
								<div class="col-md-8">
									<div class="control form-floating">
										<input type="text" class="form-control" id="name" name="Name"
											onblur="checkNameAvail(this.value,'0','Color');"
											placeholder="Name" required> <label for="name">Name</label>
										<div class="invalid-feedback">Please, Enter Color!</div>
									</div>
								</div>


								<!-- color-end -->

								<div class="text-center">
									<button type="submit" class="submit-btn">Submit</button>
								</div>
							</form>
							<!-- End Add-color -->
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