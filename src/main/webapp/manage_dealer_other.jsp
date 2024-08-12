<!-- ======= css ======= -->
<%@include file="include/head.jsp"%>
<!-- ======= css end======= -->

</head>


<body>

	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->



	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End -->
	<main id="main" class="main">

		<!-- ======= Breadcrumbs ======= -->
		<%@include file="breadcrumbs/othermodule.jsp"%>
		<!--  Breadcrumbs End-->




		<div class="pagetitle text-center">
			<h1 id="page_title">Manage Other Dealer</h1>
		</div>
		
		<%@include file="include/add_pages.jsp"%>
		
		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">

						<br>

						<table id="example" class="table hover nowrap"
							style="width: 1400px;">
							<thead style="text-align: center" id="thead">
								<tr>
									<th width="5%">S.NO.</th>
									<th width="15%">Name</th>
									<th width="12%">Mobile</th>
									<th width="20%">Address</th>
									<th width="10%">GST</th>
									<th width="13%">Due</th>
									<th width="5%">Bill</th>
									<th width="7%">Account</th>
									<th width="7%">Opening</th>
									<th width="5%">Edit</th>

								</tr>
							</thead>
							<tbody class="text-center" id="tbody">
								<%
								DealerOtherService ser = new DealerOtherService();
								ArrayList<PurchaseOtherDto> list = ser.getDealerOtherInfo(config, request);
								for (PurchaseOtherDto dto : list) {
								%>
								<tr>
									<td><%=list.indexOf(dto) + 1%></td>
									<td><%=dto.getName()%></td>
									<td><%=dto.getMobile_no()%></td>
									<td><%=dto.getAddress()%></td>
									<td><%=dto.getGst_no()%></td>
									
									<td><%
									if (dto.getOld_due() > 0) {
									%> <%=dto.getOld_due()%>/<a
										class="main-color"
										href="pay_dealer_other_due.jsp?id=<%=dto.getId()%>"> <i
											class="bi bi-pencil-square"></i></a> 
										<%
										}else{ 
										%>Done <%
										}
										%>/<a id="list-icon"
										href="manage_dealer_other_due.jsp?id=<%=dto.getId()%>"> <i
											class="bi bi-image"></i></a></td>
									<td><a class="main-color"
										href="manage_dealer_other_bills.jsp?id=<%=dto.getId()%>">
											<i class="bi bi-image"></i>
									</a></td>
									<td><a class="main-color"
										href="manage_dealer_other_account.jsp?id=<%=dto.getId()%>">
											<i class="bi bi-image"></i>
									</a></td>


									<td><%=dto.getOpening_due()%> <%
 if (dto.getOpening_due() == 0.00) {
 %>
										/<a class="main-color"
										href="edit_dealer_other_opening_due.jsp?dealer_id_fk=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a> <%
 }
 %></td>

									<td><a class="main-color"
										href="edit_dealer_other.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
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