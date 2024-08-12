

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
			<h1 id="page_title" style="text-align: center;">Other Dealer
				Bills</h1>
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
									<th width="90px">Name :</th>
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
						String d1 = request.getParameter("D1") == null ? "" : request.getParameter("D1");
						String d2 = request.getParameter("D2") == null ? "" : request.getParameter("D2");
						String first_date = LogFileService.changeFormate(d1, "yyyy-MM-dd", "dd-MM-yyyy");
						String second_date = LogFileService.changeFormate(d2, "yyyy-MM-dd", "dd-MM-yyyy");
						int i = Integer.parseInt(request.getParameter("periods") == null ? "0" : request.getParameter("periods"));

						if (i != 0) {
							String temp = LogFileService.getEndDates("yyyy-MM-dd", i);
							String dates[] = temp.split(",");
							d1 = dates[0];
							d2 = dates[1];
							System.out.println(temp);
						}
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
						</div>
						<br>

						<table id="example-small"
							class="table hover table-responsive nowrap">
							<thead class="text-center" id="thead">
								<tr>
									<th width="5%">S.No.</th>
									<th width="5%">Date</th>
									<th width="45%">Remark</th>
									<th width="20%">Amount</th>
									<th width="15%">Edit</th>
									<th width="15%">Delete</th>
								</tr>
							</thead>
							<tbody class="text-center" id="tbody">
								<%
								PurchaeOtherService ser = new PurchaeOtherService();
								ArrayList<PurchaseOtherDto> list = ser.getPurchaeOtherInfoId(id, d1, d2, config, request);
								for (PurchaseOtherDto dto : list) {
								%>
								<tr>
									<td><%=list.indexOf(dto) + 1%></td>
									<td><%=LogFileService.changeFormate(dto.getBill_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
									<td><%=dto.getRemark()%></td>
									<td><%=dto.getTotal_amount()%></td>
									<td><a id="icon"
										href="edit_purchae_other_bill.jsp?id=<%=dto.getId()%>&flag=All"><i
											class="bi bi-pencil-square"></i></a></td>
									<td><a class="main-color"
										onclick="return confirm('Are you sure? You want to delete')"
										href="DeleteOtherPurchase.jsp?id=<%=dto.getId()%>&flag=All&main_id=<%=id%>">
											<i class="bi bi-trash"></i>
									</a></td>
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
	<div id="result_delete"></div>
	<!-- End #main -->



	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->
<!-- ======= Footer ======= -->
	<%@include file="include/datatable_script_footer.jsp"%>
	<!-- End Footer -->
</body>

</html>