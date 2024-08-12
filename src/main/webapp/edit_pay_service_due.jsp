
<!-- head -->
<%@include file="include/head.jsp"%>
<!-- head end -->
</head>

<body 
	onload="loadPaymentMode();">



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
				<h1>Edit Service Due</h1>
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

							ServiceDueService service1 = new ServiceDueService();
							ServiceBillDto dto = service1.getServiceDueInfoByPaidId(id, config, request);
							%>
							<form autocomplete="off" action="ServiceDueServlet" method="post"
								class="row g-3 needs-validation" novalidate>

								<div class="col-md-3">
									<div class="control form-floating">
										<input type="hidden" name="User_id_fk" value="<%=user_id%>">
										<input type="hidden" id="service_id_fk" name="Service_id_fk"
											value="<%=dto.getService_id_fk()%>"> <input
											type="hidden" id="id" name="Id" value="<%=id%>"> <input
											type="Date" class="form-control" id="pay_date"
											name="Pay_date" placeholder="pay_date"
											value="<%=current_date%>" required> <label
											for="bill_date">Date</label>
										<div class="invalid-feedback">Please, enter bill_date!</div>
									</div>
								</div>





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
							
										<input type="hidden" id="due_amt"
											 value="<%=dto.getDue_amt()+(dto.getCash_amount()+dto.getOnline_amount())%>"
											step=0.01> 
									
								<!-- Cash Amount end -->


								<!-- Cash Amount Start -->
								<div class="col-md-3" id="cash_block">
									<div class="control form-floating">
										<input type="number" class="form-control"
											onblur="paidAmountEvent();" id="cash_amount"
											name="Cash_amount" placeholder="Cash Amount"
											value="<%=dto.getCash_amount()%>" step="0.01" required>
										<label for="cash_amount">Cash Amount</label>
									</div>
								</div>
								<!-- Cash Amount end -->
								<%-- <!-- Cash Amount Start -->
								<div class="col-md-3" id="cash_block">
									<div class="control form-floating">
										<input type="date" class="form-control"
											 id="upcoming_date"
											name="Upcoming_date" placeholder="Upcoming_date" value="<%=dto.getUpcoming_date()%>"
											> <label for="upcoming_date">Upcoming date</label>
									</div>
								</div>
								<!-- Cash Amount end --> --%>
								<!-- Online Amount Start -->
								<div class="d-none" id="online_amt_block">
									<div class="control form-floating">
										<input type="number" class="form-control"
											onblur="paidAmountEvent();" id="online_amount"
											name="Online_amount" placeholder="Online Amount"
											value="<%=dto.getOnline_amount()%>" step="0.01" required>
										<label for="online_amount">Online Amount</label>
									</div>
								</div>
								<!-- Online Amount end -->

								<!-- Paid Amount Start -->
								<div class="d-none" id="paid_block">
									<div class="control form-floating">
										<input readonly type="number"
											style="background-color: #e7ededad;" class="form-control"
											id="paid_amount" name="Paid_amount" onblur="paidAmountEvent();" placeholder="Paid Amount"
											value="<%=dto.getPaid_amount()%>"
											step="0.01" required> <label for="paid_amount">Paid
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
												<option value="gpay"
													<%if (dto.getOnline_way().equalsIgnoreCase("gpay")) {
	out.print("selected");
}%>>Gpay</option>
												<option value="phonepay"
													<%if (dto.getOnline_way().equalsIgnoreCase("phonepay")) {
	out.print("selected");
}%>>Phone
													Pay</option>
												<option value="paytm"
													<%if (dto.getOnline_way().equalsIgnoreCase("paytm")) {
	out.print("selected");
}%>>Paytm</option>
												<option value="cheque"
													<%if (dto.getOnline_way().equalsIgnoreCase("cheque")) {
	out.print("selected");
}%>>Cheque</option>
												<option value="online"
													<%if (dto.getOnline_way().equalsIgnoreCase("online")) {
	out.print("selected");
}%>>Online</option>



											</select> <label for="online_way">Select Online Way</label>
										</div>
									</div>
									<!-- Online way end -->
									<!-- Bank Detail start -->
									<div class="col-md-3 refresh-container mb-3" data-add="add_bank.jsp" data-list="bank">								
									<div class="control form-floating refresh-input">
										<input type="text" class="form-control" id="bank_name" placeholder="Select Bank Name">
										<input type="hidden" id="bank_id_fk" name="Bank_id_fk" value="<%=dto.getBank_id_fk()%>"/>
										<label for="bank_name">Select Bank Name</label>
										<div class="invalid-feedback">Please, Select Bank!</div>
									</div>			
								</div>
								
									<%-- <div class="col-md-2">
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

													<option value="<%=Bank_dto.getId()%>"<%if (Bank_dto.getId() == dto.getBank_id_fk()) {%>selected="selected" <%}%>><%=Bank_dto.getName()%></option>


													<%
													}
													%>

												</select> <label for="bank_id_fk">Select Bank</label>
											</div>
										</div>
									</div>
									<div class="refresh_add" id="bank_parent">
										<%@include file="include/refresh_add.jsp"%>
									</div>

 --%>
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
												<%if (dto.getPayment_mode().equalsIgnoreCase("cash")) {%>
												checked <%}%>> <label class="form-check-label"
												for="cash_mode"> Cash </label>
										</div>
										<div class="form-check" style="margin-right: 5px;">
											<input class="form-check-input" type="radio"
												name="Payment_mode1" id="online_mode" value="Online"
												onclick="checkPaymentMode();"
												<%if (dto.getPayment_mode().equalsIgnoreCase("online")) {%>
												checked <%}%>> <label class="form-check-label"
												for="online_mode"> Online </label>
										</div>

										<div class="form-check" style="margin-right: 5px;">
											<input class="form-check-input" type="radio"
												name="Payment_mode1" id="both_mode" value="Both"
												onclick="checkPaymentMode();"
												<%if (dto.getPayment_mode().equalsIgnoreCase("both")) {%>
												checked <%}%>> <label class="form-check-label"
												for="both_mode"> Both </label>
										</div>

									</div>
								</div>


								<input type="hidden" id="payment_mode" name="Payment_mode"
									value="Cash" />


								<%-- <div class="col-md-12">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Remark"
											id="upcoming_remark" Name="Upcoming_remark"><%=dto.getUpcoming_remark()%></textarea>
										<label for="upcoming_remark">Upcoming Remark</label>
									</div>
								</div> --%>
								<div class="col-md-12">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Remark"
											id="remark" Name="Remark"><%=dto.getRemark()%></textarea>
										<label for="remark">Remark</label>
									</div>
								</div>


								<input type="hidden" id="type" name="Type" value="Service due">

								<input type="hidden" id="c_y_session" name="C_y_session"
									value="<%=session_year%>">





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
//alert("hgj");
			let cash_amount = parseFloat(document.getElementById("cash_amount").value);
			let online_amount = parseFloat(document.getElementById("online_amount").value);
			let due_amt= parseFloat(document.getElementById("due_amt").value); 
			paid_amount = cash_amount + online_amount;
			if(paid_amount>due_amt){
				alert("Paid amount is greater than due amount.");
				document.getElementById("cash_amount").value=0.0;
				document.getElementById("online_amount").value=0.0;
				document.getElementById("paid_amount").value = 0.0;
				
				document.getElementById("online_amount").focus();
				document.getElementById("cash_amount").focus();
			}
			else{
			
				document.getElementById("paid_amount").value = paid_amount.toFixed(2);
			
			}
		}
		
		
	</script>
	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>
</html>