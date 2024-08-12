
<!-- ======= Head ======= -->
<%@include file="include/head.jsp"%>
<!-- ======= Head end======= -->


</head>


<body>
	<div id="ser"></div>


	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->



	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->
	
	<main id="main" class="main">


		<!--  alert massages start-->


		

		<%
		String d1 = request.getParameter("D1") == null ? "" : request.getParameter("D1");
		String d2 = request.getParameter("D2") == null ? "" : request.getParameter("D2");
		String first_date = LogFileService.changeFormate(d1, "yyyy-MM-dd", "dd-MM-yyyy") == null
				? ""
				: LogFileService.changeFormate(d1, "yyyy-MM-dd", "dd-MM-yyyy");
		String second_date = LogFileService.changeFormate(d2, "yyyy-MM-dd", "dd-MM-yyyy") == null
				? ""
				: LogFileService.changeFormate(d2, "yyyy-MM-dd", "dd-MM-yyyy");
		String search_item = request.getParameter("Search_item") == null ? "" : request.getParameter("Search_item");
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


	<!-- ======= Breadcrumbs ======= -->
	<%@include file="breadcrumbs/purchase.jsp"%>
	<!--  Breadcrumbs End-->
			
		<div class="pagetitle text-center">
			<h1 id=page_title>Purchase Item Report</h1>
		</div>

		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">

						<div class="row " id="table_search">
							<form autocomplete="off" class="row g-3 d-flex justify-content-center">
								<div class="col-md-2 col-4">
									<div class="form-floating control">
										<input type="date" class="form-control " id="d1" name="D1"
											value="<%=d1%>"> <label for="floatingName">From
											Date</label>
									</div>
								</div>

								<div class="col-md-2 col-4">
									<div class="form-floating control">
										<input type="date" class="form-control " id="d2" name="D2"
											value="<%=d2%>"> <label for="floatingPhone">To
											Date</label>
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

								<div class="col-lg-2 col-md-3 col-6">
									<div class="form-floating control">
										<input type="text" class="form-control" list="browsers"
											value="<%=search_item == "" || search_item == null ? "" : search_item%>"
											placeholder="Search item by name" id="name_search"
											name="Search_item" style="padding: 7px; text-align: left;"
											autocomplete="off" /><label for="floatingPhone">Search Item by Name</label>
										<div id="rev"></div>
										<datalist id="browsers">
											<%
											ItemService ser = new ItemService();
											ArrayList<ItemDto> i_list = ser.getItemName(config, request);
											for (ItemDto i_dto : i_list) {
											%>
											<option value="<%=i_dto.getName()%>" />
											<%
											}
											%>
										</datalist>
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
									<th style="width: 2%; text-align: center;">S.No.</th>
									<th style="width: 10%; text-align: center;">Date</th>
									<th style="width: 3%; text-align: center;">Code</th>
									<th style="width: 15%; text-align: center;">Name</th>
									<th style="width: 13%; text-align: center;">Category</th>
									
									<th style="width: 6%; text-align: center;">GST %</th>
									<th style="width: 10%; text-align: center;">Quantity</th>
									<th style="width: 10%; text-align: center;">Pur. Price</th>
									<th style="width: 14%; text-align: center;">HSN code</th>
									<th style="width: 13%; text-align: center;">Dealer</th>						
									
									
									
									<th style="width: 3%; text-align: center;">Print</th>
								</tr>
							</thead>
							<tbody id="tbody" style="font-size:10px;" class="text-center" >


								<%
								PurchaseBillService service = new PurchaseBillService();
								ArrayList<PurchaseBillItemDto> list = service.getPurchaseBillItemInfo(d1, d2,all, search_item, config, request);
								float total_final_amt = 0,total_qty = 0;
								for (PurchaseBillItemDto dto : list) {
								%>

								<tr>
									<td><%=list.indexOf(dto) + 1%></td>
									<td><%=LogFileService.changeFormate(dto.getBill_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>

									<td class="main-color"><%=dto.getItem_code()%></td>
									<td><%=dto.getItem_name()%></td>
									
									
									<td><%=dto.getCat_name()%></td>
									
									<td ><%=dto.getGst_per()%></td>
									<td class="main-color"><%=dto.getItem_qty() + " " + dto.getMeasure_name()%></td>
										<td ><%=dto.getPur_discount_price()%></td>
									<td ><%=dto.getItem_hsn_code()%></td>
								
									<td><%=dto.getDealer_name()%></td>
									
									
									<td><a class="main-color"
										href="print_purchase_bill.jsp?id=<%=dto.getPur_bill_id_fk()%>"><i
											class="bi bi-printer"></i></a></td>

								</tr>
								<%
								total_final_amt =total_final_amt+( dto.getItem_qty()*dto.getPur_discount_price());
								total_qty= total_qty+dto.getItem_qty();
								}
								%>
							</tbody>
							 <tfoot id="tfoot">
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td>Total</td>
									<td><%=total_qty%></td>
									<td><%=total_final_amt%></td>
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


	<!-- print script with date-->
	<script>
function printfunction(){
	var page_title=document.getElementById('page_title').innerHTML;
	
	
	
	
	return '<h1 style="text-align:center;margin-bottom:10px;">'+page_title+'</h1><br><h5 style="text-align:center;">From Date:<%=first_date%> To Date:<%=second_date%></h5><br><h5 style="text-align:center;">Item Name:<%=search_item%></h5>';
	
}

function printOtherfunction(){
	
	
	return 'From Date:<%=first_date%> To Date:<%=second_date%>/Item Nmae:<%=search_item%>';

		}
		function printTitle() {
			//alert("print");
			var page_title = document.getElementById('page_title').innerHTML;

			return page_title;

		}
	</script>
	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->

<!-- ======= Footer ======= -->
	<%@include file="include/datatable_script_footer.jsp"%>
	<!-- End Footer -->

</body>

</html>