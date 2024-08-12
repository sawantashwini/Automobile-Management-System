
<%@page import="java.util.ArrayList"%>
<%@page import="com.dto.ServiceBillDto"%>
<%@page import="com.service.ServiceBillService"%>


<!-- head -->
<%@include file="include/head.jsp"%>
<!-- head end -->
</head>


<body>
	<%
	String d1 = request.getParameter("D1") == null ? "" : request.getParameter("D1");
	String d2 = request.getParameter("D2") == null ? "" : request.getParameter("D2");
	String first_date = LogFileService.changeFormate(d1, "yyyy-MM-dd", "dd-MM-yyyy") == null
			? ""
			: LogFileService.changeFormate(d1, "yyyy-MM-dd", "dd-MM-yyyy");
	String second_date = LogFileService.changeFormate(d2, "yyyy-MM-dd", "dd-MM-yyyy") == null
			? ""
			: LogFileService.changeFormate(d2, "yyyy-MM-dd", "dd-MM-yyyy");
	String type = request.getParameter("Type") == null ? "" : request.getParameter("Type");
	int i = Integer.parseInt(request.getParameter("periods") == null ? "0" : request.getParameter("periods"));

	if (i != 0) {
		String temp = LogFileService.getEndDates("yyyy-MM-dd", i);
		String dates[] = temp.split(",");
		d1 = dates[0];
		d2 = dates[1];
		System.out.println(temp);
	}
	%>

	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->



	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->

	<main id="main" class="main">


		<!-- ======= Breadcrumbs ======= -->
		<%@include file="breadcrumbs/service.jsp"%>
		<!--  Breadcrumbs End-->
		<div class="pagetitle text-center">
			<h1 id=page_title>Service Report</h1>
		</div>

		<section class="section">
			<div class="row">
				<div class="card">
					<div class="card-body table-responsive">

						<div class="row " id="table_search">
							<form autocomplete="off"
								class="row g-3 d-flex justify-content-center">
								<div class="col-md-2 col-4">
									<div class="form-floating control">
										<input type="date" class="form-control " id="d1" name="D1"
											value="<%=d1%>"> <label for="floatingName">From
											Date</label>
									</div>
								</div>

								<div class="col-md-2 col-4">
									<div class="form-floating control">
										<input type="date" class="form-control " id="d2" name="D2"
											value="<%=d2%>"> <label for="floatingPhone">To
											Date</label>
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
									<div class="form-floating control mb-3">
										<select class="form-select" id="type" name="Type"
											aria-label="working post">

											<option value="">All</option>

											<option value="Paid"
												<%if (type.equals("Paid")) {
	out.print("selected='selected'");
}%>>Paid</option>

											<option value="Free"
												<%if (type.equals("Free")) {
	out.print("selected='selected'");
}%>>Free</option>

										</select> <label for=" status">Status</label>

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
							style="min-width: 100%;">

							<thead id="thead">
								<tr>
									<th style="width: 3%; text-align: center;">S.N0.</th>
									<th style="width: 7%; text-align: center;">Bill Date</th>

									<th style="width: 4%; text-align: center;">Invoice</th>
									<th style="width: 8%; text-align: center;">Name</th>
									<th style="width: 6%; text-align: center;">Mob No.</th>
									<th style="width: 10%; text-align: center;">Address</th>
									<th style="width: 6%; text-align: center;">Final Amt.</th>
									<th style="width: 6%; text-align: center;">Bill Time Amt.</th>
									<th style="width: 5%; text-align: center;">Mode</th>
									<th style="width: 5%; text-align: center;">Cash</th>
									<th style="width: 5%; text-align: center;">Online</th>
									<th style="width: 6%; text-align: center;">Paid Amt.</th>
									<th style="width: 6%; text-align: center;">Due Amt.</th>
									<th style="width: 4%; text-align: center;">On. Way</th>
									<th style="width: 10%; text-align: center;">On. Remark</th>
									<th style="width: 6%; text-align: center;">On. Date</th>
									<th style="width: 6%; text-align: center;">Up. Date</th>
									<th style="width: 6%; text-align: center;">Up. remark</th>
									<th style="width: 12%; text-align: center;">Remark</th>
									<th style="width: 3%; text-align: center;">Edit</th>
									<th style="width: 3%; text-align: center;">Print</th>
									<th style="width: 3%; text-align: center;">Delete</th>
								</tr>
							</thead>
							<tbody class="tbody" id="tbody" class="text-center">


								<%
								ServiceBillService service = new ServiceBillService();
								ArrayList<ServiceBillDto> list = service.getServiceBillInfo(d1, d2, type, config, request);

								float total_cash = 0, total_online = 0, total_final_amt = 0, total_paid = 0, total_due = 0;
								for (ServiceBillDto dto : list) {
								%>


								<tr>
									<td><%=list.indexOf(dto) + 1%></td>
									<td><%=LogFileService.changeFormate(dto.getBill_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>

									<td class="main-color"><%=dto.getInvoice_no()%></td>

									<td><%=dto.getCustomer_name()%></td>
									<td><%=dto.getCustomer_mobile_no()%></td>
									<td><%=dto.getCustomer_address()%></td>
									<td class="main-color"><b><%=dto.getFinal_amount()%></b></td>
									<td class="main-color"><b><%=dto.getBill_time_amt()%></b></td>
									<td><%=dto.getPayment_mode()%></td>
									<td><%=dto.getCash_amount()%></td>
									<td><%=dto.getOnline_amount()%></td>
									<td class="main-color"><b><%=dto.getPaid_amount()%></b></td>
									<td class="main-color"><b><%=Math.round(dto.getFinal_amount() - dto.getPaid_amount())%></b>/<%
									if (dto.getFinal_amount() - dto.getPaid_amount() > 0) {
									%><a
										class="main-color"
										href="pay_service_due.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a> /&nbsp;<%
									}
									%><a
										class="main-color"
										href="manage_service_due.jsp?id=<%=dto.getId()%>"> <i
											class="bi bi-image"></i></a></td>
									<td><%=dto.getOnline_way() == null ? "-" : dto.getOnline_way()%></td>
									<td><%=dto.getOnline_remark() == null ? "-" : dto.getOnline_remark()%></td>
									<td><%=dto.getOnline_date() == null
		? "-"
		: LogFileService.changeFormate(dto.getOnline_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
									<td><%=dto.getUpcoming_date() == null
		? "-"
		: LogFileService.changeFormate(dto.getUpcoming_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
									<td><%=dto.getUpcoming_remark() == null ? "-" : dto.getUpcoming_remark()%></td>
									<td><%=dto.getRemark() == null ? "-" : dto.getRemark()%></td>

									<td><a class="main-color"
										href="edit_service_bill.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
									<td><a class="main-color"
										href="print_service_bill.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-printer"></i></a></td>
									<td><a
										onclick="return confirm('Are you sure? You want to delete')"
										href="AjaxService/AjaxDelete.jsp?service_id=<%=dto.getId()%>"><i
											class="bi bi-trash main-color"></i></a></td>
								</tr>

								<%
								total_final_amt = total_final_amt + dto.getFinal_amount();
								total_cash = total_cash + dto.getCash_amount();
								total_online = total_online + dto.getOnline_amount();
								total_paid = total_final_amt - dto.getDue_amt();
								total_due = total_due + dto.getDue_amt();
								}
								%>
							</tbody>

							<tfoot id="tfoot">
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td>Total</td>
									<td><%=total_final_amt%></td>
									<td></td>
									<td></td>
									<td><%=total_cash%></td>
									<td><%=total_online%></td>
									<td><%=Math.round(total_paid)%></td>
									<td><%=total_due%></td>
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
w
