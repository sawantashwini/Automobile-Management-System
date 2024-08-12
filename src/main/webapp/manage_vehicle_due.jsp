<%@page import="com.dto.PaymentDto"%>
<%@page import="com.dto.VehicleDueDto"%>
<%@page import="com.service.VehicleDueService"%>
<%@page import="com.dto.VehicleInfoDto"%>
<%@page import="com.service.VehicleInfoService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.CustomerDueService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="com.dto.CustomerDto"%>
<%@page import="com.service.CustomerService"%>


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
		


		<div class="pagetitle text-center">
			<h1 id=page_title>Vehicle Due Report</h1>
		</div>

		<section class="section">
			<div class="row justify-content-center">





				<div class="card ">
					<div class="card-body">


						<br>

						<%
							int id = Integer.parseInt(request.getParameter("id") == null ? "0"
									: request.getParameter("id"));
							VehicleInfoService service = new VehicleInfoService();

							VehicleInfoDto dto1 = service.getVehicleInfoById(id, config, request);
						%>

						
	<h5 class="text-center card-title" style="margin-bottom: -15px;">Vehicle Details</h5>

						

		  <div class="table-responsive">
							<table class="table info-table table-borderless mt-4 table-color">
                    <tr>
                    	<th width="75px">Company</th>
                    	<th width="2px">:</th>
                    	<td width="350px"><%=dto1.getBike_company_name()%></td>
                    	<th width="150px">Vehicle No.</th>
                    	<th width="2px">:</th>
                    	<td width="250px"><%=dto1.getVehicle_no()%></td>
                    	<th width="150px">Chassis No.</th>
                    	<th width="2px">:</th>
                    	<td width="250px"><%=dto1.getChassis_no()%></td>
                    </tr>
                    
                  
                     <tr>
                    	<th >Model </th>
                    	<th>:</th>
                    	<td ><%=dto1.getModel_name()%></td>
                        <th>Engine No.</th>
                    	<th>:</th>
                    	<td><%=dto1.getEngine_no()%></td>
                    	  <th>Color</th>
                    	<th>:</th>
                    	<td><%=dto1.getColor_name()%></td>
                    	
                    </tr>
                      <tr>
                    	<th >Amount </th>
                    	<th>:</th>
                    	<td ><%=dto1.getDue_sale_price()%></td>
                        <th>Paid Amt.</th>
                    	<th>:</th>
                    	<td><%=dto1.getDue_sale_price_paid()%></td>
                    	  <th>Due</th>
                    	<th>:</th>
                    	<td ><%=dto1.getDue_sale_price() - dto1.getDue_sale_price_paid()%>
										<%if(dto1.getDue_sale_price() - dto1.getDue_sale_price_paid()>0){%>
										/ <a id="edit-icon"
										href="pay_vehicle_due.jsp?id=<%=dto1.getId()%>"><i
											class="bi bi-pencil-square main-color"></i></a>
										<%}%></td>
                    	
                    </tr>
                    </table>
                    </div>
						<%
					NumberFormat format = new DecimalFormat("##.##");


                    String d1=request.getParameter("D1") == null ? "" : request.getParameter("D1");
              		String d2=request.getParameter("D2") == null ? "" : request.getParameter("D2");
              	
              		String first_date = LogFileService.changeFormate(d1, "yyyy-MM-dd", "dd-MM-yyyy") == null
              				? ""
              				: LogFileService.changeFormate(d1, "yyyy-MM-dd", "dd-MM-yyyy");
              		String second_date = LogFileService.changeFormate(d2, "yyyy-MM-dd", "dd-MM-yyyy") == null
              				? ""
              				: LogFileService.changeFormate(d2, "yyyy-MM-dd", "dd-MM-yyyy");
int i = Integer.parseInt(request.getParameter("periods") == null ? "0" : request.getParameter("periods"));
              		
              		if (i != 0) {
              			String temp = LogFileService.getEndDates("yyyy-MM-dd", i);
              			String dates[] = temp.split(",");
              			d1 = dates[0];
              			d2 = dates[1];
              			System.out.println(temp);
              		}
					%>


						<div class="row " id="table_search">
							<form autocomplete="off" class="row g-3 d-flex justify-content-center">

								<div class="col-md-2 ">
									<div class="form-floating control">
										<input type="date" class="form-control " id="d1" name="D1"
											value="<%=d1 == null ? "" : d1%>"> <label
											for="floatingName">From Date</label>
									</div>
								</div>

								<input type="hidden" name="id" value="<%=dto1.getId()%>">

								<div class="col-md-2 ">
									<div class="form-floating control">
										<input type="date" class="form-control " id="d2" name="D2"
											value="<%=d2 == null ? "" : d2%>"> <label
											for="floatingPhone">To Date</label>
									</div>
								</div>
