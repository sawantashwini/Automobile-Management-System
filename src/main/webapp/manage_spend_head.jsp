<%@include file="include/head.jsp"%>
</head>
<body>

	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->


	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->

	<!--  alert massages start-->

	<main id="main" class="main">


		<!-- ======= Breadcrumbs ======= -->
		<%@include file="breadcrumbs/spend.jsp"%>
		<!--  Breadcrumbs End-->
		<div class="pagetitle text-center">
			<h1 id="page_title">Manage Spend Head</h1>
		</div>
		<%@include file="include/add_pages.jsp"%>
		<section class="section">
			<div class="row">
				<div class="card" style="border-radius: 25px;">
					<div class="card-body table-responsive">

						<br>

						<table id="example-small"
							class="table hover table-responsive nowrap">
							<thead id="thead">
								<tr>
									<th style="width: 10%; text-align: center;">S.N0.</th>
									<th style="width: 20%; text-align: center;">Name</th>
									<th style="width: 20%; text-align: center;">Status</th>
									<th style="width: 10%; text-align: center;">Edit</th>
									<!-- <th style="width: 10%; text-align: center;">Del.</th> -->
								</tr>

							</thead>
							<tbody class="text-center" id="tbody">
								<%
								SpendHeadService ser = new SpendHeadService();
								ArrayList<SpendHeadDto> list1 = ser.getSpendHeadInfo(config, request);
								for (SpendHeadDto dto : list1) {
								%>
								<tr>
									<td><%=list1.indexOf(dto) + 1%></td>
									<td><%=dto.getName()%></td>

									<td><a class="main-color" href="#"><%=dto.getStatus()%></a></td>
									<td><a class="main-color"
										href="edit_spend_head.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
									<%-- <td><a onclick="return confirm('Are you sure? You want to delete')"
										href="AjaxDelete.jsp?spend_head_id=<%=dto.getId()%>"> <i
											class="bi bi-trash main-color"></i></a></td> --%>
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


	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->

<!-- ======= Footer ======= -->
	<%@include file="include/datatable_script_footer.jsp"%>
	<!-- End Footer -->

</body>

</html>