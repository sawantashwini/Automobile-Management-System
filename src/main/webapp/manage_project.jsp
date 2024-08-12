	<!-- ======= Head ======= -->
	<%@include file="include/head.jsp"%>
	<!-- ======= Head end======= -->

</head>

<body >


	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->


	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->
	
	<main id="main" class="main">
	
		<div class="pagetitle text-center">
			<h1 id=page_title>Manage Project</h1>
		</div>

		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">

						

						<br>
						

						<table id="example1" class="table hover table-responsive">
							<thead class="text-center"  id="thead">
								<tr>
									<th>ID</th>
									<th>Image</th>
									<th>Name</th>
									<th>Mobile No.</th>
									<th>Address</th>
									<th>GST in </th>
									<th>Date</th>
									<th>Terms & Conditions</th>
									<% if(user_sidebar_dto.getUpdate_module().equals("Yes")){%>	
									<th >Edit</th>
									<%} %>
								
								</tr>
							</thead>
							<tbody  id="tbody">
							<%
									
									
							ProjectService service = new ProjectService();
												
							ArrayList<ProjectDto>list = service.getProjectInfo(config, request);
									
												for(ProjectDto dto : list ){
									
									%>
                  
					 <tr>
                      <td><%=list.indexOf(dto) + 1%></td>
                      <td>
                 					<div class="align-item-center justify-content-center">
                    					<img src="ProjectImage/<%=dto.getId()%>.jpg" width="50px" height="50px" alt="No Photo"/>
                  					</div>
                				</td>
                      <td  class="main-color"><%=dto.getNAME() %></td>
                     <td><%=dto.getMobile_no() %></td>
                    
                      <td><%=dto.getLocal_address() %></td>
                       <td><%=dto.getGst_in() %></td>
					
					<td><%=LogFileService.changeFormate(dto.getCurrent_in_date(),
						"yyyy-MM-dd", "dd-MM-yyyy")%>
					</td>
                     <td><%=dto.getTerm_and_conditions() ==  null ? "" : dto.getTerm_and_conditions()%></td>
                     <% if(user_sidebar_dto.getUpdate_module().equals("Yes")){%>
					<td><a class="main-color"  href="edit_project.jsp?id=<%=dto.getId()%>"><i class="bi bi-pencil-square"></i></a></td>
								 <% } %>
							</tr>		
								
                           <% } %>
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