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
	
	
	<!-- ======= Breadcrumbs ======= -->
	<%@include file="breadcrumbs/item.jsp"%>
	<!--  Breadcrumbs End-->
			

		<div class="pagetitle text-center">
			<h1 id=page_title>Low Stock</h1>
		</div>
			<div id="result_item_info"></div>

		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">

						<br>

						<table id="example1" class="table hover table-responsive">
							<thead class="text-center"  id="thead" >
								<tr>
									<th style="text-align:center"width="3%">S.No.</th>
									<th style="text-align:center"width="14%">Name</th>
									<th style="text-align:center"width="7%">Code</th>
									<th style="text-align:center"width="5%">HSN Code</th>
									<th style="text-align:center"width="10%">Category</th>
									<th style="text-align:center"width="10%">Pur price</th>
									
									<th style="text-align:center"width="5%">Gst(%)</th>
								
									<th style="text-align:center"width="5%">Low stock</th>
									<th style="text-align:center"width="10%">Quantity</th>
									
									
									
								</tr>
							</thead>
							<tbody  class="text-center"  id="tbody">
								<%
								ItemService ser = new ItemService();
								ArrayList<ItemDto> list1 = ser.getRequiredItemInfo(config, request);
								for (ItemDto dto : list1) {
								%>
								<tr>
									<td><%=list1.indexOf(dto) + 1%></td>
									<td class="main-color" ><%=dto.getName()%></td>
									<td><%=dto.getItem_code()%></td>
									<td><%=dto.getHsn_code()%></td>
										<td><%=dto.getCategory_name()%></td>
									<td><%=dto.getPur_price()%></td>
								
									<td><%=dto.getGst_per()%></td>
									
									<td><%=dto.getMin_qty()%></td>
									<td class="main-color"><%=dto.getQuantity()%> <%=dto.getMeasure_name()%></td>
								
									
							
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