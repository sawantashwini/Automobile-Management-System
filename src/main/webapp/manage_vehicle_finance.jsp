<%@page import="com.dto.PaymentDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>


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


		<div class="pagetitle text-center">
			<h1 id=page_title>Vehicle Finance Report</h1>
		</div>

		<section class="section">
			<div class="row justify-content-center">




				<div class="card ">
					<div class="card-body table-responsive">







						<%
						NumberFormat format = new DecimalFormat("##.##");

						String d1 = request.getParameter("D1") == null ? "" : request.getParameter("D1");
						String d2 = request.getParameter("D2") == null ? "" : request.getParameter("D2");
						String first_date = LogFileService.changeFormate(d1, "yyyy-MM-dd", "dd-MM-yyyy") == null
								? ""
								: LogFileService.changeFormate(d1, "yyyy-MM-dd", "dd-MM-yyyy");
						String second_date = LogFileService.changeFormate(d2, "yyyy-MM-dd", "dd-MM-yyyy") == null
								? ""
								: LogFileService.changeFormate(d2, "yyyy-MM-dd", "dd-MM-yyyy");
						int i = Integer.parseInt(request.getParameter("periods") == null ? "0" : request.getParameter("periods"));

						if (i != 0) {
							String temp = LogFileService.getEndDates("yyyy-MM-dd", i);
							String dates[] = temp.split(",");
							d1 = dates[0];
							d2 = dates[1];
							System.out.println(temp);
						}
						%>


						<div class="row " id="table_search">
							<form autocomplete="off"
								class="row g-3 d-flex justify-content-center">

								<div class="col-md-2 col-4">
									<div class="form-floating control">
										<input type="date" class="form-control " id="d1" name="D1"
											value="<%=d1 == null ? "" : d1%>"> <label
											for="floatingName">From Date</label>
									</div>
								</div>


								<div class="col-md-2 col-4">
									<div class="form-floating control">
										<input type="date" class="form-control " id="d2" name="D2"
											value="<%=d2 == null ? "" : d2%>"> <label
											for="floatingPhone">To Date</label>
									</div>
								</div>
								<div class="col-md-2 col-4">
									<div class="form-floating control">
										<select class="form-control" id="periods" name="periods">
											<option value="0">- Select -</option>
											<option
												<%if (i == 1) {
	out.print("selected='selected'");
}%>
												value="1">Today</option>
											<option
												<%if (i == 3) {
	out.print("selected='selected'");
}%>
												value="3">weekly</option>
											<option
												<%if (i == 5) {
	out.print("selected='selected'");
}%>
												value="5">monthly</option>
<option
												<%if (i == 6) {
	out.print("selected='selected'");
}%>
												value="6">yearly</option>
										</select> <label for="floatingPhone">To Date</label>
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
							<thead class="text-center" id="thead">
								<tr>
									<th style="text-align: center;" width="3%">S.No.</th>
									<th style="text-align: center;" width="8%">Finance Amt.</th>

									<th style="text-align: center;" width="5%">Date</th>
									<th style="text-align: center;" width="6%">Finance paid
										Amt.</th>
									<th style="text-align: center;" width="6%">Cheque No.</th>
									<th style="text-align: center;" width="5%">Online date</th>

									<th style="text-align: center;" width="10%">Remark</th>

									<th style="text-align: center;" width="6%">Bank</th>

									<th style="text-align: center;" width="5%">Bike Company</th>
									<th style="text-align: center;" width="6%">Model Name</th>
									<th style="text-align: center;" width="6%">Chassis No.</th>
									<th style="text-align: center;" width="6%">Engine No.</th>

									<th style="text-align: center;" width="15%">Customer Name</th>
									<th style="text-align: center;" width="6%">Customer Mobile</th>
									<th style="text-align: center;" width="15%">Customer
										Address</th>


									<!-- 	<th style="text-align: center;" width="5%">Print</th> -->


								</tr>
							</thead>

							<tbody class="tbody" id="tbody" class="text-center">


								<%
								VehicleFinanceService service = new VehicleFinanceService();
								ArrayList<VehicleInfoDto> list = service.getVehicleFinanceInfo(d1, d2, config, request);
								float total = 0;

								for (VehicleInfoDto dto : list) {
								%>


								<tr>
									<td><%=list.indexOf(dto) + 1%></td>
									<td><%=dto.getFinance_amount()%> / <%
									if (dto.getFinance_online_id_fk() != 0) {
									%><a
										class="main-color"
										href="pay_vehicle_finance.jsp?id=<%=dto.getId()%>">Edit</a> <%
 } else {
 %><a
										class="main-color"
										href="pay_vehicle_finance.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a> <%
 }
 %></td>
									<td><%=dto.getFinance_pay_date() == null || dto.getFinance_pay_date() == ""
		? "-"
		: LogFileService.changeFormate(dto.getFinance_pay_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
									<td class="main-color">
										<%
										if (dto.getFinance_pay_date() == "") {
										%>0<%
										} else {
										%><%=dto.getFinance_amount()%>
										<%
										total = total + dto.getFinance_amount();
										}
										%>
									</td>

									<td><%=dto.getFinance_cheque_no() == null || dto.getFinance_cheque_no() == "" ? "-" : dto.getFinance_cheque_no()%></td>
									<td><%=dto.getFinance_online_date() == null || dto.getFinance_online_date() == ""
		? "-"
		: LogFileService.changeFormate(dto.getFinance_online_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
									<td><%=dto.getFinance_remark() == null || dto.getFinance_remark() == "" ? "-" : dto.getFinance_remark()%></td>
									<td><%=dto.getBank_name() == null || dto.getBank_name() == "" ? "-" : dto.getBank_name()%></td>

									<td><%=dto.getBike_company_name()%></td>
									<td><%=dto.getModel_name()%></td>
									<td><%=dto.getChassis_no()%></td>
									<td><%=dto.getEngine_no()%></td>

									<td><%=dto.getCustomer_name()%></td>
									<td><%=dto.getCustomer_mobile_no()%></td>
									<td><%=dto.getCustomer_address()%></td>

									</tr>
								<%
								}
								%>
							</tbody>
							<tfoot id="tfoot">
								<tr>
									<td></td>
									<td></td>
									<td>Total</td>
									<td><%=total%></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>


								</tr>
							</tfoot>
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