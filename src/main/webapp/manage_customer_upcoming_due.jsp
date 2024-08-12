

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


		<%-- <!-- ======= Breadcrumbs ======= -->
	<%@include file="breadcrumbs/inventory.jsp"%>
	<!--  Breadcrumbs End--> --%>

		<div class="pagetitle text-center">
			<h1 id=page_title>Customer Upcoming Due Report</h1>
		</div>

		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">
						<%
					NumberFormat format = new DecimalFormat("##.##");


                    String d1=request.getParameter("D1") == null ? "" : request.getParameter("D1");
              		
					%>
						<div class="row " id="table_search">
							<form autocomplete="off"
								class="row g-3 d-flex justify-content-center">

								<div class="col-md-2 col-4">
									<div class="form-floating control">
										<input type="date" class="form-control " id="d1" name="D1"
											value="<%=d1 == null ? "" : d1%>"> <label
											for="floatingName">Date</label>
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

						<table id="example1" class="table hover text-center">

							<thead class="text-center" id="thead">
								<tr>
									<th style="text-align: center" width="4%">S.NO.</th>
									<th style="text-align: center;" width="10%">Upcoming Date</th>
									<th style="text-align: center;" width="14%">Name</th>
									<th style="text-align: center;" width="10%">Mobile No.</th>
									<th style="text-align: center;" width="14%">Address</th>
									<th style="text-align: center;" width="10%">GST No.</th>

									<th style="text-align: center;" width="22%">Due</th>


									<th style="text-align: center;" width="10%">Upcoming
										remark</th>



								</tr>
							</thead>
							<tbody class="text-center" id="tbody">
								<%
								CustomerService ser = new CustomerService();
									ArrayList<CustomerDto>list1 = ser.getCustomerUcomingDueInfo(d1,config, request);
									for(CustomerDto dto : list1 ){
									
									%>
								<tr>

									<td><%=list1.indexOf(dto) + 1%></td>
									<td><%=LogFileService.changeFormate(dto.getUpcoming_date(), "yyyy-MM-dd", "dd-MM-yyyy")%>
									<td><%=dto.getName()%></td>
									<td><%=dto.getMobile_no()%></td>
									<td><%=dto.getAddress()%></td>
									<td><%=dto.getGst_no()%></td>
									<td><%=dto.getOld_due()%> <%if (dto.getOld_due() != 0) {%>
										/&nbsp;<a class="main-color"
										href="pay_customer_due.jsp?id=<%=dto.getId()%>"> <i
											class="bi bi-pencil-square"></i></a> /&nbsp;<%} %><a
										class="main-color"
										href="manage_customer_due.jsp?id=<%=dto.getId()%>"> <i
											class="bi bi-image"></i></a></td>



									<td><%=dto.getUpcoming_remark()%>
								</tr>
								<%} %>
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