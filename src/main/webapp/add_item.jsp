
<!-- ======= Head ======= -->
<%@include file="include/head.jsp"%>
<!-- ======= Head end======= -->

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
		<%@include file="breadcrumbs/item.jsp"%>
		<!--  Breadcrumbs End-->



		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-10">

					<div class="card mt-4">


						<div class="card-body">

							<br>
							<div class="row justify-content-center">
								<div class="pagetitle col-lg-8 text-center">
									<h1>Add Item</h1>
								</div>
							</div>

							<!-- Floating Labels Form -->
							<form autocomplete="off" action="ItemServlet" method="post"
								class="row g-3 needs-validation" novalidate>
								<div class="col-md-4 refresh-container mb-3"
									data-add="add_category.jsp" data-list="category">
									<div class="control form-floating refresh-input">
										<input type="text" class="form-control" id="cat_name"
											placeholder="Select Category"> <input type="hidden"
											id="cat_id_fk" name="Cat_id_fk" value="0" /> <label
											for="cat_name">Select Category</label>
										<div class="invalid-feedback">Please, Select Category!</div>
									</div>
								</div>
								<%-- <div class="col-md-3 col-4 mb-2">
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

												<option value="<%=c_dto.getId()%>"><%=c_dto.getName()%></option>


												<%
												}
												%>
											</select> <label for="cat_id_fk">Category</label>
											<div class="invalid-feedback">Please, Select Category!</div>
										</div>
									</div>
									
								</div>
								<div class="refresh_add" id="category_parent">
									<%@include file="include/refresh_add.jsp"%></div> --%>
								<%-- <div class="col-md-4 col-4 mb-2">
									<div id="measure_id_fk">

										<div class="control form-floating">

											<select class="form-select" name="Measure_id_fk"
												aria-label="working post" required>
												<option value="0">Select Measurement</option>


												<%
												MeasurementService color_ser = new MeasurementService();

												ArrayList<MeasurementDto> color_list = color_ser.getActiveMeasurementInfo(config, request);

												for (MeasurementDto color_dto : color_list) {
												%>

												<option value="<%=color_dto.getId()%>"><%=color_dto.getName()%></option>


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

								</div> --%>


								<div class="col-md-4 refresh-container mb-3"
									data-add="add_measurement.jsp" data-list="measure">
									<div class="control form-floating refresh-input">
										<input type="text" class="form-control" id="measure_name"
											placeholder="Select Measurement"> <input
											type="hidden" id="measure_id_fk" name="Measure_id_fk"
											value="0" /> <label for="measure_name">Select
											Measurement</label>
										<div class="invalid-feedback">Please, Select
											Measurement!</div>
									</div>
								</div>
								<div class="col-md-4 col-6 mb-2">
									<div class="control form-floating">
										<input type="hidden" name="User_id_fk" id="user_id_fk"
											value="1<%-- <%=user_id%> --%>"> <input type="text"
											class="form-control" id="name" name="Name" placeholder="Name"
											required> <label for="name">Item Name</label>
										<div class="invalid-feedback">Please, enter Item Name!</div>
									</div>
								</div>

								<div class="col-md-4 col-6 mb-2">
									<div class="control form-floating">
										<input type="text" class="form-control" id="item_code"
											name="Item_code"
											onblur="checkNameAvailsuv(this.value, '0', 'Item');"
											placeholder="Item_code" required> <label
											for="item_code"> Item Code</label>
										<div class="invalid-feedback">Please, enter Item Code!</div>
									</div>
								</div>

								<div class="col-md-4 col-6 mb-2">
									<div class="control form-floating">
										<input type="text" class="form-control" id="hsn_code"
											name="Hsn_code" placeholder="Hsn_code" required> <label
											for="hsn_code"> HSN Code</label>
										<div class="invalid-feedback">Please, enter HSN Code!</div>
									</div>
								</div>

								<div class="col-md-4 col-6 mb-2">
									<div class="control form-floating">
										<input type="number" class="form-control" id="pur_price"
											name="Pur_price" value="0" placeholder="Pur_price" required
											step=0.01 min="0"> <label for="pur_price">
											Purchase Price</label>
										<div class="invalid-feedback">Please, enter Purchase
											Price!</div>
									</div>
								</div>

								<div class="col-md-4 col-6 mb-2">
									<div class="control form-floating">
										<input type="number" class="form-control" id="sale_price"
											name="Sale_price" value="0" placeholder="Sale_price" required
											step=0.01 min="0"> <label for="sale_price">
											Sale Price</label>
										<div class="invalid-feedback">Please, enter Sale Price!</div>
									</div>
								</div>

								<div class="col-md-4 col-6 mb-2">
									<div class="control form-floating">
										<select class="form-select" id="gst_per" name="Gst_per"
											aria-label="working post" required>
											<option value="5" selected>5%</option>

											<option value="12">12%</option>

											<option value="18">18%</option>

											<option value="28">28%</option>

											<option value="40">40%</option>
											<option value="0">0%</option>


										</select> <label for="gst_per">Select GST Percentage</label>
										<div class="invalid-feedback">Please, select GST
											Percentage!</div>
									</div>
								</div>

								<div class="col-md-4 col-6 mb-2">
									<div class="control form-floating ">
										<input type="number" class="form-control" id="opening_qty"
											name="Opening_qty" value="0" placeholder="Opening_qty"
											min="0"> <label for="opening_qty"> Opening
											Quantity</label>
										<div class="invalid-feedback">Please, enter Opening
											Quantity!</div>
									</div>
								</div>

								<div class="col-md-4 col-6 mb-2">
									<div class="control form-floating">
										<input type="number" class="form-control" id="min_qty"
											name="Min_qty" value="0" placeholder="Min_qty" min="0">
										<label for="min_qty"> Low stock</label>
										<div class="invalid-feedback">Please, enter Minimum
											Limit!</div>
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