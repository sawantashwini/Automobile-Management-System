<%@page import="com.dto.VehicleInfoDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.VehicleInfoService"%>


<!-- head -->
<%@include file="include/head.jsp"%>
<!-- head end -->
</head>

<body >
	<div id="ser"></div>
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
			<h1 id=page_title>Sold Vehicle Report</h1>
		</div>

		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">

						<div class="row " id="table_search">
							<form autocomplete="off" class="row g-3 d-flex justify-content-center">
								<div class="col-lg-2 col-md-3 col-6">
									<div class="control form-floating" style="height: 50px">
										<input type="text" class="form-control" list="browsers"
											value="<%=model_name == "" || model_name == null ? "" : model_name%>"
											placeholder="Model name" id="model_name" name="Model_name"
											style="padding: 7px; text-align: left;" autocomplete="off" />
										<datalist id="browsers">
											<%
											VehicleInfoService ser = new VehicleInfoService();
											ArrayList<VehicleInfoDto> i_list = ser.getVehicleModelName1(config, request);
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
											placeholder="Chassis no" id="chassis_no" name="Chassis_no"
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
											placeholder="Engine no " id="engine_no" name="Engine_no"
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

						<table id="example1" class="table hover nowrap"
							style="min-width: 100%;">


							<thead id="thead">
								<tr>
									<th style="text-align: center;" width="5% ">S.No.</th>
										<th style="text-align: center;" width="3%">Image</th>
									<th style="text-align: center;" width="10% ">Sold Date</th>

									<th style="text-align: center;" width="10% ">Sale Price</th>
									<th style="text-align: center;" width="10% ">Due Amt.</th>

									<th style="text-align: center;" width="10% ">Paid Amt.</th>
									<th style="text-align: center;" width="10% ">Remaing Amt.</th>

									<th style="text-align: center;" width="10%">Finance Amt.</th>
									<th style="text-align: center;" width="5%">Model Name</th>
									<th style="text-align: center;" width="5%">Chassis No.</th>
									<th style="text-align: center;" width="5%">Engine No.</th>
									<th style="text-align: center;" width="5%">Add Job card</th>
									<th style="text-align: center;" width="5%">Service Count.</th>
									<th style="text-align: center;" width="5%">Done Ser. </th>
									<th style="text-align: center;" width="5% ">Company</th>
									<th style="text-align: center;" width="5% ">Color</th>

									<th style="text-align: center;" width="5% ">Vehicle No.</th>
									<th style="text-align: center;" width="5% ">Name</th>

									<th style="text-align: center;" width="5% ">Mo. No.</th>
									<th style="text-align: center;" width="5% ">Address</th>

									<th style="text-align: center;" width="5% ">City</th>
									<th style="text-align: center;" width="5% ">Upcomind date</th>
									<th style="text-align: center;" width="5% ">Upcoming remark</th>
									<th style="text-align: center;" width="5% ">Id Status</th>

									<th style="text-align: center;" width="5% ">Photo Status</th>
									<th style="text-align: center;" width="1% ">Print</th>
									<th style="text-align: center;" width="1% ">View</th>

									<th style="text-align: center;" width="1% ">Edit</th>
									<th style="text-align: center;" width="1% ">Del.</th>


								</tr>
							</thead>
							<tbody id="tbody">


								<%
								VehicleInfoService service = new VehicleInfoService();
								ArrayList<VehicleInfoDto> list = service.getSoldVehicleInfo(model_name, chassis_no, engine_no, config, request);

								for (VehicleInfoDto dto : list) {
								%>


								<tr>
									<td><%=list.indexOf(dto) + 1%></td>
									<td>
										<div class="align-item-center justify-content-center">
											<img src="VehicleCustomerImage/<%=dto.getId()%>.jpg" width="49px"
												height="49px" style="border: 1px solid gray;" alt="" />
										</div>
									</td>
									<td><%=LogFileService.changeFormate(dto.getSold_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>

									<td><%=dto.getSale_price()%></td>
									<td><%=dto.getDue_sale_price()%></td>
									<td><%=dto.getDue_sale_price_paid()%> <%
 if ((dto.getDue_sale_price() - dto.getDue_sale_price_paid()) > 0) {
 %>/ <a class="main-color"
										href="pay_vehicle_due.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a> <%
 }
 %> / <a class="main-color"
										href="manage_vehicle_due.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-image"></i></a></td>

									<td>
										<%
										if ((dto.getDue_sale_price() - dto.getDue_sale_price_paid()) > 0) {
										%> <%=dto.getDue_sale_price() - dto.getDue_sale_price_paid()%>
										<%
										} else {
										%>Done<%
										}
										%>
									</td>


									<td><%=dto.getFinance_amount()%> / <%
									if (dto.getFinance_online_id_fk() != 0) {
									%>Done<%
 } else {
 %><a class="main-color"
										href="pay_vehicle_finance.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a> <%
 }
 %></td>
									<td class="main-color"><%=dto.getModel_name()%></td>

									<td><%=dto.getChassis_no()%></td>
									<td><%=dto.getEngine_no()%></td>
									<td><a id="main-color"
										href="add_job_card.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
									<td><%=dto.getService_count()%></td>
									<td><%=dto.getDone_service_count()%></td>

									<td><%=dto.getBike_company_name()%></td>
									<td><%=dto.getColor_name()%></td>

									<td><%=dto.getVehicle_no()%></td>

									<td><%=dto.getCustomer_name()%></td>
									<td><%=dto.getCustomer_mobile_no()%></td>
									<td><%=dto.getCustomer_address()%></td>
									<td><%=dto.getCity_name()%></td>
									<td><%=LogFileService.changeFormate(dto.getUpcoming_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
									<td><%=dto.getUpcoming_remark()%></td>
									<td><%=dto.getId_proof_status() == null ? "No" : dto.getId_proof_status()%></td>
									<td><%=dto.getPhoto_status() == null ? "No" : dto.getPhoto_status()%></td>

									<td><a id="main-color"
										href="print_sold_vehicle.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-printer"></i></a></td>
											<td><a id="main-color"
										href="view_sold_vehicle.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-image"></i></a></td>
									<td><a id=" main-color"
										href="sold_vehicle.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
									<td><a
										onclick="return confirm('Are you sure? You want to delete')"
										href="AjaxService/AjaxDelete.jsp?vehicle_id=<%=dto.getId()%>&flag=sold"><i
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