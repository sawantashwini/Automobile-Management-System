
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
		<%@include file="breadcrumbs/vehicles.jsp"%>
		<!--  Breadcrumbs End-->

		<div class="pagetitle text-center">
			<h1 id=page_title>City Report</h1>
		</div>
		
		<%@include file="include/add_pages.jsp"%>

		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">

						<br />

						<table id="example-small" class="table hover table-responsive">
							<thead class="text-center" id="thead">
								<tr>
									<th style="text-align: center;" width="10%">S.No.</th>
									<th style="text-align: center;" width="35%">Name</th>
									<!-- <th style="text-align: center;" width="35%">Date</th> -->
									<% if(user_sidebar_dto.getUpdate_module().equals("Yes")){%>
									<th style="text-align: center;" width="10%">Edit</th>
									<%} %>
									<% if(user_sidebar_dto.getDelete_module().equals("Yes")){%>
									<th style="text-align: center;" width="10%">Delete</th>
									<%} %>
								</tr>
							</thead>
							<tbody id="tbody">


								<%
									
									CityService service = new CityService();
									ArrayList<CityDto>list = service.getCityInfo(config, request);
									
									for(CityDto dto : list ){
									
									%>


								<tr>
									<td style="text-align: center;"><%=list.indexOf(dto) + 1%></td>
									<td style="text-align: center;" id="name"><%=dto.getName()%></td>
									<%-- <td style="text-align: center;"> <%=LogFileService.changeFormate(dto.getCurrent_in_date(), "yyyy-MM-dd", "dd-MM-yyyy")%> --%>
									<% if(user_sidebar_dto.getUpdate_module().equals("Yes")){%>
									<td style="text-align: center;"><a class="main-color"
										href="edit_city.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>

									<%} %>
									<% if(user_sidebar_dto.getDelete_module().equals("Yes")){%>
									<td><a class="main-color"
										onclick="return confirm('Are you sure? You want to delete')"
										href="AjaxService/AjaxDelete.jsp?city_id=<%=dto.getId()%>">
											<i class="bi bi-trash"></i>
									</a></td>
									<%} %>
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


	<!-- print script without date -->
	<script>
function printfunction(){
	var page_title=document.getElementById('page_title').innerHTML;
	
	
	
	return '<h1 style="text-align:center;margin-bottom:10px;">'+page_title+'</h1>';
	
}


function printTitle(){
	//alert("print");
	var page_title=document.getElementById('page_title').innerHTML;
	
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