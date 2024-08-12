
<%@include file="include/head.jsp"%>
<script type="text/javascript" src="js/spend-income.js"></script>
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
				<h1>Edit Spend</h1>
			</div>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-12">

					<div class="card" style="border-radius: 25px;">


						<div class="card-body">
							<br /> <br>
							<%
							int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
							SpendService service = new SpendService();
							SpendDto dto = service.getSpendInfoById(id, config, request);
							%>




							<!-- Floating Labels Form -->
							<form action="SpendServlet" enctype="multipart/form-data"
								autocomplete="off" method="post"
								class="row g-3 needs-validation" novalidate>


								<div class="col-md-3">
									<div class="control form-floating">
										<input type="hidden" id="user_id_fk" name="User_id_fk"
											value="<%=user_id%>"> <input type="hidden" id="id"
											name="Id" value="<%=id%>"> <input type="hidden"
											id="id" name="Id" value="<%=dto.getId()%>"> <input
											type="Date" class="form-control" id="in_date" name="In_date"
											value="<%=dto.getIn_date()%>" placeholder="In date" required>
										<label for="in_date">In date</label>
										<div class="invalid-feedback">Please, enter in_date!</div>
									</div>
								</div>
								<div class="col-md-4  d-flex justify-content-center">
									<div class="control form-floating mb-3 col-md-11 col-11">
										<input type="text" class="form-control" id="name" name="Name"
											value="<%=dto.getSpend_name()%>" placeholder="name"
											list="browsers" autocomplete="off"
											onblur="checkSpendAvail();" required>

										<datalist id="browsers">
											<%
											SpendHeadService ser2 = new SpendHeadService();
											ArrayList<SpendHeadDto> list2 = ser2.getActiveSpendHeadInfo(config, request);
											for (SpendHeadDto SpendHead_dto : list2) {
											%>
											<option value="<%=SpendHead_dto.getName()%>" />
											<%
											}
											%>
										</datalist>
										<label for="name">Select Spend Head</label>

										<div class="invalid-feedback">Please, Enter Spend!</div>
									</div>
								</div>

								<div style="padding-top: 5px; width: 3%;" id="spend_parent">
									<%@include file="include/refresh_add.jsp"%>
								</div>
								<input type="hidden" id="head_id_fk" name="Head_id_fk"
									value="<%=dto.getHead_id_fk()%>">

								<!-- Cash Amount Start -->
								<div class="col-md-3" id="cash_block">
									<div class="control form-floating">
										<input type="number" step="0.01" class="form-control"
											onblur="paidAmountEvent()" id="cash_amount"
											name="Cash_amount" placeholder="Cash Amount"
											value="<%=dto.getDebit_cash_amount()%>" required> <label
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
											value="<%=dto.getDebit_online_amount()%>" required> <label
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
											value="<%=dto.getDebit_cash_amount() + dto.getDebit_online_amount()%>"
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
									<!-- Bank Detail start -->
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
														<%if (Bank_dto.getId() == dto.getBank_id_fk()) {%>
														selected="selected" <%}%>><%=Bank_dto.getName()%></option>


													<%
													}
													%>

												</select> <label for="bank_id_fk">Select Bank</label>
											</div>
										</div>
									</div>
									<div style="padding-top: 5px; width: 3%;" id="bank_parent">
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
									value="Cash" /> <input type="hidden" id="type" name="Type"
									value="Spend" />

								<!--  onchange="previewImage(event);" -->
								<div class="d-flex justify-content-center">
									<div class="col-md-3">
										<div class="control form-floating">
											<div class="file-form" style="padding: 2%;">
												<%-- <div class="d-flex justify-content-center">
													<img src="SpendImage/<%=dto.getId()%>.jpg"
														id="preview-selected-image" alt="No Photo"
														style="height: 60px; width: 60px;">
												</div> --%>
												<div class="d-flex justify-content-center">
													<div class="pt-1 pb-1">
														<div style="display: none;">
															<input name="File" type="file" id="file">
														</div>
														<label for="file" id="file-label"> <a
															class="btn btn-primary btn-sm"
															title="Upload new profile image"> <i
																class="bi bi-upload"></i>
														</a>
														</label>
													</div>
													<div class="pt-1 pb-1" style="margin-left: 2px;">
														<a class="btn btn-primary btn-sm" title="download"
															href="SpendImage/<%=dto.getId()%>.jpg" id="download"
															download><i class="fa-solid fa-download"></i> </a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>


								<div class="col-md-12">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Remark"
											id="remark" Name="Remark"><%=dto.getRemark()%></textarea>
										<label for="remark">Remark</label>
									</div>
								</div>

								<input type="hidden" id="id" name="Id" value="<%=dto.getId()%>">

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
		<div id="result_spend"></div>

	</main>
	<!-- End main -->
	<br />
	<br />

	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>
</html>