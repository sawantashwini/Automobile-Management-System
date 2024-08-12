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
			<h1 id="page_title" style="text-align: center;">Manage Purchase
				Other</h1>
		</div>
		<%@include file="include/add_pages.jsp"%>
		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">
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
						</div>

						<br>

						<table id="example-small"
							class="table hover table-responsive nowrap" style="width: 100%;">
							<thead class="text-center" id="thead">
								<tr>
									<th width="2%">S.No.</th>
									<th width="5%">Download</th>
									<th width="5%">Name</th>
									<th width="5%">Remark</th>
									<th width="5%">Amount</th>
									<th width="2%">Edit</th>
									<th width="2%">Delete</th>
								</tr>
							</thead>
							<tbody class="text-center" id="tbody">
								<%
								PurchaeOtherService ser = new PurchaeOtherService();
								ArrayList<PurchaseOtherDto> list = ser.getPurchaeOtherInfo(d1, d2, config, request);
								for (PurchaseOtherDto dto : list) {
								%>
								<tr>
									<td><%=list.indexOf(dto) + 1%></td>
									<td><a style="font-size: 16px;" class="main-color"
										title="download"
										href="PurchaseOtherImage/<%=dto.getId()%>.jpg" download><i
											class="fa-solid fa-download"></i> </a></td>
									<td id="name-td"><%=dto.getName()%></td>
									<td><%=dto.getRemark()%></td>
									<td><%=dto.getTotal_amount()%></td>
									<td><a class="main-color"
										href="edit_purchae_other_bill.jsp?id=<%=dto.getId()%>&flag=Bill"><i
											class="bi bi-pencil-square"></i></a></td>
									<td><a class="main-color"
										onclick="return confirm('Are you sure? You want to delete')"
										href="DeleteOtherPurchase.jsp?id=<%=dto.getId()%>&flag=Bill">
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


	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
<!-- ======= Footer ======= -->
	<%@include file="include/datatable_script_footer.jsp"%>
	<!-- End Footer -->
</body>

</html>