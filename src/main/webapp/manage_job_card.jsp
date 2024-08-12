<%@page import="com.dto.JobCardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.JobCardService"%>


<!-- head -->
<%@include file="include/head.jsp"%>
<!-- head end -->
</head>


<body >
	<%
	String d1 = request.getParameter("D1") == null ? "" : request.getParameter("D1");
	String d2 = request.getParameter("D2") == null ? "" : request.getParameter("D2");
	String first_date = LogFileService.changeFormate(d1, "yyyy-MM-dd", "dd-MM-yyyy") == null ? "" : LogFileService.changeFormate(d1, "yyyy-MM-dd", "dd-MM-yyyy");
	String second_date = LogFileService.changeFormate(d2, "yyyy-MM-dd", "dd-MM-yyyy") == null ? "" : LogFileService.changeFormate(d2, "yyyy-MM-dd", "dd-MM-yyyy");
	int k = Integer.parseInt(request.getParameter("periods") == null ? "0" : request.getParameter("periods"));
	
	if (k != 0) {
		String temp = LogFileService.getEndDates("yyyy-MM-dd", k);
		String dates[] = temp.split(",");
		d1 = dates[0];
		d2 = dates[1];
		System.out.println(temp);
	}
	%>


	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->



	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->

	<main id="main" class="main">


		<!-- ======= Breadcrumbs ======= -->
	<%@include file="breadcrumbs/jobcard.jsp"%>
	<!--  Breadcrumbs End-->
		<div class="pagetitle text-center">
			<h1 id=page_title>Service Job Card Report</h1>
		</div>
<%@include file="include/add_pages.jsp"%>
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
												<%if (k == 1) {
	out.print("selected='selected'");
}%>
												value="1">Today</option>
											<option
												<%if (k == 3) {
	out.print("selected='selected'");
}%>
												value="3">weekly</option>
											<option
												<%if (k == 5) {
	out.print("selected='selected'");
}%>
												value="5">monthly</option>
<option
												<%if (k == 6) {
	out.print("selected='selected'");
}%>
												value="6">yearly</option>
										</select> <label for="floatingPhone">To Date</label>
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

						<table id="example" class="table hover nowrap">


							<thead id="thead">
								<tr>
									<!--  
								sold_status,STATUS, -->
									<th style="text-align: center;" width="5%">S.No.</th>
									<th style="text-align: center;" width="5%">Service Bill</th>
										<th style="text-align: center;" width="10%">Job Card no.</th>
									<th style="text-align: center;" width="10%">Customer Name</th>
									<th style="text-align: center;" width="5%">Customer Mo.
										No.</th>
									<th style="text-align: center;" width="10%">Customer
										Address</th>
									<th style="text-align: center;" width="10%">Model Name</th>
									<th style="text-align: center;" width="5%">Chassis No.</th>
									<th style="text-align: center;" width="5%">Engine No.</th>

									<th style="text-align: center;" width="5%">In date</th>


									<th style="text-align: center;" width="5%">Due date</th>
									<th style="text-align: center;" width="5%">Type</th>
										<th style="text-align: center;" width="5%">Sales Person</th>
									<th style="text-align: center;" width="10%">Working</th>
									<th style="text-align: center;" width="10%">Remark</th>

									<th style="width: 3%; text-align: center;">Print</th>
									<th style="text-align: center;" width="5%">Edit</th>
									<th style="text-align: center;" width="5%">Delete</th>


								</tr>
							</thead>
							<tbody id="tbody">


								<%
								JobCardService service = new JobCardService();
								ArrayList<JobCardDto> list = service.getJobCardInfo(d1, d2, config, request);

								for (JobCardDto dto : list) {
								%>


								<tr>
									<td><%=list.indexOf(dto) + 1%></td>

									<td>
										<%
										if (dto.getBill_id_fk() == 0) {
										%> <a class="main-color"
										href="service_bill.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a> <%
 } else {
 %> Done
										<%}%>
									</td>
									<td><%=dto.getJob_card_no()%></td>
									<td><%=dto.getCustomer_name()%></td>
									<td><%=dto.getCustomer_mobile_no()%></td>
									<td><%=dto.getCustomer_address()%></td>
									<td class="main-color"><%=dto.getModel_name()%></td>

									<td><%=dto.getChassis_no()%></td>
									<td><%=dto.getEngine_no()%></td>

									<td><%=LogFileService.changeFormate(dto.getIn_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>


									<td><%=LogFileService.changeFormate(dto.getOut_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
									<td><%=dto.getType()%></td>
									<td><%=dto.getSales_person_name()%></td>
									<td><%=dto.getWorking()%></td>
									<td><%=dto.getRemark()%></td>


									<td><a
										href="print_job_card_reciept.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-printer main-color"></i></a></td>
											
									<td><% if (dto.getBill_id_fk() == 0) { %><a href="edit_job_card.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square main-color"></i></a></td><% }%>
											
											<% if(user_sidebar_dto.getDelete_module().equals("Yes")){%>	
									<td><a  class="main-color"  onclick="return confirm('Are you sure? You want to delete')" 
									href="AjaxService/AjaxDelete.jsp?job_card_id=<%=dto.getId()%>">
									<i class="bi bi-trash"></i></a></td>
										<%}%>
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