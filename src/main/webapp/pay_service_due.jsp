

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




	<div id="result_info"></div>


	<main id="main" class="main">


		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Pay Service Due</h1>
			</div>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-12">

					<div class="card" style="border-radius: 25px;">


						<div class="card-body">
							<br /> <br>

							<!-- Floating Labels Form -->
							<%
							int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
							ServiceBillService service = new ServiceBillService();
							ServiceBillDto dto = service.getServiceBillInfoById(id, config, request);
							%>
							<form autocomplete="off" action="ServiceDueServlet" method="post"
								class="row g-3 needs-validation" novalidate>

								<div class="col-md-3">
									<div class="control form-floating">
										<input type="hidden" name="User_id_fk" value="<%=user_id%>">
										<input type="hidden" id="type" name="Type" value="Service due">


										<input type="Date" class="form-control" id="pay_date"
											name="Pay_date" placeholder="pay_date"
											value="<%=current_date%>" required> <label
											for="bill_date">Date</label>
										<div class="invalid-feedback">Please, enter bill_date!</div>
									</div>
								</div>

								<input type="hidden" id="service_id_fk" name="Service_id_fk"
									value="<%=dto.getId()%>">
								<div class="col-sm-3">
									<div class="control form-floating">
										<input type="text" class="form-control" id="name" name="Name"
											placeholder="Name" value="<%=dto.getCustomer_name()%>">
										<label for="Name">Customer Name</label>
										<div class="invalid-feedback">Please, Enter Customer
											Name !</div>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="control form-floating">
										<input type="text" class="form-control" id="mobile_no"
											name="Mobile_no" placeholder="Mobile_no"
											value="<%=dto.getCustomer_mobile_no()%>"> <label
											for="mobile_no">Mobile No.</label>
										<div class="invalid-feedback">Please, Enter Mobile
											Number!</div>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="control form-floating">
										<input type="text" class="form-control" id="address"
											name="Address" placeholder="address"
											value="<%=dto.getCustomer_address()%>"> <label
											for="Customer Address">Customer Address</label>
										<div class="invalid-feedback">Please, Enter Customer
											Address !</div>
									</div>
								</div>

								<!-- Model Name Start -->
								<div class="col-sm-3">
									<div class="control form-floating">
										<input type="text" class="form-control" id="model_name"
											name="Model_name" placeholder="Model Name"
											value="<%=dto.getModel_name()%>" required> <label
											for="model_name">Model Name</label>
										<div class="invalid-feedback">Please, Enter Model Name!</div>
									</div>
								</div>
								<!-- Model Name End -->

								<!-- Chassis No. Start -->
								<div class="col-sm-3">
									<div class="control form-floating">
										<input type="text" class="form-control" id="chassis_no"
											name="Chassis_no" placeholder="Chassis No."
											value="<%=dto.getChassis_no()%>" required> <label
											for="chassis_no">Chassis No.</label>
										<div class="invalid-feedback">Please, Enter Chassis
											Number!</div>
									</div>
								</div>
								<!-- Chassis No. End -->

								<!-- Engine No. Start -->
								<div class="col-sm-3">
									<div class="control form-floating">
										<input type="text" class="form-control" id="engine_no"
											name="Engine_no" placeholder="Engine No."
											value="<%=dto.getEngine_no()%>" required> <label
											for="engine_no">Engine No.</label>
										<div class="invalid-feedback">Please, Enter Engine
											Number!</div>
									</div>
								</div>
								<!-- Engine No. End -->

								<!-- Cash Amount Start -->
								<div class="col-md-3">
									<div class="control form-floating">
										<input type="number" class="form-control" id="due_amt"
											placeholder="Due Amount" value="<%=dto.getDue_amt()%>"
											step=0.01> <label for="due_amt">Due Amount</label>
									</div>
								</div>
								<!-- Cash Amount end -->

								<%-- <!-- Service Type Start -->
								<div class="col-md-3">
									<div class="form-floating control mb-3">
										<select class="form-select" id="type" name="Type"
											aria-label="working post">
											<option value="Free"
												<%if (dto.getType().equals("Free")) {
	out.print("selected='selected'");
}%>>Free</option>

											<option value="Paid"
												<%if (dto.getType().equals("Paid")) {
	out.print("selected='selected'");
}%>>Paid</option>

										</select> <label for="Type">Service Type</label>
										<div class="invalid-feedback">Please, select Service
											Type !</div>
									</div>
								</div>
								<!-- Service Type End --> --%>




								<!-- Cash Amount Start -->
								<div class="col-md-3" id="cash_block">
									<div class="control form-floating">
										<input type="number" class="form-control"
											onblur="paidAmountEvent()" id="cash_amount"
											name="Cash_amount" placeholder="Cash Amount" value="0"
											step=0.01> <label for="cash_amount">Cash
											Amount</label>
									</div>
								</div>

								<!-- Online Amount Start -->
								<div class="d-none" id="online_amt_block">
									<div class="control form-floating">
										<input type="number" class="form-control"
											onblur="paidAmountEvent()" id="online_amount"
											name="Online_amount" placeholder="Online Amount" value="0"
											step=0.01> <label for="online_amount">Online
											Amount</label>
									</div>
								</div>
								<!-- Online Amount end -->

								<div class="d-none" id="paid_block">
									<div class="control form-floating">
										<input readonly type="number"
											style="background-color: #e7ededad;" class="form-control"
											id="paid_amount" name="Paid_amount" onblur="paidAmountEvent()" placeholder="pay_amount"
											value="0" required step=0.01> <label
											for="paid_amount">Paid Amount</label>
									</div>
								</div>
								<div class="d-none" id="online_block">
									<!-- Online Date Start-->
									<div class="col-md-3">
										<div class="control form-floating">
											<input type="date" class="form-control"
												placeholder="Online Date" id="online_date" 
												name="Online_date"> <label for="online_date">Online
												Date</label>
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
												<option value="N/A" Selected='selected'>Select
													Online way</option>

												<option value="Gpay">Gpay</option>
												<option value="Phonepay">Phone Pay</option>
												<option value="Paytm">Paytm</option>
												<option value="Cheque">Cheque</option>
												<option value="Online">Online</option>


											</select> <label for="online_way">Select Online Way</label>
										</div>
									</div>
									<!-- Online way end -->
