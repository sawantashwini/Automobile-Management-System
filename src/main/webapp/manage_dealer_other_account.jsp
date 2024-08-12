
<!-- ======= css ======= -->
<%@include file="include/head.jsp"%>
<!-- ======= css end======= -->

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
		<%@include file="breadcrumbs/othermodule.jsp"%>
		<!--  Breadcrumbs End-->
		
		<div class="pagetitle text-center">
			<h1 id="page_title" style="text-align: center;">Manage Other
				Dealer Account</h1>
		</div>

		<section class="section">
			<div class="row">

				<div class="card table-responsive">
					<div class="card-body">

						<!-- <br /> -->

						<%
						int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
						DealerOtherService service = new DealerOtherService();
						PurchaseOtherDto dto1 = service.getDealerOtherInfoById(id, config, request);
						%>


						<div class="table-responsive">
							<table class="table info-table table-borderless mt-4 table-color">
								<tr>
									<th width="80px">Name :</th>
									<td width="600px"><%=dto1.getName()%></td>
									<th width="100px">GstIn :</th>
									<td width="250px"><%=dto1.getGst_no()%></td>
									<th width="150px">Mobile no :</th>
									<td width="145px"><%=dto1.getMobile_no()%></td>
								</tr>

								<tr>
									<th>Add. :</th>
									<td><%=dto1.getAddress()%></td>
									<th>Due :</th>
									<td colspan="3"><%=dto1.getOld_due()%></td>

								</tr>
							</table>
						</div>


						<%
						NumberFormat format = new DecimalFormat("##.##");

						String d1 = request.getParameter("D1") == null ? "" : request.getParameter("D1");
						String d2 = request.getParameter("D2") == null ? "" : request.getParameter("D2");
						String first_date= LogFileService.changeFormate(d1, "yyyy-MM-dd", "dd-MM-yyyy");
						String second_date= LogFileService.changeFormate(d2, "yyyy-MM-dd", "dd-MM-yyyy");
