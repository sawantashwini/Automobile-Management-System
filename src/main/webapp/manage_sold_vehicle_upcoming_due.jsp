<%@page import="com.dto.VehicleInfoDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.VehicleInfoService"%>


<!-- head -->
<%@include file="include/head.jsp"%>
<!-- head end -->
</head>

<body>
	<div id="ser"></div>

	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->



	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->

	<main id="main" class="main">

		<%-- <!-- ======= Breadcrumbs ======= -->
	<%@include file="breadcrumbs/vehicles.jsp"%>
	<!--  Breadcrumbs End--> --%>

		<div class="pagetitle text-center">
			<h1 id=page_title>Vehicle Upcoming Due Report</h1>
		</div>

		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">

						
						<br>

						<table id="examples" class="table hover nowrap"
							style="min-width: 100%;">


							<thead id="thead">
								<tr>
									<th style="text-align: center;" width="5% ">S.No.</th>
									<!-- <th style="text-align: center;" width="10% ">Sold Date</th> -->
									<th style="text-align: center;" width="5% ">Upcoming date</th>
									<th style="text-align: center;" width="10% ">Sale Price</th>
									<th style="text-align: center;" width="10% ">Due Amt.</th>

									<th style="text-align: center;" width="10% ">Paid Amt.</th>
									<th style="text-align: center;" width="10% ">Remaing Amt.</th>

									<th style="text-align: center;" width="10%">Finance Amt.</th>
									<th style="text-align: center;" width="5%">Model Name</th>
									<th style="text-align: center;" width="5%">Chassis No.</th>
									<th style="text-align: center;" width="5%">Engine No.</th>
									<!-- <th style="text-align: center;" width="5%">Service Count.</th>
									<th style="text-align: center;" width="5%">Done Ser. </th> -->
									<!-- <th style="text-align: center;" width="5% ">Company</th>
									<th style="text-align: center;" width="5% ">Color</th> -->

									<th style="text-align: center;" width="5% ">Vehicle No.</th>
									<th style="text-align: center;" width="5% ">Name</th>

									<th style="text-align: center;" width="5% ">Mo. No.</th>
									<!-- <th style="text-align: center;" width="5% ">Address</th>

									<th style="text-align: center;" width="5% ">City</th> -->

									<th style="text-align: center;" width="5% ">Upcoming
										remark</th>
									


								</tr>
							</thead>
							<tbody id="tbody">


								<%
								VehicleInfoService service = new VehicleInfoService();
								ArrayList<VehicleInfoDto> list = service.getSoldVehicleUpcomingDueInfo(config, request);

								for (VehicleInfoDto dto : list) {
								%>


								<tr>
									<td><%=list.indexOf(dto) + 1%></td>
									<td><%=LogFileService.changeFormate(dto.getUpcoming_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
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
									%><a class="main-color"
										href="pay_vehicle_finance.jsp?id=<%=dto.getId()%>">Done</a> <%
 } else {
 %><a class="main-color"
										href="pay_vehicle_finance.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a> <%
 }
 %></td>
									<td class="main-color"><%=dto.getModel_name()%></td>

									<td><%=dto.getChassis_no()%></td>
									<td><%=dto.getEngine_no()%></td>
									
									<td><%=dto.getVehicle_no()%></td>

									<td><%=dto.getCustomer_name()%></td>
									<td><%=dto.getCustomer_mobile_no()%></td>
										<td><%=dto.getUpcoming_remark()%></td>
									
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


	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->

<!-- ======= Footer ======= -->
	<%@include file="include/datatable_script_footer.jsp"%>
	<!-- End Footer -->

</body>

</html>