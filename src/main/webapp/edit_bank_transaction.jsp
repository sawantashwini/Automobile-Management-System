<%@include file="include/head.jsp"%>
</head>
<body>


	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->


	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->

	<main id="main" class="main">


		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Bank To Bank Transaction</h1>
			</div>
		</div>
		<section class="section dashboard">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="card" style="border-radius: 25px;">
						<div class="card-body">
							<br />
							<%
							int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
							BankTransactionService ser = new BankTransactionService();
							BankDto dto = ser.getTransactionInfoById(id, config, request);
							%>

							<!-- Floating Labels Form -->
							<form autocomplete="off" action="BankTransactionServlet"
								method="post" class="row g-3 needs-validation" novalidate>

								<div class="col-md-4">
									<div class="control form-floating">
										<input type="date" class="form-control" id="in_date"
											name="In_date" value="<%=dto.getIn_date()%>" placeholder="In Date" required> <label
											for="in_date">In Date</label>
										<div class="invalid-feedback">Please, enter In Date!</div>
									</div>
								</div>

								<!-- First Dropdown -->
								<div class="col-md-3">
									<div id="refresh_bank">
										<div class="control form-floating d-flex">
											<select class="form-select" id="credit_bank_id_fk"
												name="Credit_bank_id_fk" aria-label="working post">
												<option value="0" selected='selected'>Select Bank
													Name</option>
												<%
												BankService ser1 = new BankService();
												ArrayList<BankDto> list1 = ser1.getBankInfo(config, request);
												for (BankDto Bank_dto : list1) {
												%>
												<option value="<%=Bank_dto.getId()%>" <% if(Bank_dto.getId()==dto.getCredit_bank_id_fk()){ %> selected="selected" <%} %>  ><%=Bank_dto.getName()%></option>
												<%
												}
												%>
											</select> <label for="credit_bank_id_fk">From Bank</label>
										</div>
									</div>
								</div>
								
								<div style="left: 0; margin-left: 5px; width: 3%;"
									id="bank_parent">
									<%@include file="include/refresh_add.jsp"%>
								</div>

								<!-- Second Dropdown -->
								<div class="col-md-4">
									<div id="refresh_bank_second">
										<div class="control form-floating d-flex">
											<select class="form-select" id="debit_bank_id_fk"
												name="Debit_bank_id_fk" aria-label="working post">
												<option value="0" selected='selected'>Select Bank
													Name</option>
												<%
												BankService ser_debit = new BankService();
												ArrayList<BankDto> list_debit = ser_debit.getBankInfo(config, request);
												for (BankDto Bank_dto : list_debit) {
												%>
												<option value="<%=Bank_dto.getId()%>"  <% if(Bank_dto.getId()==dto.getDebit_bank_id_fk()){ %> selected="selected" <%} %>  ><%=Bank_dto.getName()%></option>
												<%
												}
												%>
											</select> <label for="debit_bank_id_fk">To Bank</label>
										</div>
									</div>
								</div>
								
								<input type="hidden" name="Id" id="id"
									value="<%=id%>">	
								<input type="hidden" name="User_id_fk" id="user_id_fk"
									value="<%=user_id%>">
								<input type="hidden" name="Credit_online_id_fk" id="credit_online_id_fk"
									value="<%=dto.getCredit_online_id_fk()%>">		
							    <input type="hidden" name="Debit_online_id_fk" id="debit_online_id_fk"
									value="<%=dto.getDebit_online_id_fk()%>">			

								<div class="col-md-6">
									<div class="control form-floating">
										<input type="number" step="0.01" min="0" class="form-control"
											id="transaction_amount" name="Transaction_amount" value="<%=dto.getTransaction_amount()%>"
											placeholder="Amount" required> <label
											for="transaction_amount">Amount</label>
										<div class="invalid-feedback">Please, enter Transaction
											Amount!</div>
									</div>
								</div>

								<!-- Start Remark -->
								<div class="col-md-12">
									<div class="form-floating control">
										<textarea  class="form-control" id="remark"
											name="Remark" placeholder="Remark"><%=dto.getRemark()%></textarea> <label
											for="remark">Remark</label>
										<div class="invalid-feedback">Please, enter Remark!</div>
									</div>
								</div>
								<!-- end Remark -->

								<div class="text-center">
									<button type="submit" class="submit-btn">Submit</button>

								</div>

							</form>
							<!-- End floating Labels Form -->

						</div>
					</div>
				</div>


			</div>
		</section>

	</main>
	<!-- End main -->

	<br />
	<br />


	<script>
	</script>

	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>

</html>