int i = Integer.parseInt(request.getParameter("periods") == null ? "0" : request.getParameter("periods"));
	              		
	              		if (i != 0) {
	              			String temp = LogFileService.getEndDates("yyyy-MM-dd", i);
	              			String dates[] = temp.split(",");
	              			d1 = dates[0];
	              			d2 = dates[1];
	              			System.out.println(temp);
	              		}

						float tot_Credit = 0, tot_Debit = 0, Balance_Amt = 0;
						DealerOtherService ser = new DealerOtherService();
						ArrayList<PurchaseOtherDto> old_list = null;

						String get_last_date = "";

						if (!"".equals(d1) && !"".equals(d2)) {
							get_last_date = LogFileService.previousDateString(d1);
						}

						old_list = ser.getDealerAccountInfo(id, "2023-01-01", get_last_date, config, request);
						if (!"".equals(d1) && !"".equals(d2)) {
							for (PurchaseOtherDto acc_old_dto : old_list) {
								tot_Credit = tot_Credit + acc_old_dto.getCredit_amt();
								tot_Debit = tot_Debit + acc_old_dto.getDebit_amt();
							}
						}

						Balance_Amt = tot_Debit - tot_Credit;
						%>
						<div class="card-body">

							<div class="row " id="table_search">
								<form autocomplete="off" class="row g-3">

									<div class="col-md-2 col-4"></div>

									<div class="col-md-2 col-4">
										<div class="form-floating control">
											<input type="date" class="form-control " id="d1" name="D1"
												value="<%=d1 == null ? "" : d1%>"> <label
												for="floatingName">From Date</label>
										</div>
									</div>

									<input type="hidden" name="id" value="<%=id%>">

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
									<div class="col-md-2">
										<label class="cow" style="color: #ff0202;">Prev. Bal:
											<%=format.format(Balance_Amt)%></label>
									</div>
									<div class="col-md-2 col-4">
										<div class="form-floating">
											<button type="submit" class="submit-btn">Submit</button>
										</div>
									</div>
								</form>
							</div>
						</div>
						<br>


						<table id="example" class="table hover table-responsive nowrap">


							<thead class="text-center" id="thead">
								<tr>
									<th width="5%">S.NO.</th>
									<th width="5%">Credit</th>
									<th width="5%">Debit</th>
									<th width="10%">Balance</th>
									<th width="15%">Mode</th>
									<th width="5%">Cash</th>
									<th width="5%">Online</th>
									<th width="10%">Remark</th>
									<th width="10%">Online date</th>
									<th width="10%">Online way</th>
									<th width="10%">Pay date</th>
									<th width="5%">Type</th>
									<!-- <th width="5%">Print</th> -->

								</tr>
							</thead>
							<tbody class="text-center" id="tbody">
								<%
								ArrayList<PurchaseOtherDto> list = ser.getDealerAccountInfo(id, d1, d2, config, request);
								float total_debit = 0, total_credit = 0, total_cash = 0, total_online = 0;

								for (PurchaseOtherDto dto : list) {
									String online_date = (dto.getOnline_date() == null || dto.getOnline_date().equals("")) ? "N/A"
									: LogFileService.changeFormate(dto.getOnline_date(), "yyyy-MM-dd", "dd-MM-yyyy");
									String online_way = (dto.getOnline_way() == null || dto.getOnline_way().equals("")) ? "N/A" : dto.getOnline_way();
									String payment_mode = (dto.getPayment_mode() == null || dto.getPayment_mode().equals("")) ? "N/A"
									: dto.getPayment_mode();
									String in_date = (dto.getIn_date() == null || dto.getIn_date().equals("")) ? "N/A"
									: LogFileService.changeFormate(dto.getIn_date(), "yyyy-MM-dd", "dd-MM-yyyy");
									String remark = (dto.getRemark() == null || dto.getRemark().equals("")) ? "N/A" : dto.getRemark();

									if (Balance_Amt < 0) {
										Balance_Amt = (Balance_Amt - dto.getCredit_amt()) + dto.getDebit_amt();
									} else {
										Balance_Amt = (Balance_Amt - dto.getCredit_amt()) + dto.getDebit_amt();
									}
								%>
								<tr>
									<td><%=list.indexOf(dto) + 1%></td>
									<td><%=dto.getCredit_amt()%></td>
									<td><%=dto.getDebit_amt()%></td>
									<td style="color: #ff0202;">
										<%=format.format(Balance_Amt)%></td>
									<td><%=payment_mode%></td>
									<td><%=dto.getCash_amount()%></td>
									<td><%=dto.getOnline_amount()%></td>
									<td>
										<%
										if (dto.getType().equals("Opening Due")) {
										%>Opening Due<%
										} else {
										%><%=remark%> <%
										}
										%>
									</td>
									<td><%=online_date%></td>
									<td><%=online_way%></td>
									<td><%=in_date%></td>
									<td><%=dto.getType()%></td>
									<%-- <td>
										<% if(dto.getType().equals("Opening Due")){	%> N/A <%} %> <% if(dto.getType().equals("Due")){	%>
										<a class="main-color"
										href="print_dealer_other_due_receipt.jsp?id=<%=dto.getBill_id_fk()%>"><i
											class="bi bi-printer"></i></a> <%} %> <% if(dto.getType().equals("Purchase")){	%>
										N/A <%} %>
									</td> --%>


								</tr>
								<%
								total_credit = total_credit + dto.getCredit_amt();
								total_debit = total_debit + dto.getDebit_amt();
								total_cash = total_cash + dto.getCash_amount();
								total_online = total_online + dto.getOnline_amount();
								}
								%>
							</tbody>
							<tfoot id="tfoot">
								<tr>
									<td></td>
									<td><%=total_credit%></td>
									<td><%=total_debit%></td>
									<td><span>Balance</span>  <%=total_debit - total_credit%></td>
									<td></td>
									<td><%=total_cash%></td>
									<td><%=total_online%></td>
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