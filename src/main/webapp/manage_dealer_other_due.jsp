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
				Dealer Due</h1>
		</div>

		<section class="section">
			<div class="row">

				<div class="card table-responsive">
					<div class="card-body">

						<!-- <br /> -->

						<%
						int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
						DealerOtherService ser = new DealerOtherService();
						PurchaseOtherDto dto1 = ser.getDealerOtherInfoById(id, config, request);
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
									<td colspan="3" ><%=dto1.getOld_due()%></td>

								</tr>
							</table>
						</div>
						<br>

						<table id="example1" class="table hover table-responsive nowrap"
							style="min-width: 1400px;">
							<thead class="text-center" id="thead">
								<tr>
									<th width="3%">S.No.</th>
									<th width="5%">Paid</th>
									<th width="10%">Mode</th>
									<th width="10%">Cash</th>
									<th width="10%">Online</th>
									<th width="11%">Pay date</th>
									<th width="15%">Online way</th>
									<th width="15%">Online Date</th>
									<th width="17%">Remark</th>
									<th width="3%">Edit</th>
									<!-- <th width="3%">View</th> -->
									<th width="3%">Delete</th>
								</tr>
							</thead>
							<tbody class="text-center" id="tbody">
								<%
								DealerOtherService ser1 = new DealerOtherService();
								ArrayList<PurchaseOtherDto> list = ser1.getDealerDueInfo(id, config, request);
								float total_cash = 0, total_online = 0;
								for (PurchaseOtherDto dto : list) {

									String online_date = (dto.getOnline_date() == null || dto.getOnline_date().equals(""))
									? "N/A"
									: LogFileService.changeFormate(dto.getOnline_date(), "yyyy-MM-dd", "dd-MM-yyyy");
									String online_way = (dto.getOnline_way() == null || dto.getOnline_way().equals("")) ? "N/A" : dto.getOnline_way();
									String pay_date = (dto.getPay_date() == null || dto.getPay_date().equals(""))
									? "N/A"
									: LogFileService.changeFormate(dto.getPay_date(), "yyyy-MM-dd", "dd-MM-yyyy");
								%>
								<tr>
									<td><%=list.indexOf(dto) + 1%></td>
									<td><%=dto.getPay_amount()%></td>
									<td><%=dto.getPayment_mode()%></td>
									<td><%=dto.getCash_amount()%></td>
									<td><%=dto.getOnline_amount()%></td>
									<td><%=pay_date%></td>

									<td><%=online_way%></td>
									<td><%=online_date%></td>

									<td><%=dto.getRemark()%></td>
									<td><a class="main-color"
										href="edit_dealer_other_due.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
									<%-- <td><a class="main-color"
										href="print_dealer_other_due_receipt.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-printer"></i></a></td> --%>
									<td><a class="main-color"
										onclick="return confirm('Are you sure? You want to delete')"
										href="DeleteOtherPurchase.jsp?id=<%=dto.getId()%>&flag=Due&main_id=<%=dto.getDealer_id_fk()%>">
											<i class="bi bi-trash"></i>
									</a></td>
								</tr>
								<%
								total_cash = total_cash + dto.getCash_amount();
								total_online = total_online + dto.getOnline_amount();
								}
								%>
							</tbody>

							<tfoot id="tfoot">
								<tr>
									<td></td>
									<td></td>
									<td>Total</td>
									<td><%=total_cash%></td>
									<td><%=total_online%></td>
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

	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->
<!-- ======= Footer ======= -->
	<%@include file="include/datatable_script_footer.jsp"%>
	<!-- End Footer -->
</body>

</html>