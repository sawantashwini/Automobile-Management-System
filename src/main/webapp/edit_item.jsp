
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

		<div id="name_avail_resposnses"></div>
		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Edit Item</h1>
			</div>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-10">

					<div class="card">


						<div class="card-body">
							<br />

							<%
							int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
							ItemService service = new ItemService();
							ItemDto dto = service.getItemInfoById(id, config, request);
							%>
							<!-- Floating Labels Form -->
							<form autocomplete="off" action="ItemServlet" method="post"
								class="row g-3 needs-validation" novalidate>
								<div class="col-md-4 refresh-container mb-3"
									data-add="add_category.jsp" data-list="category">
									<div class="control form-floating refresh-input">
										<input type="text" class="form-control" id="cat_name"
											placeholder="Select Category"> <input type="hidden"
											id="cat_id_fk" name="Cat_id_fk"
											value="<%=dto.getCat_id_fk()%>" /> <label for="cat_name">Select
											Category</label>
										<div class="invalid-feedback">Please, Select Category!</div>
									</div>
								</div>
								<%-- <div class="col-md-3">
									<div id="cat_id_fk">
										<div class="control form-floating">
											<select class="form-select" name="Cat_id_fk"
												aria-label="working post" required>
												<option value="0">Select Category</option>


												<%
												ItemCategoryService cat_ser = new ItemCategoryService();

												ArrayList<ItemCategoryDto> c_list = cat_ser.getActiveCategoryInfo(config, request);

												for (ItemCategoryDto c_dto : c_list) {
												%>

												<option value="<%=c_dto.getId()%>" <%if (c_dto.getId() == dto.getCat_id_fk()) {
												out.print("selected");
											}%>><%=c_dto.getName()%></option>


												<%
												}
												%>
											</select> <label for="cat_id_fk">Category</label>
											<div class="invalid-feedback">Please, Select Category!</div>
										</div>
									</div>
								</div>
								<div class="refresh_add" id="category_parent">
									<%@include file="include/refresh_add.jsp"%>

								</div> --%>
								<div class="col-md-4 refresh-container mb-3"
									data-add="add_measurement.jsp" data-list="measure">
									<div class="control form-floating refresh-input">
										<input type="text" class="form-control" id="measure_name"
											placeholder="Select Measurement"> <input
											type="hidden" id="measure_id_fk" name="Measure_id_fk"
											value="<%=dto.getMeasure_id_fk()%>" /> <label
											for="measure_name">Select Measurement</label>
										<div class="invalid-feedback">Please, Select
											Measurement!</div>
									</div>
								</div>
								<%-- <div class="col-md-4">
									<div id="measure_id_fk">

										<div class="control form-floating">

											<select class="form-select"
												name="Measure_id_fk" aria-label="working post" required>
												<option value="0">Select Measurement</option>


												<%
												MeasurementService m_ser = new MeasurementService();

												ArrayList<MeasurementDto> m_list = m_ser.getActiveMeasurementInfo(config, request);

												for (MeasurementDto m_dto : m_list) {
												%>

												<option value="<%=m_dto.getId()%>" <%if (m_dto.getId() == dto.getMeasure_id_fk()) {
													out.print("selected");
												}%>><%=m_dto.getName()%></option>


												<%
												}
												%>
											</select> <label for="measure_id_fk">Measurement</label>
											<div class="invalid-feedback">Please, select
												Measurement!</div>
										</div>
									</div>
								</div>
								<div class="refresh_add" id="measurement_parent">
									<%@include file="include/refresh_add.jsp"%>

								</div>
								 --%>

								<div class="col-md-4 col-12 mb-2">
									<div class="control form-floating">
										<input type="hidden" name="Id" id="id" value="<%=id%>">
										<input type="hidden" name="User_id_fk" id="user_id_fk"
											value="1<%-- <%=user_id%> --%>"> <input type="text"
											value="<%=dto.getName()%>" class="form-control" id="name"
											name="Name" placeholder="name" required> <label
											for="name">Item Name</label>
										<div class="invalid-feedback">Please, enter Item Name!</div>
									</div>
								</div>

								<div class="col-md-4 col-12 mb-2">
									<div class="control form-floating">
										<input type="text" class="form-control" id="item_code"
											name="Item_code" value="<%=dto.getItem_code()%>"
											onblur="checkNameAvailsuv(this.value, '0', 'Item');"
											placeholder="code" required> <label for="code">
											Item Code</label>
										<div class="invalid-feedback">Please, enter Item Code!</div>
									</div>
								</div>

								<div class="col-md-4 col-12 mb-2">
									<div class="control form-floating">
										<input type="text" class="form-control" id="hsn_code"
											name="Hsn_code" value="<%=dto.getHsn_code()%>"
											placeholder="hsn_code" required> <label
											for="hsn_code"> HSN Code</label>
										<div class="invalid-feedback">Please, enter HSN Code!</div>
									</div>
								</div>

								<div class="col-md-4 col-12 mb-2">
									<div class="control form-floating">
										<input type="number" class="form-control" id="pur_price"
											name="Pur_price" value="<%=dto.getPur_price()%>"
											placeholder="pur_price" required> <label
											for="pur_price"> Purchase Price</label>
										<div class="invalid-feedback">Please, enter Purchase
											Price!</div>
									</div>
								</div>

								<div class="col-md-4 col-12 mb-2">
									<div class="control form-floating">
										<input type="number" class="form-control" id="sale_price"
											name="Sale_price" value="<%=dto.getSale_price()%>"
											placeholder="sale_price" required> <label
											for="sale_price"> Sale Price</label>
										<div class="invalid-feedback">Please, enter Sale Price!</div>
									</div>
								</div>


								<div class="col-md-4 col-12 mb-2">
									<div class="control form-floating">
										<select class="form-select" id="gst_per" name="Gst_per"
											aria-label="working post" required>
											<option value="5"
												<%if (dto.getGst_per() == 5) {
	out.print("selected");
}%>>5%</option>

											<option value="12"
												<%if (dto.getGst_per() == 12) {
	out.print("selected");
}%>>12%</option>

											<option value="18"
												<%if (dto.getGst_per() == 18) {
	out.print("selected");
}%>>18%</option>

											<option value="28"
												<%if (dto.getGst_per() == 28) {
	out.print("selected");
}%>>28%</option>

											<option value="40"
												<%if (dto.getGst_per() == 40) {
	out.print("selected");
}%>>40%</option>

											<option value="0"
												<%if (dto.getGst_per() == 0) {
	out.print("selected");
}%>>0%</option>

										</select> <label for="cat_id_fk">Select GST Percentage</label>
										<div class="invalid-feedback">Please, select GST
											Percentage!</div>
									</div>
								</div>



								<div class="col-md-4 col-12 mb-2">
									<div class="control form-floating">
										<input type="number" class="form-control" id="min_qty"
											name="Min_qty" value="<%=dto.getMin_qty()%>"
											placeholder="Min_qty"> <label for="Min_qty">
											Low stock</label>
										<div class="invalid-feedback">Please, enter Minimum
											Limit!</div>
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

										<div class="invalid-feedback">Please, select item
											Status!</div>

									</div>

								</div>

								<div class="col-md-4 col-12 mb-2"></div>

								<div class="col-md-4 col-12 mb-2"></div>

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
	<script>
		function refreshCategory() {

			//alert("Start");
			var flag = 'Category';

			$.ajax({

				url : 'AjaxAvailableItem.jsp',
				data : 'Flag=' + flag,
				type : 'post',
				success : function(msg) {

					//alert(msg);

					$('#cat_id_fk').html(msg);

				}
			});

		}
		function refreshMeasurement() {

			//alert("Start");
			var flag = 'Measurement';

			$.ajax({

				url : 'AjaxAvailableItem.jsp',
				data : 'Flag=' + flag,
				type : 'post',
				success : function(msg) {

					//alert(msg);

					$('#measure_id_fk').html(msg);

				}
			});

		}
	</script>
	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>

</html>