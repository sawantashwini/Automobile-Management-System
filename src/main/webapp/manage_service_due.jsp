

<!-- head -->
<%@include file="include/head.jsp"%>
<!-- head end -->
</head>


<body >


	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->


	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->

	<main id="main" class="main">

		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1 id=page_title>Manage Service Due</h1>
			</div>
		</div>



		<section class="section profile">
			<div class="row justify-content-center">


				<div class="card">
					<div class="card-body">
						<%
						int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
						ServiceBillService service = new ServiceBillService();
						ServiceBillDto dto1 = service.getServiceBillInfoById(id, config, request);
							%>



						<div class="table-responsive">
							<table class="table info-table table-borderless mt-4 table-color">
								<tr>
									<th width="90px">Name :</th>
									<td width="400px"><%=dto1.getCustomer_name()%></td>
									<th width="150px">Mobile. :</th>
									<td width="250px"><%=dto1.getCustomer_mobile_no()%></td>
									<th width="150px">Address. :</th>
									<td width="145px"><%=dto1.getCustomer_address()%></td>
								</tr>

								<tr>
									<th>Model :</th>
									<td><%=dto1.getModel_name()%></td>
									<th>Engine No. :</th>
									<td><%=dto1.getEngine_no()%></td>
									<th>Chassis No. :</th>
									<td><%=dto1.getChassis_no()%></td>

								</tr>
							</table>
						</div>
						<br>

						<h5 class="text-center card-title">Paid Amount Details</h5>

						<table id="example1" class="table hover table-responsive nowrap"
							style="min-width: 1450px;">


							<thead id="thead">
								<tr>
									<th width="7%">S.No.</th>
									<th width="10%">Paid amount</th>
									<th width="5%">Pay Mode</th>
									<th width="6%">Cash</th>
									<th width="6%">Online</th>
									<th width="10%">Pay date</th>
									<th width="10%">Online remark</th>
									<th width="10%">Online date</th>
									<th width="15%">Remark</th>
									<th width="15%">Paid status</th>
									<th width="15%">Print</th>

									<% if(user_sidebar_dto.getUpdate_module().equals("Yes")){%>
									<th style="text-align: center;" width="7%">Edit</th>
									<%} %>
									<% if(user_sidebar_dto.getDelete_module().equals("Yes")){%>
									<th style="text-align: center;" width="7%">Delete</th>
									<%} %>
								</tr>
							</thead>
							<tbody id="tbody">


								<%
								
								ServiceDueService service1 = new ServiceDueService();
								ArrayList<ServiceBillDto> list1 = service1.getServiceDueInfoById(id, config, request);
								float total_pay=0, total_cash=0, total_online=0 ;

								for (ServiceBillDto dto : list1) {
									total_pay = total_pay + dto.getPaid_amount();
									total_cash = total_cash + dto.getCash_amount();
									total_online = total_online + dto.getOnline_amount();
									
								%>


								<tr>
									<td><%=list1.indexOf(dto) + 1%></td>

									<td class="main-color"><%=dto.getPaid_amount()%></td>
									<td><%=dto.getPayment_mode() %></td>
									<td><%=dto.getCash_amount()%></td>
									<td><%=dto.getOnline_amount()%></td>

									<td><%=dto.getPay_date() == null ? "-": LogFileService.changeFormate(dto.getPay_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
									<td><%=dto.getOnline_remark() == null ? "-": dto.getOnline_remark()%></td>
									<td><%=dto.getOnline_date() == null ? "-": LogFileService.changeFormate(dto.getOnline_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
									<td><%=dto.getRemark() == null ? "-": dto.getRemark()%></td>
									<td><%=dto.getPaid_status() %></td>
									<td><a class="main-color"
										href="print_service_due_receipt.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-printer"></i></a></td>
									<% if(user_sidebar_dto.getUpdate_module().equals("Yes")){%>
									<td><a class="main-color"
										href="edit_pay_service_due.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
									<%}%>
									<% if(user_sidebar_dto.getDelete_module().equals("Yes")){%>
									<td><a class="main-color"
										onclick="return confirm('Are you sure? You want to delete')"
										href="AjaxService/AjaxDelete.jsp?service_due_id=<%=dto.getId()%>&return_id=<%=id %>">
											<i class="bi bi-trash"></i>
									</a></td>
									<%
								}
								%>
								</tr>

								<%
								}
								%>



							</tbody>
							<tfoot id="tfoot">
								<tr>
									<td class="text-center">Total</td>
									<td id="name-td" class="text-center"><%=total_pay %></td>
									<td></td>
									<td class="text-center"><%=total_cash %></td>
									<td class="text-center"><%=total_online %></td>
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
	<!-- End main -->


<!-- ======= Footer ======= -->
<%@include file="include/footer.jsp"%>
<!-- End Footer -->
<!-- ======= Footer ======= -->
	<%@include file="include/datatable_script_footer.jsp"%>
	<!-- End Footer -->

</body>

</html>