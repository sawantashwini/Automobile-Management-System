<%@page import="com.dto.CustomerDto"%>
<%@page import="com.service.CustomerService"%>
<%@page import="com.dto.SaleBillDto"%>
<%@page import="com.service.SaleBillService"%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.service.LogFileService"%>



<!-- head -->
<%@include file="include/head.jsp"%>
<!-- head end -->
</head>


<body>
	<div id="ser"></div>
	<%
		
	String d1=request.getParameter("D1") == null ? "" : request.getParameter("D1");
	String d2=request.getParameter("D2") == null ? "" : request.getParameter("D2");
	String first_date= LogFileService.changeFormate(d1, "yyyy-MM-dd", "dd-MM-yyyy")== null ? "" :LogFileService.changeFormate(d1, "yyyy-MM-dd", "dd-MM-yyyy");
	String second_date= LogFileService.changeFormate(d2, "yyyy-MM-dd", "dd-MM-yyyy")== null ? "" :LogFileService.changeFormate(d2, "yyyy-MM-dd", "dd-MM-yyyy");
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
		<%@include file="breadcrumbs/sell.jsp"%>
		<!--  Breadcrumbs End-->

		<div class="pagetitle text-center">
			<h1 id=page_title>Customer Bill Report</h1>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-12">
					<div class="card ">
						<div class="card-body table-responsive">

							<%
							int cust_id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
							CustomerService service = new CustomerService();
							CustomerDto dto1 = service.getCustomerInfoById(cust_id, config, request);
							%>

							<h5 class="text-center card-title"
								style="margin-bottom: -15px; margin-top: -5px">Customer
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


							<div class="row" style="margin-top: -30px;" id="table_search">
								<form autocomplete="off"
									class="row g-3 d-flex justify-content-center">
									<div class="col-md-2 col-4">
										<div class="form-floating control">
											<input type="hidden" name="id" value="<%=cust_id%>">
											<input type="date" class="form-control " id="d1" name="D1"
												value="<%=d2 == null ? "" : d2%>"> <label
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
							<br>

							<table id="example" class="table hover" style="min-width: 100%;">


								<thead id="thead">
									<tr>
										<th style="width: 2%; text-align: center;">S.N0.</th>
										<th style="width: 10%; text-align: center;">Bill Date</th>
										<th style="width: 3%; text-align: center;">Invoice</th>

										<th style="width: 10%; text-align: center;">Final Amt.</th>

										<th style="width: 5%; text-align: center;">Mode</th>
										<th style="width: 10%; text-align: center;">Cash</th>
										<th style="width: 10%; text-align: center;">Online</th>
										<th style="width: 10%; text-align: center;">Paid Amt.</th>


										<th style="width: 10%; text-align: center;">On. Way</th>
										<th style="width: 15%; text-align: center;">On. Remark</th>

										<th style="width: 10%; text-align: center;">On. Date</th>

										<!-- <th style="width: 20px; text-align: center;">Bank Name</th> -->
										<th style="width: 15%; text-align: center;">Remark</th>
										<% if(user_sidebar_dto.getUpdate_module().equals("Yes")){%>
										<th style="width: 2%; text-align: center;">Edit</th>
										<%} %>
										<th style="width: 2%; text-align: center;">Print</th>
										<% if(user_sidebar_dto.getUpdate_module().equals("Yes")){%>
										<th style="width: 2%; text-align: center;">Delete</th>
										<%} %>

									</tr>
								</thead>
								<tbody id="tbody" class="text-center">


									<%
							

														SaleBillService service_bill = new SaleBillService();
														ArrayList<SaleBillDto> list = service_bill.getSaleBillInfoByCust(cust_id,d1,d2,config, request);

														float total_cash=0,total_online=0,total_final_amt=0;
														for (SaleBillDto dto : list) {
								%>


									<tr>
										<td><%=list.indexOf(dto) + 1%></td>
										<td><%=LogFileService.changeFormate(dto.getBill_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>

										<td id="name-td"><%=dto.getInvoice_no()%></td>

										<td id="name-td"><b><%=dto.getFinal_amount()%></b></td>



										<td><%=dto.getPayment_mode()%></td>
										<td><%=dto.getCash_amount()%></td>
										<td><%=dto.getOnline_amount()%></td>

										<td class="main-color"><b><%=dto.getPaid_amount()%></b></td>

										<td><%=dto.getOnline_way() == null ? "-": dto.getOnline_way()%></td>
										<td><%=dto.getOnline_remark() == null ? "-": dto.getOnline_remark()%></td>
										<td><%=dto.getOnline_date() == null ? "-": LogFileService.changeFormate(dto.getOnline_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
										<td><%=dto.getRemark() == null ? "-": dto.getRemark()%></td>


										<% if(user_sidebar_dto.getUpdate_module().equals("Yes")){%>
										<td><a class="main-color"
											href="edit_sell_bill.jsp?id=<%=dto.getId()%>"><i
												class="bi bi-pencil-square"></i></a></td>
										<%}%>
										<td><a class="main-color"
											href="print_sell_bill.jsp?id=<%=dto.getId()%>"><i
												class="bi bi-printer"></i></a></td>

										<% if(user_sidebar_dto.getDelete_module().equals("Yes")){%>
										<td><a class="main-color"
											onclick="return confirm('Are you sure? You want to delete')"
											href="AjaxService/AjaxDelete.jsp?sell_id=<%=dto.getId()%>&return_id=<%=cust_id%>">
												<i class="bi bi-trash"></i>
										</a></td>
										<%}%>
									</tr>

									<%
								
								total_final_amt=total_final_amt+dto.getFinal_amount();
								
								total_cash=total_cash+dto.getCash_amount();
								total_online=total_online+dto.getOnline_amount();
								
								}
								%>



								</tbody>

								<tfoot id="tfoot">
									<tr>

										<td></td>
										<td></td>
										<td>Total</td>

										<td><%=total_final_amt %></td>

										<td></td>
										<td><%=total_cash %></td>
										<td><%=total_online %></td>
										<td><%=total_cash+total_online %></td>
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