<!-- Bank Detail start -->
										<div class="col-md-3 refresh-container mb-3" data-add="add_bank.jsp" data-list="bank">								
									<div class="control form-floating refresh-input">
										<input type="text" class="form-control" id="bank_name" placeholder="Select Bank Name">
										<input type="hidden" id="bank_id_fk" name="Bank_id_fk" value="0"/>
										<label for="bank_name">Select Bank Name</label>
										<div class="invalid-feedback">Please, Select Bank!</div>
									</div>			
								</div>
									<%-- <!-- Bank Detail start -->
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

													<option value="<%=Bank_dto.getId()%>"><%=Bank_dto.getName()%></option>


													<%
													}
													%>

												</select> <label for="bank_id_fk">Select Bank</label>
											</div>
										</div>
									</div>
									<div class="refresh_add"
										id="bank_parent">
										<%@include file="include/refresh_add.jsp"%>
									</div> --%>


									<!-- Online Remark Start -->
									<div class="col-md-3">
										<div class="control form-floating">
											<input class="form-control" id="online_remark"
												name="Online_remark" placeholder="Online Remark" value="N/A"> <label
												for="online_remark">Online Remark</label>
										</div>
									</div>
									<!-- Online Remark End -->

								</div>
								<!-- *** Online Block End *** -->






								<input type="hidden" class="form-control" id="c_y_session"
									name="C_y_session" value="<%=session_year%>">










								<h5 class="text-center card-title">Payment Mode</h5>
								<div class="container d-flex justify-content-center">
									<div class="col-md-3 ">
										<div class="d-flex justify-content-around">

											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="Payment_mode1" id="cash_mode" value="Cash"
													onclick="checkPaymentMode();" checked> <label
													class="form-check-label" for="cash_mode"> Cash
												</label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="Payment_mode1" id="online_mode" value="Online"
													onclick="checkPaymentMode();"> <label
													class="form-check-label" for="online_mode">
													Online </label>
											</div>

											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="Payment_mode1" id="both_mode" value="Both"
													onclick="checkPaymentMode();"> <label
													class="form-check-label" for="both_mode"> Both
												</label>
											</div>

										</div>
									</div>
								</div>
								<input type="hidden" id="payment_mode" name="Payment_mode"
									value="Cash" />
								<!-- Cash Amount end -->
								<!-- Cash Amount Start -->
								<div class="col-md-2" id="cash_block">
									<div class="control form-floating">
										<input type="date" class="form-control" id="upcoming_date"
											name="Upcoming_date" placeholder="Upcoming_date">
										<label for="upcoming_date">Upcoming date</label>
									</div>
								</div>
								<!-- Cash Amount end -->



								<div class="col-md-5">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Remark"
											id="upcoming_remark" Name="Upcoming_remark">N/A</textarea>
										<label for="upcoming_remark">Upcoming Remark</label>
									</div>
								</div>

								<div class="col-md-5">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Remark"
											id="remark" Name="Remark">N/A</textarea>
										<label for="remark">Remark</label>
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


			</div>
		</section>

	</main>
	<!-- End main -->
	<br />
	<br />

	<script>

function paidAmountEvent() {
	 
	let cash_amount = parseFloat(document.getElementById("cash_amount").value);
	let online_amount = parseFloat(document.getElementById("online_amount").value);
	let due_amt = parseFloat(document.getElementById("due_amt").value);
	
	paid_amount = cash_amount + online_amount;
	
	if(paid_amount>due_amt){
		alert("Paid amount is greater than due amount.");
		document.getElementById("cash_amount").value = 0.0; 
		document.getElementById("online_amount").value=  0.0; 
		document.getElementById("paid_amount").value = 0.0; 
		
		document.getElementById("online_amount").focus();
		document.getElementById("cash_amount").focus(); 
		
	}
	else{
	document.getElementById("paid_amount").value=paid_amount.toFixed(2);
	}
}


	</script>
	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>
</html>