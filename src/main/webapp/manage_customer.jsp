

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
		<div id="result_delete"></div>


		<!-- ======= Breadcrumbs ======= -->
		<%@include file="breadcrumbs/sell.jsp"%>
		<!--  Breadcrumbs End-->

		<div class="pagetitle text-center">
			<h1 id=page_title>Customer Report</h1>
		</div>
		<%@include file="include/add_pages.jsp"%>
		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">

						<br>

						<table id="example1" class="table hover text-center">

							<thead class="text-center" id="thead" style="min-width:100%;">
								<tr>
									<th style="text-align: center" width="2%">S.NO.</th>
									<th style="text-align: center;" width="16%">Name</th>
									<th style="text-align: center;" width="10%">Mobile No.</th>
									<th style="text-align: center;" width="14%">Address</th>
									<th style="text-align: center;" width="8%">GST No.</th>

									<th style="text-align: center;" width="15%">Due</th>
									<th style="text-align: center;" width="4%">Bill</th>
									<th style="text-align: center;" width="4%">Acc.</th>

									<th style="text-align: center;" width="8%">Op. Due</th>
									<th style="text-align: center;" width="10%">Up. Date</th>
									<th style="text-align: center;" width="25%">Up. Remark</th>

									<%
									if (user_sidebar_dto.getUpdate_module().equals("Yes")) {
									%>
									<th style="text-align: center;" width="2%">Edit</th>
									<%
									}
									%>


								</tr>
							</thead>
							<tbody class="text-center" id="tbody">
								<%
								CustomerService ser = new CustomerService();
								ArrayList<CustomerDto> list1 = ser.getCustomerInfo(config, request);
								for (CustomerDto dto : list1) {
								%>
								<tr>
									<td><%=list1.indexOf(dto) + 1%></td>
									<td><%=dto.getName()%></td>
									<td><%=dto.getMobile_no()%></td>
									<td><%=dto.getAddress()%></td>
									<td><%=dto.getGst_no()%></td>
									<td><%=dto.getOld_due()%> <%
 if (dto.getOld_due() != 0) {
 %> /&nbsp;<a class="main-color"
										href="pay_customer_due.jsp?id=<%=dto.getId()%>"> <i
											class="bi bi-pencil-square"></i></a> /&nbsp;<%
 }
 %><a class="main-color"
										href="manage_customer_due.jsp?id=<%=dto.getId()%>"> <i
											class="bi bi-image"></i></a></td>


									<td><a class="main-color"
										href="manage_customer_sell_bill.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-image"></i></a></td>
									<td><a class="main-color"
										href="manage_customer_account.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-image"></i></a></td>

									<td><%=dto.getOpening_due()%> <%
 if (dto.getOpening_due() == 0) {
 %> / <a class="main-color"
										href="edit_customer_opening_due.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a> <%
										}
										%></td>

									<td><%=LogFileService.changeFormate(dto.getUpcoming_date(), "yyyy-MM-dd", "dd-MM-yyyy")%>
									<td><%=dto.getUpcoming_remark()%> <%
 if (user_sidebar_dto.getUpdate_module().equals("Yes")) {
 %>
									<td><a class="main-color"
										href="edit_customer.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
									<%
									}
									%>

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