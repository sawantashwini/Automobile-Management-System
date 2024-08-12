<%@page import="com.dto.CompanyDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.CompanyService"%>


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
		<%@include file="breadcrumbs/vehicles.jsp"%>
		<!--  Breadcrumbs End-->
		<div class="pagetitle text-center">
			<h1 id=page_title>Company Report</h1>
		</div>
		<%@include file="include/add_pages.jsp"%>
		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">

						<br />

						<table id="example-small" class="table hover table-responsive"
							style="min-width: 100%;">
							<thead class="text-center" id="thead">
								<tr>
									<th style="text-align: center;" width="20%">S.No.</th>
									<th style="text-align: center;" width="25%">Name</th>
									<th style="text-align: center;" width="25%">Service</th>
									<th style="text-align: center;" width="15%">Edit</th>
									<th style="text-align: center;" width="15%">Delete</th>
								</tr>
							</thead>
							<tbody id="tbody">


								<%
								CompanyService ser = new CompanyService();
								ArrayList<CompanyDto> list = ser.getCompanyInfo(config, request);

								for (CompanyDto dto : list) {
								%>


								<tr align="center">
									<td><%=list.indexOf(dto) + 1%></td>
									<td id="name-td"><%=dto.getName()%></td>
									<td><%=dto.getService_count()%></td>
									<td><a class="main-color"
										href="edit_company.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
									<td><a class="main-color"
										onclick="return confirm('Are you sure? You want to delete')"
										href="AjaxService/AjaxDelete.jsp?company_id=<%=dto.getId()%>">
											<i class="bi bi-trash"></i>
									</a></td>
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