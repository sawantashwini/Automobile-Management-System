<%@page import="com.dto.CompanyDto"%>
<%@page import="com.service.CompanyService"%>
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


		<!-- ======= Breadcrumbs ======= -->
		<%@include file="breadcrumbs/vehicles.jsp"%>
		<!--  Breadcrumbs End-->
		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Purchase Vehicle</h1>
			</div>
		</div>



		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-10">

					<div class="card">
						<div class="card-body">

							<!-- Floating Labels Form -->
							<form autocomplete="off" action="VehicleInfoServlet"
								method="post" class="row g-3 needs-validation pt-3" novalidate>


								<input type="hidden" name="User_id_fk" id="user_id_fk"
									value="<%=user_id%>">


								<div class="col-sm-4 col-4">
									<div class="control form-floating">
										<input type="date" class="form-control" id="purchase_date"
											name="Purchase_date" placeholder="Purchase Date" required
											value="<%=current_date%>"> <label for="purchase_date">Purchase
											Date</label>
										<div class="invalid-feedback">Please, Enter Purchase
											Date!</div>
									</div>
								</div>
								<div class="col-sm-4 col-4 refresh-container"
									data-add="add_company.jsp" data-list="company">
									<div class="control form-floating refresh-input">
										<input type="text" class="form-control"
											id="bike_company_name" placeholder="Select Company" required>
										<input type="hidden" id="bike_company_id_fk"
											name="Bike_company_id_fk" value="0" /> <label
											for="bike_company_id_fk">Select Company</label>
										<div class="invalid-feedback">Please, Select Company!</div>
									</div>

								</div>
								<%-- <div class="col-sm-4 col-4">
									<div id="bike_company_id_fk">
										<div class="control form-floating">
											<select class="form-select" name="Bike_company_id_fk"
												aria-label="working post" required>
												<option value="0">Select Bike Company</option>
												<%
												CompanyService bike_ser = new CompanyService();

												ArrayList<CompanyDto> comp_list = bike_ser.getActiveCompanyInfo(config, request);

												for (CompanyDto com_dto : comp_list) {
												%>

												<option value="<%=com_dto.getId()%>"><%=com_dto.getName()%></option>


												<%
												}
												%>

											</select> <label for="bike_company_id_fk">Company</label>
											<div class="invalid-feedback">Please, Select Company!</div>
										</div>
									</div>
								</div>
								<div class="refresh_add" id="company_parent">
									<%@include file="include/refresh_add.jsp"%>

								</div> --%>
								<div class="col-sm-4 col-4 refresh-container"
									data-add="add_color.jsp" data-list="color">
									<div class="control form-floating refresh-input">
										<input type="text" class="form-control" id="color_name"
											placeholder="Select Color" required> <input
											type="hidden" id="color_id_fk" name="Color_id_fk" value="0" />
										<label for="color_id_fk">Select Color</label>
										<div class="invalid-feedback">Please, Select Color!</div>
									</div>

								</div>
								<%-- <div class="col-sm-4 col-4">
									<div id="color_id_fk">
										<div class="control form-floating">
											<select class="form-select" name="Color_id_fk"
												aria-label="working post" required>
												<option value="0">Select Color</option>


												<%
												ColorService color_ser = new ColorService();

												ArrayList<ColorDto> color_list = color_ser.getActiveColorInfo(config, request);

												for (ColorDto color_dto : color_list) {
												%>

												<option value="<%=color_dto.getId()%>"><%=color_dto.getName()%></option>


												<%
												}
												%>
											</select> <label for="color_id_fk">Color</label>
											<div class="invalid-feedback">Please, select Bike
												Color!</div>
										</div>
									</div>
								</div>
								<div class="refresh_add" id="color_parent">
									<%@include file="include/refresh_add.jsp"%>
								</div>
 --%>
								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="model_name"
											name="Model_name" placeholder="Model Name" required>
										<label for="model_name">Model Name</label>
										<div class="invalid-feedback">Please, Enter Model Name!</div>
									</div>
								</div>

								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="chassis_no"
											name="Chassis_no" placeholder="Chassis No." required>
										<label for="chassis_no">Chassis No.</label>
										<div class="invalid-feedback">Please, Enter Chassis
											Number!</div>
									</div>
								</div>

								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="engine_no"
											name="Engine_no" placeholder="Engine No." required> <label
											for="engine_no">Engine No.</label>
										<div class="invalid-feedback">Please, Enter Engine
											Number!</div>
									</div>
								</div>

								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="service_book_no"
											name="Service_book_no" placeholder="Service Book No."
											required> <label for="service_book_no">Service
											Book No.</label>
										<div class="invalid-feedback">Please, Enter Service Book
											Number!</div>
									</div>
								</div>


								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="controller_no"
											name="Controller_no" placeholder="Controller No." required>
										<label for="controller_no">Controller No.</label>
										<div class="invalid-feedback">Please, Enter Controller
											Number!</div>
									</div>
								</div>

								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="converter_no"
											name="Converter_no" placeholder="Converter No." required>
										<label for="converter_no">Converter No.</label>
										<div class="invalid-feedback">Please, Enter Converter
											Number!</div>
									</div>
								</div>

								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="remote_no"
											name="Remote_no" placeholder="Remote No." required> <label
											for="remote_no">Remote No.</label>
										<div class="invalid-feedback">Please, Enter Remote
											Number!</div>
									</div>
								</div>

								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="key_number"
											name="Key_number" placeholder="Key No." required> <label
											for="key_number">Key No.</label>
										<div class="invalid-feedback">Please, Enter Key Number!</div>
									</div>
								</div>

								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="charger_number"
											name="Charger_number" placeholder="Charger No." required>
										<label for="charger_number">Charger No.</label>
										<div class="invalid-feedback">Please, Enter Charger
											Number!</div>
									</div>
								</div>

								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="vehicle_no"
											name="Vehicle_no" placeholder="Vehicle No." required>
										<label for="vehicle_no">Vehicle No.</label>
										<div class="invalid-feedback">Please, Enter Vehicle
											Number!</div>
									</div>
								</div>









								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="battery1_no"
											name="Battery1_no" placeholder="Battery No." required>
										<label for="battery1_no">Battery 1 No.</label>
										<div class="invalid-feedback">Please, Enter Battery
											Number!</div>
									</div>
								</div>

								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="battery2_no"
											name="Battery2_no" placeholder="Battery 2 No." required>
										<label for="battery2_no">Battery 2 No.</label>
										<div class="invalid-feedback">Please, Enter Battery 2
											Number!</div>
									</div>
								</div>

								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="battery3_no"
											name="Battery3_no" placeholder="Battery 3 No." required>
										<label for="battery3_no">Battery 3 No.</label>
										<div class="invalid-feedback">Please, Enter Battery 3
											Number!</div>
									</div>
								</div>

								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="battery4_no"
											name="Battery4_no" placeholder="Battery 4 No." required>
										<label for="battery4_no">Battery 4 No.</label>
										<div class="invalid-feedback">Please, Enter Battery 4
											Number!</div>
									</div>
								</div>

								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="battery5_no"
											name="Battery5_no" placeholder="Battery 5 No." required>
										<label for="battery5_no">Battery 5 No.</label>
										<div class="invalid-feedback">Please, Enter Battery 5
											Number!</div>
									</div>
								</div>

								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="battery6_no"
											name="Battery6_no" placeholder="Battery 6 No." required>
										<label for="battery6_no">Battery 6 No.</label>
										<div class="invalid-feedback">Please, Enter Battery 6
											Number!</div>
									</div>
								</div>




								<%-- 	<%
								VehicleInfoService sell_ser = new VehicleInfoService();
								String invoice = sell_ser.getMaxInvoiceNo(current_date, request, config);

								int max_invoice_id = 1;

								if (invoice != null) {
									max_invoice_id = Integer.parseInt(invoice);
									max_invoice_id = max_invoice_id + 1;
								}
								%> --%>

								<!-- Invoice No. start -->
								<div class="col-md-4 col-6">
									<div class="control form-floating">

										<input type="number" class="form-control" id="invoice_no"
											name="Invoice_no" placeholder="invoice_no"><label
											for="invoice_no">Invoice No.</label>
									</div>
								</div>
								<!-- Invoice No. End -->

								<div class="col-sm-4 col-6">
									<div class="control form-floating">
										<input type="number" class="form-control" id="purchase_price"
											name="Purchase_price" placeholder="Purchase Price"
											step="0.01" required> <label for="purchase_price">Purchase
											Price</label>
										<div class="invalid-feedback">Please, Enter Purchase
											Price!</div>
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
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script>
		//----------------------------------------
		//Breadcrumbs
		//----------------------------------------

		$('.breadcrumbs li a').each(
				function() {

					var breadWidth = $(this).width();

					if ($(this).parent('li').hasClass('active')
							|| $(this).parent('li').hasClass('first')) {

					} else {

						$(this).css('width', 75 + 'px');

						$(this).mouseover(function() {
							$(this).css('width', 130 + 'px');
						});

						$(this).mouseout(function() {
							$(this).css('width', 75 + 'px');
						});
					}

				});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(window).keydown(function(event) {
				if (event.keyCode == 13) {
					event.preventDefault();
					return false;
				}
			});
		});
	</script>
	<script type="text/javascript">
		function refreshCompany() {

			//alert("Start");
			var flag = 'Company';

			$.ajax({

				url : 'AjaxAvailableItem.jsp',
				data : 'Flag=' + flag,
				type : 'post',
				success : function(msg) {

					//alert(msg);

					$('#bike_company_id_fk').html(msg);

				}
			});

		}
		function refreshColor() {

			//alert("Start");
			var flag = 'Color';

			$.ajax({

				url : 'AjaxAvailableItem.jsp',
				data : 'Flag=' + flag,
				type : 'post',
				success : function(msg) {

					//alert(msg);

					$('#color_id_fk').html(msg);

				}
			});

		}
	</script>
	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>

</html>