<%@page import="com.dto.VehicleInfoDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.VehicleInfoService"%>


<!-- head -->
<%@include file="include/head.jsp"%>
<!-- head end -->
</head>


<body>
	<%
	String model_name = request.getParameter("Model_name") == null ? "" : request.getParameter("Model_name");
	String chassis_no = request.getParameter("Chassis_no") == null ? "" : request.getParameter("Chassis_no");
	String engine_no = request.getParameter("Engine_no") == null ? "" : request.getParameter("Engine_no");
	%>

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
		<div class="pagetitle text-center">
			<h1 id=page_title>Vehicle Stock Report</h1>
		</div>
	<%@include file="include/add_pages.jsp"%>
		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">

						<div class="row " id="table_search">
							<form autocomplete="off"
								class="row g-3 d-flex justify-content-center">
								<div class="col-lg-2 col-md-3 col-6">
									<div class="control form-floating" style="height: 50px">
										<input type="text" class="form-control" list="browsers"
											value="<%=model_name == "" || model_name == null ? "" : model_name%>"
											placeholder="Model name" id="name_search" name="Model_name"
											style="padding: 7px; text-align: left;" autocomplete="off" />
										<datalist id="browsers">
											<%
											VehicleInfoService ser = new VehicleInfoService();
											ArrayList<VehicleInfoDto> i_list = ser.getVehicleModelName(config, request);
											for (VehicleInfoDto i_dto : i_list) {
											%>
											<option value="<%=i_dto.getModel_name()%>" />
											<%
											}
											%>
										</datalist>
										<label for="name_search">Model No</label>
									</div>
								</div>
								<div class="col-lg-2 col-md-3 col-6">
									<div class="control form-floating" style="height: 50px">
										<input type="text" class="form-control" list="browsers1"
											value="<%=chassis_no == "" || chassis_no == null ? "" : chassis_no%>"
											placeholder="Chassis no" id="name_search" name="Chassis_no"
											style="padding: 7px; text-align: left;" autocomplete="off" />
										<datalist id="browsers1">
											<%
											for (VehicleInfoDto i_dto : i_list) {
											%>
											<option value="<%=i_dto.getChassis_no()%>" />
											<%
											}
											%>
										</datalist>
										<label for="name_search">Chassis No</label>
									</div>
								</div>
								<div class="col-lg-2 col-md-3 col-6">
									<div class="control form-floating" style="height: 50px">
										<input type="text" class="form-control" list="browsers2"
											value="<%=engine_no == "" || engine_no == null ? "" : engine_no%>"
											placeholder="Engine no " id="name_search" name="Engine_no"
											style="padding: 7px; text-align: left;" autocomplete="off" />
										<datalist id="browsers2">
											<%
											for (VehicleInfoDto i_dto : i_list) {
											%>
											<option value="<%=i_dto.getEngine_no()%>" />
											<%
											}
											%>
										</datalist>
										<label for="name_search">Engine No.</label>
									</div>
								</div>

								<div class="col-md-2 col-4">
									<div class="form-floating">
										<button type="submit" class="submit-btn">Submit</button>
									</div>
								</div>
							</form>
						</div>
						<br>

						<table id="example" class="table hover nowrap"
							style="min-width: 1400px;">


							<thead id="thead">
								<tr>
									<!--  
								sold_status,STATUS, -->
									<th style="text-align: center;" width="5%">S.No.</th>
									<th style="text-align: center;" width="5%">For Sale</th>
									<th style="text-align: center;" width="5%">Purchase Date</th>
									<th style="text-align: center;" width="5%">Model Name</th>
									<th style="text-align: center;" width="5%">Chassis No.</th>
									<th style="text-align: center;" width="5%">Engine No.</th>

									<th style="text-align: center;" width="16%">Company</th>
									<th style="text-align: center;" width="5%">Color</th>

									<th style="text-align: center;" width="5%">Ser. Book No.</th>
									<th style="text-align: center;" width="5%">Controller</th>

									<th style="text-align: center;" width="5%">Converter</th>
									<th style="text-align: center;" width="5%">Remote</th>

									<th style="text-align: center;" width="5%">Invoice</th>
									<th style="text-align: center;" width="5%">Key No.</th>

									<th style="text-align: center;" width="5%">Charger No.</th>
									<th style="text-align: center;" width="5%">Vehicle No.</th>

									<th style="text-align: center;" width="5%">Battery 1</th>
									<th style="text-align: center;" width="5%">Battery 2</th>
									<th style="text-align: center;" width="5%">Battery 3</th>
									<th style="text-align: center;" width="5%">Battery 4</th>
									<th style="text-align: center;" width="5%">Battery 5</th>
									<th style="text-align: center;" width="5%">Battery 6</th>

									<th style="text-align: center;" width="5%">Base Price</th>

									<th style="text-align: center;" width="5%">Print</th>
									<th style="text-align: center;" width="2%">Edit</th>
									<th style="text-align: center;" width="2%">Del.</th>
								</tr>
							</thead>
							<tbody id="tbody">


								<%
								VehicleInfoService service = new VehicleInfoService();
								ArrayList<VehicleInfoDto> list = service.getStockVehicleInfo(model_name, chassis_no, engine_no, config, request);

								for (VehicleInfoDto dto : list) {
								%>


								<tr>
									<td><%=list.indexOf(dto) + 1%></td>
									<td><a class="main-color"
										href="sold_vehicle.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
									<td><%=LogFileService.changeFormate(dto.getPurchase_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>

									<td class="main-color"><%=dto.getModel_name()%></td>

									<td><%=dto.getChassis_no()%></td>
									<td><%=dto.getEngine_no()%></td>

									<td><%=dto.getBike_company_name()%></td>
									<td><%=dto.getColor_name()%></td>

									<td><%=dto.getService_book_no()%></td>
									<td><%=dto.getController_no()%></td>

									<td><%=dto.getConverter_no()%></td>
									<td><%=dto.getRemote_no()%></td>

									<td><%=dto.getInvoice_no()%></td>
									<td><%=dto.getKey_number()%></td>

									<td><%=dto.getCharger_number()%></td>
									<td><%=dto.getVehicle_no()%></td>

									<td><%=dto.getBattery1_no()%></td>
									<td><%=dto.getBattery2_no()%></td>
									<td><%=dto.getBattery3_no()%></td>
									<td><%=dto.getBattery4_no()%></td>
									<td><%=dto.getBattery5_no()%></td>
									<td><%=dto.getBattery6_no()%></td>
									<td><%=dto.getPurchase_price()%></td>


									<td><a class="main-color"
										href="print_purchase_vehicle.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-printer"></i></a></td>
									<td><a class="main-color"
										href="edit_stock_vehicle.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
									<td><a
										onclick="return confirm('Are you sure? You want to delete')"
										href="AjaxService/AjaxDelete.jsp?vehicle_id=<%=dto.getId()%>"><i
											class="bi bi-trash main-color"></i></a></td>
								</tr>

								<%
								}
								%>



							</tbody>
						</table>
					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

	<!-- print script without date-->
	<script>
	var page_title=document.getElementById('page_title').innerHTML;
	function printfunction(){
		return '<h1 style="text-align:center;margin-bottom:10px;">'+page_title+'</h1><br><h5 style="text-align:center;">Model Name:<%=model_name%>/Chassis no:<%=chassis_no%>/Engine no:<%=engine_no%></h5>';
	}
	function printOtherfunction(){
		return 'Model Name:<%=model_name%>/Chassis no:<%=chassis_no%>/Engine no:<%=engine_no%>
		';
		}
		function printTitle() {
			return page_title;
		}
	</script>
	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->

<!-- ======= Footer ======= -->
	<%@include file="include/datatable_script_footer.jsp"%>
	<!-- End Footer -->

</body>

</html>