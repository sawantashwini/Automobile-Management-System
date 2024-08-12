	<!-- ======= Head ======= -->
	<%@include file="include/head.jsp"%>
	<!-- ======= Head end======= -->	
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
	<%@include file="breadcrumbs/purchasereturn.jsp"%>
	<!--  Breadcrumbs End-->
		
	<%
		String d1=request.getParameter("D1") == null ? "" : request.getParameter("D1");
		String d2=request.getParameter("D2") == null ? "" : request.getParameter("D2");
		String first_date= LogFileService.changeFormate(d1, "yyyy-MM-dd", "dd-MM-yyyy")== null ? "" :LogFileService.changeFormate(d1, "yyyy-MM-dd", "dd-MM-yyyy");
		String second_date= LogFileService.changeFormate(d2, "yyyy-MM-dd", "dd-MM-yyyy")== null ? "" :LogFileService.changeFormate(d2, "yyyy-MM-dd", "dd-MM-yyyy");
		String all = request.getParameter("All") == null ? "" : request.getParameter("All");
		int i = Integer.parseInt(request.getParameter("periods") == null ? "0" : request.getParameter("periods"));
		
		if (i != 0) {
			String temp = LogFileService.getEndDates("yyyy-MM-dd", i);
			String dates[] = temp.split(",");
			d1 = dates[0];
			d2 = dates[1];
			System.out.println(temp);
		}
	%>

		
	



		<div class="pagetitle text-center">
			<h1 id=page_title>Purchase Return Report</h1>
		</div>

		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">
					
							<div class="row " id="table_search">
							<form autocomplete="off" class="row g-3 d-flex justify-content-center">							
								<div class="col-md-2 col-4">
									<div class="form-floating control">
										<input type="date" class="form-control " id="d1" name="D1" value="<%=d1%>">
										<label for="floatingName">From Date</label>
									</div>
								</div>

								<div class="col-md-2 col-4">
									<div class="form-floating control">
										<input type="date" class="form-control " id="d2" name="D2" value="<%=d2%>">
										<label for="floatingPhone">To Date</label>
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
								<div class="col-md-1">
									<div class="form-check mt-2">
											<input class="form-check-input" type="checkbox" id="all"
												name="All" value="Yes" <%if(all.equalsIgnoreCase("Yes")){%>checked<%}%>> <label
												class="form-check-label" for="all" style="font-size: 13px;">
												All </label>
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
									<th style="width: 16%;">Date</th>
									<th style="width: 3%; text-align: center;">Invoice</th>
									<th style="width: 13%; text-align: center;">Name</th>
									<th style="width: 13%; text-align: center;">Mobile</th>
									<th style="width: 20%; text-align: center;">Address</th>

									<th style="width: 13%; text-align: center;">Amount</th>
									<th style="width: 14%; text-align: center;">Remark</th>

									<% if(user_sidebar_dto.getUpdate_module().equals("Yes")){%>	
									<th style="text-align: center;" width="2%">Edit</th>
									<%} %>
									
								<% if(user_sidebar_dto.getDelete_module().equals("Yes")){%>
									<th style="text-align: center;" width="2%">Delete</th>
									<%} %>
								</tr>
							</thead>
							<tbody id="tbody" class="text-center">


								<%
								

								PurchaseBillReturnService service = new PurchaseBillReturnService();
														ArrayList<PurchaseBillDto> list = service.getPurchaseBillReturnInfo( d1,d2,all, config, request);

														for (PurchaseBillDto dto : list) {
								%>

								<tr>
									<td><%=list.indexOf(dto) + 1%></td>
									<td><%=LogFileService.changeFormate(dto.getBill_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>

									<td id="name-td"><%=dto.getInvoice_no()%></td>
									<td><%=dto.getDealer_name()%></td>
									<td><%=dto.getDealer_mobile()%></td>
									<td><%=dto.getDealer_address()%></td>


									<td id="name-td"><%=dto.getTotal_amount_with_gst()%></td>
									<td>
										<%
										if (dto.getRemark() == null || dto.getRemark().equalsIgnoreCase("")) {
										%>N/A<%
										} else {
										%> <%=dto.getRemark()%> <%
 }
 %>
									</td>


<% if(user_sidebar_dto.getUpdate_module().equals("Yes")){%>
									<td><a class="main-color" 
										href="edit_purchase_bill_return.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
											<%
								}
								%>
											
									
											<% if(user_sidebar_dto.getDelete_module().equals("Yes")){%>
											<td><a onclick="return confirm('Are you sure? You want to delete')" href="AjaxService/AjaxDelete.jsp?purchase_return_id=<%=dto.getId()%>">
									<i class="bi bi-trash main-color"></i></a></td>
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
		<div id="result_delete"></div>
		

	

	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->

<!-- ======= Footer ======= -->
	<%@include file="include/datatable_script_footer.jsp"%>
	<!-- End Footer -->

</body>

</html>