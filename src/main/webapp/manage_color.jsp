<%@page import="com.dto.ColorDto"%>
<%@page import="com.service.ColorService"%>
<%@page import="com.dto.EmployeeDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.EmployeeService"%>


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


	<main id="main" class="main">



	<!-- ======= Breadcrumbs ======= -->
		<%@include file="breadcrumbs/vehicles.jsp"%>
		<!--  Breadcrumbs End-->

		<div class="pagetitle text-center">
			<h1 id=page_title>Color Report</h1>
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
									<th style="text-align: center;" width="10%">S.No.</th>
									<th style="text-align: center;" width="35%">Color</th>
									<!-- <th style="text-align: center;" width="35%">Date</th> -->

									<th style="text-align: center;" width="10%">Edit</th>
									<th style="text-align: center;" width="10%">Delete</th>
								</tr>
							</thead>
							<tbody id="tbody">


								<%
									
									
									ColorService service = new ColorService();
									ArrayList<ColorDto>list = service.getColorInfo(config, request);
									
									for(ColorDto dto : list ){
									
									%>


								<tr>
									<td style="text-align: center;"><%=list.indexOf(dto) + 1%></td>
									<td style="text-align: center;" class="main-color"><%=dto.getName()%></td>
									<%-- <td style="text-align: center;"> <%=LogFileService.changeFormate(dto.getCurrent_in_date(), "yyyy-MM-dd", "dd-MM-yyyy")%> --%>

									<td style="text-align: center;"><a class="main-color"
										href="edit_color.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
									<td><a class="main-color"
										onclick="return confirm('Are you sure? You want to delete')"
										href="AjaxService/AjaxDelete.jsp?color_id=<%=dto.getId()%>">
											<i class="bi bi-trash"></i>
									</a></td>
								</tr>

								<%} %>



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