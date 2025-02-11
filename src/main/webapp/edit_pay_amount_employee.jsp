
<%@include file="include/head.jsp"%>

</head>
<body onload="loadPaymentMode();">


	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->


	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->


	<main id="main" class="main">



		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Edit Salary Transaction</h1>
			</div>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-12">

					<div class="card" style="border-radius: 20px;">
						<div class="card-body">

							<h5 class="text-center card-title pt-3">Employee Details</h5>

							<!-- <br /> -->

							<%
							String amountmode = request.getParameter("amountmode");
							int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
							EmployeeAccountService service = new EmployeeAccountService();

							EmployeeAccountDto dto = service.getEmployeeAccountInfoById(id, config, request);
							%>

							<!-- Floating Labels Form -->
							<form action="EmployeeAccountServlet" method="post"
								class="row g-3 needs-validation" novalidate>

								<div class="col-sm-4">
									<div class="control form-floating">
										<input readonly type="text" class="form-control"
											id="Employee_name" name="Employee_name"
											placeholder="Employee Name"
											value="<%=dto.getEmployee_name()%>" required> <label
											for="name">Employee Name</label>
									</div>
								</div>

								<input type="hidden" name="Id" id="id" value="<%=id%>">
								<input type="hidden" name="Employee_id_fk"
									value="<%=dto.getEmployee_id_fk()%>"> <input
									type="hidden" id="user_id_fk" value="<%=user_id%>"
									name="User_id_fk">

								<div class="col-md-4">
									<div class="control form-floating">
										<input readonly type="number" class="form-control"
											id="mobile_no" name="Mobile_no" placeholder="Mobile Number"
											value="<%=dto.getMobile_no()%>" required> <label
											for="mo_nomber">Mobile Number</label>
									</div>
								</div>

								<!-- Salary Per Month Start -->
								<div class="col-sm-4">
									<div class="control form-floating">
										<input readonly type="number" class="form-control"
											id="salary_per_month" name="Salary_per_month"
											placeholder="Base Price" step="0.01"
											value="<%=dto.getSalary_per_month()%>" required> <label
											for="salary_per_month">Salary Per Month</label>
									</div>
								</div>
								<!-- Salary Per Month end -->

								<!-- End Restrict Form -->

								<h5 class="text-center card-title">Pay Amount Details</h5>
								<div class="col-md-3">
									<div class="control form-floating">
										<input type="Date" class="form-control" id="in_date"
											name="In_date" placeholder="In Date"
											value="<%=dto.getIn_date()%>" required> <label
											for="in_date">Date</label>
										<div class="invalid-feedback">Please, enter In Date!</div>
									</div>
								</div>
								<!-- Amount mode start -->
								<div class="col-md-4">
									<div class="control form-floating mb-3">
										<select class="form-select" id="amountmode" name="Amountmode"
											aria-label="working post" required>
											<option value="Credit"
												<%if (amountmode.equals("Credit")) {
	out.print("selected='selected'");
}%>>Credit</option>
											<option value="Debit"
												<%if (amountmode.equals("Debit")) {
	out.print("selected='selected'");
}%>>Debit</option>
										</select> <label for="Amountmode">Select Amount Mode</label>
									</div>
								</div>
								<!-- Amount mode end -->

								<!-- Cash Amount Start -->
								<div class="col-md-3" id="cash_block">
									<div class="control form-floating">
										<input type="number" step="0.01" class="form-control"
											onblur="paidAmountEvent()" id="cash_amount"
											name="Cash_amount" placeholder="Cash Amount"
											value="<%=dto.getCash_amount()%>" required> <label
											for="cash_amount">Cash Amount</label>
									</div>
								</div>
								<!-- Cash Amount end -->

								<!-- Online Amount Start -->
								<div class="d-none" id="online_amt_block">
									<div class="control form-floating">
										<input type="number" step="0.01" class="form-control"
											onblur="paidAmountEvent()" id="online_amount"
											name="Online_amount" placeholder="Online Amount"
											value="<%=dto.getOnline_amount()%>" required> <label
											for="online_amount">Online Amount</label>
									</div>
								</div>
								<!-- Online Amount end -->

								<!-- Paid Amount Start -->
								<div class="d-none" id="paid_block">
									<div class="control form-floating">
										<input readonly type="number" step="0.01"
											style="background-color: #e7ededad;" class="form-control"
											id="paid_amount" name="Paid_amount" placeholder="Paid Amount"
											value="<%=dto.getCash_amount() + dto.getOnline_amount()%>"
											required> <label for="paid_amount">Paid
											Amount</label>
									</div>
								</div>
								<!-- Paid Amount end -->

								<div class="d-none" id="online_block">
									<!-- Online Date Start-->
									<div class="col-md-3">
										<div class="control form-floating">
											<input type="date" class="form-control"
												placeholder="Online Date" id="online_date"
												value="<%=dto.getOnline_date()%>" name="Online_date">
											<label for="online_date">Online Date</label>
											<div class="invalid-feedback">Please, Enter Online
												Date!</div>
										</div>
									</div>
									<!-- Online Date End -->

									<!-- Online way start -->
									<div class="col-md-3">
										<div class="control form-floating mb-3">
											<select class="form-select" id="online_way" name="Online_way"
												aria-label="working post">
												<option value="N/A"
													<%if (dto.getOnline_way().equalsIgnoreCase("N/A")) {
	out.print("selected");
}%>>Select
													payment way</option>
												<option value="Gpay"
													<%if (dto.getOnline_way().equalsIgnoreCase("Gpay")) {
	out.print("selected");
}%>>Gpay</option>
												<option value="Phonepay"
													<%if (dto.getOnline_way().equalsIgnoreCase("Phonepay")) {
	out.print("selected");
}%>>Phone
													Pay</option>
												<option value="Paytm"
													<%if (dto.getOnline_way().equalsIgnoreCase("Paytm")) {
	out.print("selected");
}%>>Paytm</option>
												<option value="Cheque"
													<%if (dto.getOnline_way().equalsIgnoreCase("Cheque")) {
	out.print("selected");
}%>>Cheque</option>
												<option value="Online"
													<%if (dto.getOnline_way().equalsIgnoreCase("Online")) {
	out.print("selected");
}%>>Online</option>

											</select> <label for="online_way">Select Online Way</label>
										</div>
									</div>
									<!-- Online way end -->

									<div class="col-md-2">
										<div id="refresh_bank">
											<div class="control form-floating d-flex">
												<select class="form-select" id="bank_id_fk"
													name="Bank_id_fk" aria-label="working post">
													<option value="0" Selected='selected'>Select Bank
														Name</option>

													<%
													BankService ser1 = new BankService();

													ArrayList<BankDto> list1 = ser1.getBankInfo(config, request);

													for (BankDto Bank_dto : list1) {
													%>

													<option value="<%=Bank_dto.getId()%>"
														<%if (dto.getBank_id_fk() == Bank_dto.getId()) {
	out.print("selected");
}%>><%=Bank_dto.getName()%></option>


													<%
													}
													%>

												</select> <label for="bank_id_fk">Select Bank</label>
											</div>
										</div>
									</div>
									<div style="left: 0; margin-left: 5px; width: 3%;"
										id="bank_parent">
										<%@include file="include/refresh_add.jsp"%>
									</div>



									<!-- Online Remark Start -->
									<div class="col-md-3">
										<div class="control form-floating">
											<input class="form-control" id="online_remark"
												name="Online_remark" placeholder="Online Remark"
												value="<%=dto.getOnline_remark()%>"> <label
												for="online_remark">Online Remark</label>
										</div>
									</div>
									<!-- Online Remark End -->

								</div>
								<!-- *** Online Block End *** -->

								<h5 class="text-center card-title">Payment Details</h5>
								<div class="container d-flex justify-content-center">
									<div class="col-md-4 col-sm-12 d-flex justify-content-around">

										<div class="form-check" style="margin-right: 5px;">
											<input class="form-check-input" type="radio"
												name="Payment_mode1" id="cash_mode" value="Cash"
												onclick="checkPaymentMode();"
												<%if (dto.getPayment_mode().equalsIgnoreCase("Cash")) {%>
												checked <%}%>> <label class="form-check-label"
												for="cash_mode"> Cash </label>
										</div>
										<div class="form-check" style="margin-right: 5px;">
											<input class="form-check-input" type="radio"
												name="Payment_mode1" id="online_mode" value="Online"
												onclick="checkPaymentMode();"
												<%if (dto.getPayment_mode().equalsIgnoreCase("Online")) {%>
												checked <%}%>> <label class="form-check-label"
												for="online_mode"> Online </label>
										</div>

										<div class="form-check" style="margin-right: 5px;">
											<input class="form-check-input" type="radio"
												name="Payment_mode1" id="both_mode" value="Both"
												onclick="checkPaymentMode();"
												<%if (dto.getPayment_mode().equalsIgnoreCase("Both")) {%>
												checked <%}%>> <label class="form-check-label"
												for="both_mode"> Both </label>
										</div>

									</div>
								</div>


								<input type="hidden" id="payment_mode" name="Payment_mode"
									value="Cash" />

								<div class="col-md-12">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Remark"
											id="remark" Name="Remark"><%=dto.getRemark()%></textarea>
										<label for="remark">Remark</label>
									</div>
								</div>


								<div id="sub" class="text-center">
									<button type="submit" class="submit-btn">Submit</button>
								</div>


							</form>
							<!-- Fees Form start -->

						</div>
					</div>
				</div>


			</div>
		</section>

	</main>
	<!-- End main -->

	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->

	<script type="text/javascript" src="js/employee.js"></script>


</body>

</html>