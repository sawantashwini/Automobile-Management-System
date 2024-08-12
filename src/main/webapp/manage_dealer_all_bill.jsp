<%@page import="com.service.DealerService"%>
<%@page import="com.dto.DealerDto"%>
<%@page import="com.service.PurchaseBillService"%>
<%@page import="com.dto.PurchaseBillDto"%>


<%@page import="java.util.ArrayList"%>
<%@page import="com.service.LogFileService"%>



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
			<h1 id=page_title>Manage Dealer All Bill</h1>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-12">


					<div class="card table-responsive">
						<div class="card-body">

							<%
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
							<table id="example" class="table hover text-center">


								<thead id="thead">
									<tr>
										<th style="width: 2%; text-align: center;">S.N0.</th>
										<th style="width: 10%;">Date</th>
										<th style="width: 3%; text-align: center;">Invoice</th>
										<th style="width: 20%; text-align: center;">Name</th>
										<th style="width: 10%; text-align: center;">Mobile</th>
										<th style="width: 20%; text-align: center;">Address</th>

										<th style="width: 13%; text-align: center;">Amount</th>
										<th style="width: 14%; text-align: center;">Remark</th>

										<% if(user_sidebar_dto.getUpdate_module().equals("Yes")){%>
										<th style="text-align: center;" width="2%">Edit</th>
										<%} %>
										<th style="text-align: center;" width="2%">Print</th>
										<% if(user_sidebar_dto.getDelete_module().equals("Yes")){%>
										<th style="text-align: center;" width="2%">Delete</th>
										<%} %>
									</tr>
								</thead>
								<tbody id="tbody" class="text-center">


									<%
								PurchaseBillService service = new PurchaseBillService();
														ArrayList<PurchaseBillDto> list = service.getPurchaseBillInfoByDealerId(id, config, request);

														for (PurchaseBillDto dto : list) {
								%>


									<tr>
										<td><%=list.indexOf(dto) + 1%></td>
										<td><%=LogFileService.changeFormate(dto.getBill_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>

										<td class="main-color"><%=dto.getInvoice_no()%></td>
										<td><%=dto.getDealer_name()%></td>
										<td><%=dto.getDealer_mobile()%></td>
										<td><%=dto.getDealer_address()%></td>


										<td class="main-color"><%=dto.getTotal_amount_with_gst()%></td>
										<td><%=dto.getRemark() == null ? "-": dto.getRemark()%></td>


										<% if(user_sidebar_dto.getUpdate_module().equals("Yes")){%>

										<td><a class="main-color"
											href="edit_purchase_bill.jsp?id=<%=dto.getId()%>"><i
												class="bi bi-pencil-square"></i></a></td>
										<%
								}
								%>

										<td><a class="main-color"
											href="print_purchase_bill.jsp?id=<%=dto.getId()%>&return_id=<%=id%>"><i
												class="bi bi-printer"></i></a></td>

										<% if(user_sidebar_dto.getDelete_module().equals("Yes")){%>
										<td><i class="bi bi-trash main-color"
											onclick="deleteEvent('<%=dto.getId()%>');"></i></td>
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