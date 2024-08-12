

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
		<%@include file="breadcrumbs/purchase.jsp"%>
		<!--  Breadcrumbs End-->
		<div class="pagetitle text-center">
			<h1 id=page_title>Manage Dealer Due</h1>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-12">

					<div class="card ">

						<div class="card-body table-responsive">

							<%
						 
						 String d1 = request.getParameter("D1") == null ? "" : request.getParameter("D1");
							String d2 = request.getParameter("D2") == null ? "" : request.getParameter("D2");
							
							
         				int id = Integer.parseInt(request.getParameter("id") == null ? "0"
								: request.getParameter("id"));
								DealerService ser1 = new DealerService();
								DealerDto dto1 = ser1.getDealerInfoById(id, config, request);
							
						%>
							<h5 class="text-center card-title"
								style="margin-bottom: -15px; margin-top: -5px">Dealer
								Details</h5>
							<div class="table-responsive">
								<table
									class="table info-table table-borderless mt-4 table-color">
									<tr>
										<th width="75px">Name</th>
										<th width="2px">:</th>
										<td width="600px"><%=dto1.getName()%></td>
										<th width="100px">Gstin</th>
										<th width="2px">:</th>
										<td width="250px"><%=dto1.getGst_no()%></td>
										<th width="150px">Mobile no</th>
										<th width="2px">:</th>
										<td width="145px"><%=dto1.getMobile_no()%></td>
									</tr>

									<tr>
										<th>Address</th>
										<th>:</th>
										<td><%=dto1.getAddress()%></td>
										<th>Due</th>
										<th>:</th>
										<td><%=dto1.getOld_due()%></td>
										<td style="border-right: none;"></td>
										<td style="border-left: none; border-right: none"></td>
										<td style="border-left: none;"></td>

									</tr>
								</table>
							</div>

							<h5 class="text-center card-title">Paid Amount Details</h5>
							<div class="card-body">

								<br>
								<table id="example1" class="table hover table-responsive"
									style="width: 1450px;">

									<thead id="thead">
										<tr>
											<th width="5%">S.No.</th>
											<th width="10%">Date</th>
											<th width="10%">Paid amount</th>
											<th width="5%">Mode</th>
											<th width="10%">Cash</th>
											<th width="10%">Online</th>
											<th width="16%">Remark</th>
											<th width="15%">Online Remark</th>
											<th width="8%">Online Way</th>
											<th width="10%">Online date</th>
											<th width="2%">Print</th>
											<% if(user_sidebar_dto.getUpdate_module().equals("Yes")){%>
											<th style="text-align: center;" width="2%">Edit</th>
											<%} %>
											<% if(user_sidebar_dto.getDelete_module().equals("Yes")){%>
											<th style="text-align: center;" width="2%">Del</th>
											<%} %>
										</tr>
									</thead>
									<tbody id="tbody">
										<%
								float total_pay=0, total_cash=0, total_online=0 ,total_due=0;
								
								DealerService ser = new DealerService();
								ArrayList<DealerDto> list1 = ser.getDealerDueInfoByDealerId(id, config, request);
								
								for (DealerDto dto : list1) {
									total_pay = total_pay + dto.getPay_amount();
									total_cash = total_cash + dto.getCash_amount();
									total_online = total_online + dto.getOnline_amount();
									total_due = total_due + dto.getOld_due();
								%>
										<tr style="font-size: 14px;">
											<td><%=list1.indexOf(dto) + 1%></td>
											<td ><%=dto.getPay_date() == null ? "-": LogFileService.changeFormate(dto.getPay_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
											<td class="main-color"><%=dto.getPay_amount() %></td>
											<td><%=dto.getPayment_mode() %></td>
											<td><%=dto.getCash_amount() %></td>
											<td><%=dto.getOnline_amount() %></td>
											<td><%=dto.getRemark() == null ? "-": dto.getRemark()%></td>
											<td><%=dto.getOnline_remark() == null ? "-": dto.getOnline_remark()%></td>
											<td><%=dto.getOnline_way() == null ? "-": dto.getOnline_way()%></td>
											<td><%=dto.getOnline_date() == null ? "-": LogFileService.changeFormate(dto.getOnline_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>


											<td><a class="main-color"
												href="print_dealer_due_receipt.jsp?id=<%=dto.getId()%>"><i
													class="bi bi-printer"></i></a></td>
											<% if(user_sidebar_dto.getUpdate_module().equals("Yes")){%>
											<td><a class="main-color"
												href="edit_dealer_due.jsp?id=<%=dto.getId()%>"><i
													class="bi bi-pencil-square"></i></a></td>
											<%
								}
								%>
											<% if(user_sidebar_dto.getDelete_module().equals("Yes")){%>
											<td><a class="main-color"
												onclick="return confirm('Are you sure? You want to delete')"
												href="AjaxService/AjaxDelete.jsp?dealer_due_id=<%=dto.getId()%>&return_id=<%=id %>">
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
										<tr style="font-size: 15px;">
											<td class="text-center">Total</td>
											<td id="name-td" class="text-center"><%=total_pay %></td>
											<td></td>
											<td class="text-center"><%=total_cash %></td>
											<td class="text-center"><%=total_online %></td>
											<td colspan="7"></td>
										</tr>
									</tfoot>

								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->
	<div id="result_delete"></div>



	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->
<!-- ======= Footer ======= -->
	<%@include file="include/datatable_script_footer.jsp"%>
	<!-- End Footer -->
</body>

</html>