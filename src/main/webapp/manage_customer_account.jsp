		
	
	<!-- head -->
	<%@include file="include/head.jsp"%>
	<!-- head end -->
	</head>


<body  >
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
			<h1 id=page_title>Customer Account</h1>
		</div>

		<section class="section">
			<div class="row justify-content-center">
			
			
			<div class="col-lg-12">
						
				<div class="card ">
					<div class="card-body table-responsive">
					
					
							<br>

					<%
					CustomerService service = new CustomerService();

							int cust_id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
							CustomerDto dto1 = service.getCustomerInfoById(cust_id, config, request);
							%>
					
					
					
                     <h5 class="text-center card-title" style="margin-bottom: -15px;margin-top: -15px">Customer
								Details</h5>
          	
                      	 <div class="table-responsive">
							<table class="table info-table table-borderless mt-4 table-color">
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
                    	<th >Address </th>
                    	<th>:</th>
                    	<td ><%=dto1.getAddress()%></td>
                        <th>Due</th>
                    	<th>:</th>
                    	<td><%=dto1.getOld_due()%></td>
                    	  <th>Op. Due</th>
                    	<th>:</th>
                    	<td><%=dto1.getOpening_due()%> <%if(dto1.getOpening_due()==0){%> / <a class="edit-icon" href="edit_customer_opening_due.jsp?id=<%=cust_id%>"><i class="bi bi-pencil-square"></i></a><%}%></td>
                    	
                    </tr>
                    </table>
                    </div>
                    <%
					NumberFormat format = new DecimalFormat("##.##");


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
					
					ArrayList<CustomerDto> old_list = null;

					String get_last_date = "";

					if (!"".equals(d1) && !"".equals(d2)) {
						get_last_date = LogFileService.previousDateString(d1);
					}
					CustomerDueService old_service = new CustomerDueService();
					old_list = old_service.getCustomerAccountInfo(cust_id,"2023-01-01", get_last_date,config, request);

					float tot_Credit = 0, tot_Debit = 0, Balance_Amt = 0;

					if (!"".equals(d1) && !"".equals(d2)) {
						for (CustomerDto acc_old_dto : old_list) {
							tot_Credit = tot_Credit + acc_old_dto.getCredit_amount();
							tot_Debit = tot_Debit + acc_old_dto.getDebit_amount();
						}
					}

					Balance_Amt = tot_Debit - tot_Credit;
					%>

						
						<div class="row " id="table_search">
							<form autocomplete="off" class="row g-3 d-flex justify-content-center">

								<div class="col-md-2 col-4">
									<div class="form-floating control">
										<input type="date" class="form-control " id="d1" name="D1"
											value="<%=d1 == null ? "" : d1%>"> <label
											for="floatingName">From Date</label>
									</div>
								</div>
								
								<input type="hidden" name="id" value="<%=cust_id%>">

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
									<label class="cow" style="color: #ff0202;">Prev. Bal: <%=format.format(Balance_Amt)%></label>
								</div>
								<div class="col-md-2 col-4">
									<div class="form-floating">
										<button type="submit" class="submit-btn">Submit</button>
									</div>
								</div>
							</form>
						</div>
						<br>

						<table id="example" class="table hover">
							<thead class="text-center" id="thead" style="min-width:100%;">
								<tr>
									<th style="text-align: center;" width="1%" >S.No.</th>
									<th style="text-align: center;" width="10%">Date</th>
									<th style="text-align: center;" width="5%">Debit</th>
									<th style="text-align: center;" width="5%">Credit</th>
									<th style="text-align: center;" width="6%">Balance</th>
									<th style="text-align: center;" width="12%">Type</th>
									<th style="text-align: center;" width="3%">Mode</th>
									<th style="text-align: center;" width="6%">Cash</th>
									<th style="text-align: center;" width="6%">Online</th>
									<th style="text-align: center;" width="15%">Remark</th>
									<th style="text-align: center;" width="15%">On. remark</th>
									<th style="text-align: center;" width="8%">On. way</th>
									<th style="text-align: center;" width="10%">On. date</th>
									
									<th style="text-align: center;" width="2%">Print</th>
								</tr>
							</thead>
									
							<tbody id="tbody" class="text-center">


								<%
								int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
								
								CustomerDueService acc_service = new CustomerDueService();
								ArrayList<CustomerDto> list = acc_service.getCustomerAccountInfo(id,d1,d2, config, request);
								float total_debit=0,total_credit=0,total_cash =0, total_online=0;;

								for (CustomerDto dto : list) {
									total_debit = total_debit + dto.getDebit_amount();
									total_credit = total_credit + dto.getCredit_amount();
									total_cash = total_cash + dto.getCash_amount();
									total_online = total_online + dto.getOnline_amount();
									
									if (Balance_Amt < 0) {
										Balance_Amt = (Balance_Amt - dto.getCredit_amount()) + dto.getDebit_amount();
									} else {
										Balance_Amt = (Balance_Amt - dto.getCredit_amount()) + dto.getDebit_amount();

									}
								%>
								

								<tr>
									<td><%=list.indexOf(dto) + 1%></td>
									<td><%=LogFileService.changeFormate(dto.getPay_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
									<td class="main-color"><%=dto.getDebit_amount()%></td>
									<td class="main-color"><%=dto.getCredit_amount()%></td>
									<td style="color: #ff0202;"><%= " "+format.format(Balance_Amt)%></td>
									<td><%=dto.getType()%></td>
									<td><%=dto.getPayment_mode()%></td>
									<td><%=dto.getCash_amount()%></td>
									<td><%=dto.getOnline_amount()%></td>
									
									<td><%=dto.getRemark() == null ? "-": dto.getRemark()%></td>
									<td><%=dto.getOnline_remark() == null ? "-": dto.getOnline_remark()%></td>
									<td><%=dto.getOnline_way() == null ? "-": dto.getOnline_way()%></td>
									<td><%=dto.getOnline_date() == null ? "-": LogFileService.changeFormate(dto.getOnline_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
									
									<% if(dto.getType().equals("Opening Due")){	%>	
									<td>N/A</td>
											<%} %>
											<% if(dto.getType().equals("Customer Due")){	%>	
									<td><a class="main-color"
										href="print_customer_due_receipt.jsp?id=<%=dto.getBill_id_fk()%>"><i
											class="bi bi-printer"></i></a></td>
											<%} %>
											<% if(dto.getType().equals("Sale Bill")){	%>	
									<td><a class="main-color"
										href="print_sell_bill.jsp?id=<%=dto.getBill_id_fk()%>"><i
											class="bi bi-printer"></i></a></td>
											<%} %>
								</tr>
								<%
								}
								%>
							</tbody>
							<tfoot id="tfoot">
							<tr>
							<td></td>
							<td>Total</td>
							<td><%=total_debit %></td>
							<td><%=total_credit %></td>
							<td><span> Balance</span> <%=Math.round(Balance_Amt) %></td>
							<td></td>
							<td></td>
							<td><%=total_cash %></td>
							<td><%=total_online %></td>
							<td colspan="4"></td>
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


	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->
<!-- ======= Footer ======= -->
	<%@include file="include/datatable_script_footer.jsp"%>
	<!-- End Footer -->


</body>

</html>