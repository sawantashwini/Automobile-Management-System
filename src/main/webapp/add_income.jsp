
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


		<!-- ======= Breadcrumbs ======= -->
		<%@include file="breadcrumbs/income.jsp"%>
		<!--  Breadcrumbs End-->

		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Income</h1>
			</div>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-12">

					<div class="card" style="border-radius: 25px;">

						<div class="card-body">
							<br /> <br>

							<!-- Floating Labels Form -->
							<form autocomplete="off" action="IncomeServlet"
								enctype="multipart/form-data" method="post"
								class="row g-3 needs-validation" novalidate>


								<div class="col-md-3">
									<div class="control form-floating">
										<input type="hidden" name="User_id_fk" value="<%=user_id%>">
										<input type="Date" class="form-control" id="in_date"
											name="In_date" placeholder="Date"
											value="<%=current_date%>" required> <label
											for="in_date">Date</label>
										<div class="invalid-feedback">Please, enter Date!</div>
									</div>
								</div>
								<div class="col-md-4  d-flex justify-content-center">

									<div class="control form-floating mb-3 col-md-11 col-11">

										<input type="text" class="form-control" id="name"
											onblur="checkIncomeAvail();" placeholder="name"
											list="browsers" autocomplete="off" required>

										<datalist id="browsers">
											<%
											IncomeHeadService ser2 = new IncomeHeadService();
											ArrayList<IncomeHeadDto> list2 = ser2.getActiveIncomeHeadInfo(config, request);
											for (IncomeHeadDto IncomeHead_dto : list2) {
											%>
											<option value="<%=IncomeHead_dto.getName()%>" />
											<%
											}
											%>
										</datalist>
										<label for="name">Select Income Head</label>

										<div class="invalid-feedback">Please, Enter Income!</div>
									</div>
								</div>

								<div style="padding-top: 5px; width: 3%;" id="income_parent">
									<%@include file="include/refresh_add.jsp"%>
								</div>
								<input type="hidden" id="head_id_fk" name="Head_id_fk">

								<!-- Cash Amount Start -->
								<div class="col-md-3" id="cash_block">
									<div class="control form-floating">
										<input type="number" step="0.01" class="form-control"
											onblur="paidAmountEvent()" id="cash_amount"
											name="Cash_amount" placeholder="Cash Amount" value="0"
											required> <label for="cash_amount">Cash
											Amount</label>
									</div>
								</div>
								<!-- Cash Amount end -->

								<!-- Online Amount Start -->
								<div class="d-none" id="online_amt_block">
									<div class="control form-floating">
										<input type="number" step="0.01" class="form-control"
											onblur="paidAmountEvent()" id="online_amount"
											name="Online_amount" placeholder="Online Amount" value="0"
											required> <label for="online_amount">Online
											Amount</label>
									</div>
								</div>
								<!-- Online Amount end -->

								<!-- Paid Amount Start -->
								<div class="d-none" id="paid_block">
									<div class="control form-floating">
										<input readonly type="number" step="0.01"
											style="background-color: #e7ededad;" class="form-control"
											id="paid_amount" name="Paid_amount" placeholder="Paid Amount"
											value="0" required> <label for="paid_amount">Paid
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

							

										<div class="col-md-2">
										<div id="refresh_bank">
											<div class="control form-floating">
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
									<div style="left: 0; margin-left: 5px; width: 3%;"
										id="bank_parent">
										<%@include file="include/refresh_add.jsp"%>
									</div>



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




									<h6 class="text-center card-title">Payment Details</h6>
									<div class="container d-flex justify-content-center">
										<div class="col-md-2 col-sm-12 d-flex justify-content-around">


											<div class="form-check" style="margin-left: 5px;">
												<input class="form-check-input" type="radio"
													name="Payment_mode1" id="cash_mode" value="Cash"
													onclick="checkPaymentMode();" checked> <label
													class="form-check-label" for="cash_mode"> Cash
												</label>
											</div>
											<div class="form-check" style="margin-left: 5px;">
												<input class="form-check-input" type="radio"
													name="Payment_mode1" id="online_mode" value="Online"
													onclick="checkPaymentMode();"> <label
													class="form-check-label" for="online_mode">
													Online </label>
											</div>

											<div class="form-check" style="margin-left: 5px;">
												<input class="form-check-input" type="radio"
													name="Payment_mode1" id="both_mode" value="Both"
													onclick="checkPaymentMode();"> <label
													class="form-check-label" for="both_mode"> Both
												</label>
											</div>

										</div>
									</div>

									<div class="d-flex justify-content-center">
										<div class="col-md-2">
											<div class="control form-floating">
												<div class="file-form" style="padding: 0.5%;">
													<div class="d-flex justify-content-center pt-1">
														<img src="" id="preview-selected-image"
															onerror="this.src='assets/img/dummy.png'" class="preview"
															alt="" style="height: 80px; width: 80px;">
													</div>
													<div class="d-flex justify-content-center">
														<div class="pt-1 pb-1">
															<div style="display: none;">
																<input name="File" onchange="previewImage(event);"
																	type="file" id="file">
															</div>
															<label for="file" id="file-label"> <a
																class="btn btn-primary btn-sm"
																title="Upload new profile image"> <i
																	class="bi bi-upload"></i>
															</a>
															</label>
														</div>
														<!-- 	 <div class="pt-2" style="margin-left: 2px;">
														<a class="btn btn-primary btn-sm" title="download"
															id="download" download><i
															class="fa-solid fa-download"></i> </a>
													</div>  -->
													</div>
												</div>
											</div>
										</div>
									</div>


									<input type="hidden" id="payment_mode" name="Payment_mode"
										value="Cash" /> <input type="hidden" id="type" name="Type"
										value="Income" />

									<div class="col-md-12">
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
		<div id="result_income"></div>

	</main>
	<!-- End main -->
	<script type="text/javascript" src="js/spend-income.js"></script>
	<script>
		function refreshBank() {

			//alert("Start");
			var flag = 'Bank';

			$.ajax({

				url : 'AjaxDesign/AjaxRefreshAvailItem.jsp',
				data : 'Flag=' + flag,
				type : 'post',
				success : function(msg) {

					//alert(msg);

					$('#bank_id_fk').html(msg);

				}
			});

		}
	</script>
	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>
</html>