<div class="col-md-2 ">
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

								<div class="col-md-2 ">
									<div class="form-floating">
										<button type="submit" class="submit-btn">Submit</button>
									</div>
								</div>
							</form>
						</div>
						<br>

						<table id="example" class="table hover nowrap">
							<thead class="text-center" id="thead">
								<tr>
									<th style="text-align: center;" width="4%">S.No.</th>
									<th style="text-align: center;" width="6%">Date</th>
									<th style="text-align: center;" width="8%">Pay Amt.</th>
									<th style="text-align: center;" width="6%">Mode</th>
									<th style="text-align: center;" width="8%">Cash</th>
									<th style="text-align: center;" width="8%">Online</th>
									<th style="text-align: center;" width="20%">Remark</th>
									<th style="text-align: center;" width="5%">Online date</th>
									<th style="text-align: center;" width="6%">Online way</th>
									<th style="text-align: center;" width="8%">Online remark</th>
									<th style="text-align: center;" width="6%">Bank</th>

									<th style="text-align: center;" width="5">Edit</th>
									<th style="text-align: center;" width="5">Print</th>
									<th style="text-align: center;" width="5">Del.</th>


								</tr>
							</thead>

							<tbody id="tbody" class="text-center">


								<%
								VehicleDueService acc_service = new VehicleDueService();
								ArrayList<VehicleDueDto> list = acc_service.getVehicleDueInfo(id,d1,d2, config, request);
								float total_pay=0,total_cash =0, total_online=0, total_paid =0;

								for (VehicleDueDto dto : list) {
									total_pay= total_pay + dto.getPay_amount();
									total_cash = total_cash + dto.getCash_amount();
									total_online = total_online + dto.getOnline_amount();
									total_paid = dto.getCash_amount() +	 dto.getOnline_amount();			 					
					
								%>


								<tr>
									<td><%=list.indexOf(dto) + 1%></td>
									<td><%=LogFileService.changeFormate(dto.getPay_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
									<td class="main-color"><%=dto.getPay_amount()%></td>
									<td><%=dto.getPayment_mode()%></td>
									<td><%=dto.getCash_amount()%></td>
									<td><%=dto.getOnline_amount()%></td>
									<td><%=dto.getRemark()== null || dto.getRemark()== ""  ? "-" : dto.getRemark()%></td>
									<td><%=dto.getOnline_date()== null || dto.getOnline_date()== ""  ? "-" : LogFileService.changeFormate(dto.getOnline_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
									<td><%=dto.getOnline_way()== null || dto.getOnline_way()== ""  ? "-" : dto.getOnline_way()%></td>
									<td><%=dto.getOnline_remark()== null || dto.getOnline_remark()== ""  ? "-" : dto.getOnline_remark()%></td>
									<td><%=dto.getBank_name() == null || dto.getBank_name()== ""  ? "-" : dto.getBank_name()%></td>


									<td><a id="main-color"
										href="edit_vehicle_due.jsp?id=<%=dto.getId()%>&vehicle_id=<%=dto.getVehicle_id_fk()%>"><i
											class="bi bi-pencil-square"></i></a></td>
									<td><a id="main-color"
										href="print_vehicle_due.jsp?id=<%=dto.getId()%>&vehicle_id=<%=dto.getVehicle_id_fk()%>"><i
											class="bi bi-printer"></i></a></td>
									<td><a onclick="return confirm('Are you sure? You want to delete')" href="AjaxService/AjaxDelete.jsp?vehicle_due_id=<%=dto.getId()%>&paid_amt=<%=total_paid%>&return_id=<%=id%>"><i
											class="bi bi-trash main-color"></i></a></td>

								</tr>
								<%
								}
								%>
							</tbody>
							<tfoot id="tfoot">
								<tr>
									<td></td>
									<td>Total</td>
									<td><%=total_pay %></td>
									<td></td>
									<td><%=total_cash %></td>
									<td><%=total_online %></td>
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
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->
<!-- ======= Footer ======= -->
	<%@include file="include/datatable_script_footer.jsp"%>
	<!-- End Footer -->


</body>

</html>