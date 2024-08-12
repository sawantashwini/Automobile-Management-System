

<!-- head -->
<%@include file="include/head.jsp"%>
<!-- head end -->
</head>

<body >

	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->

	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->

	<main id="main" class="main">
		<div class="row justify-content-center">
			<div class="pagetitle col-lg-10 text-center">
				<h1>Edit Other Dealer Opening Due</h1>
			</div>
		</div>

		<section class="section">
			<div class="row">

				<div class="card" style="border-radius: 25px;">
					<div class="card-body">

						<%
							int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
						    int dealer_id_fk = Integer.parseInt(request.getParameter("dealer_id_fk") == null ? "0" : request.getParameter("dealer_id_fk"));
						    DealerOtherService service = new DealerOtherService();
						    PurchaseOtherDto dto1 = service.getDealerOtherInfoById(dealer_id_fk, config, request);
							%>

			<div class="table-responsive">
							<table class="table info-table table-borderless mt-4 table-color">
								<tr>
									<th width="90px">Name :</th>
									<td width="600px"><%=dto1.getName()%></td>
									<th width="100px">GstIn :</th>
									<td width="250px"><%=dto1.getGst_no()%></td>
									<th width="150px">Mobile no :</th>
									<td width="145px"><%=dto1.getMobile_no()%></td>
								</tr>

								<tr>
									<th>Add. :</th>
									<td><%=dto1.getAddress()%></td>
									<th>Due :</th>
									<td colspan="3"><%=dto1.getOld_due()%></td>

								</tr>
							</table>
						</div>

						<br />
						<br />

						<!-- Floating Labels Form -->

						<%
							PurchaseOtherDto dto = service.getDealerAccountInfoById(id, config, request);
							%>


						<!-- Floating Labels Form -->
						<form autocomplete="off" action="DealerOtherServlet" method="post"
							class="row g-3 needs-validation d-flex justify-content-center"
							novalidate>
							<input type="hidden" name="User_id_fk" value="<%=user_id%>"> 
							<input type="hidden" name="Id" id="id" value="<%=dealer_id_fk%>"> 
							<input type="hidden" name="Type" id="type" value="Opening Due"> 
							<input type="hidden" id="c_y_session" name="C_y_session" value="<%=current_session%>">
							<div class="col-sm-6">
								<div class="control form-floating">
									<input type="number" step="0.01" class="form-control" id="opening_due"
											name="Opening_due"  placeholder="Opening_due" value="<%=dto.getOpening_due() %>" required > <label
											for="opening_due"> Opening Due</label>
									<div class="invalid-feedback">Please, Enter Opening Due !</div>
								</div>
							</div>

							<div class="text-center">
								<button type="submit" class="submit-btn">Submit</button>

							</div>
						</form>
						<!-- End floating Labels Form -->

					</div>
				</div>
			</div>

		</section>

	</main>
	<!-- End main -->

	<br />
	<br />



	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>

</html>