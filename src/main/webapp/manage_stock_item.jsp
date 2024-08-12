
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


	<%
	String search_item = request.getParameter("Search_item") == null ? "" : request.getParameter("Search_item");
	String all = request.getParameter("All") == null ? "" : request.getParameter("All");
	%>

	<main id="main" class="main">



		<!-- ======= Breadcrumbs ======= -->
		<%@include file="breadcrumbs/item.jsp"%>
		<!--  Breadcrumbs End-->

		<div class="pagetitle text-center">
			<h1 id=page_title>Stock Report</h1>
		</div>

		<div id="result_item_info"></div>
		<%@include file="include/add_pages.jsp"%>
		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">
						<div class="row " id="table_search">
							<form autocomplete="off"
								class="row g-3 d-flex justify-content-center">

								<div class="col-lg-2 col-md-3 col-6">
									<div class="form-floating control">
										<input type="text" class="form-control" list="browsers"
											value="<%=search_item == "" || search_item == null ? "" : search_item%>"
											placeholder="Search item by name" id="name"
											name="Search_item" style="padding: 7px; text-align: left;"
											autocomplete="off" /><label for="floatingPhone">Search
											Item by Name</label>
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
											name="All" value="Yes" <%if (all.equalsIgnoreCase("Yes")) {%>
											checked <%}%>> <label class="form-check-label"
											for="all" style="font-size: 13px;"> All </label>
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

						<table id="example1" class="table hover table-responsive"
							style="width: 100%;">
							<thead class="text-center" id="thead">
								<tr>
									<th style="text-align: center" width="3%">S.No.</th>
									<th style="text-align: center" width="10%">Name</th>
									<th style="text-align: center" width="7%">Code</th>
									<th style="text-align: center" width="8%">HSN</th>
									<th style="text-align: center" width="10%">Category</th>
									<th style="text-align: center" width="8%">Pur-price</th>
									<th style="text-align: center" width="8%">Sale-price</th>
									<th style="text-align: center" width="5%">Gst(%)</th>
									<th style="text-align: center" width="8%">Op. Qty</th>
									<th style="text-align: center" width="10%">low stock</th>
									<th style="text-align: center" width="8%">Quantity</th>


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
								ItemService ser1 = new ItemService();
								ArrayList<ItemDto> list1 = ser1.getItemInfos(search_item, all, config, request);
								for (ItemDto dto : list1) {
								%>
								<tr>
									<td><%=list1.indexOf(dto) + 1%></td>
									<td class="main-color"><b><%=dto.getName()%></b></td>
									<td><b><%=dto.getItem_code()%></b></td>
									<td><%=dto.getHsn_code()%></td>
									<td><%=dto.getCategory_name()%></td>
									<td><%=dto.getPur_price()%></td>
									<td><%=dto.getSale_price()%></td>
									<td><%=dto.getGst_per()%></td>
									<td><%=dto.getOpening_qty()%></td>
									<td><%=dto.getMin_qty()%></td>
									<td class="main-color"><b><%=dto.getQuantity()%> <%=dto.getMeasure_name()%></b></td>


									<%
									if (user_sidebar_dto.getUpdate_module().equals("Yes")) {
									%>
									<td><a class="main-color"
										href="edit_item.jsp?id=<%=dto.getId()%>"><i
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