
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
		<%@include file="breadcrumbs/item.jsp"%>


		<!--  Breadcrumbs End--> 
		<div class="pagetitle text-center">
			<h1 id=page_title>Category Report</h1>
		</div>
		<%@include file="include/add_pages.jsp"%>



		<section class="section">

			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">

						<br>

						<table id="example-small" class="table hover table-responsive">
							<thead class="text-center" id="thead">
								<tr>
									<th style="text-align: center;" width="10%">S.No.</th>
									<th style="text-align: center;" width="35%">Name</th>
									<!-- <th style="text-align: center;" width="35%">Date</th> -->

									<%
									if (user_sidebar_dto.getUpdate_module().equals("Yes")) {
									%>
									<th style="text-align: center;" width="10%">Edit</th>
									<%
									}
									%>
									<%
									if (user_sidebar_dto.getDelete_module().equals("Yes")) {
									%>
									<th style="text-align: center;" width="10%">Delete</th>
									<%
									}
									%>
								</tr>
							</thead>
							<tbody class="text-center" id="tbody">
								<%
								ItemCategoryService ser = new ItemCategoryService();
								ArrayList<ItemCategoryDto> list1 = ser.getCategoryInfo(config, request);
								for (ItemCategoryDto dto : list1) {
								%>
								<tr>
									<td><%=list1.indexOf(dto) + 1%></td>
									<td><%=dto.getName()%></td>
									<%-- <td><%=LogFileService.changeFormate(dto.getCurrent_in_date(), "yyyy-MM-dd", "dd-MM-yyyy")%> --%>
									<%
									if (user_sidebar_dto.getUpdate_module().equals("Yes")) {
									%>
									<td><a class="main-color"
										href="edit_item_category.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
									<%
									}
									%>
									<%
									if (user_sidebar_dto.getDelete_module().equals("Yes")) {
									%>
									<td><a class="main-color"
										onclick="return confirm('Are you sure? You want to delete')"
										href="AjaxService/AjaxDelete.jsp?item_category_id=<%=dto.getId()%>">
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