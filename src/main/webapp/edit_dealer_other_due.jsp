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
		<div id="result_info"></div>

		<!--  alert massages end-->
		<div class="row justify-content-center">
			<div class="pagetitle col-lg-10 text-center">
				<h1>Edit Other Dealer Due</h1>
			</div>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-10">

					<div class="card" style="border-radius: 25px;">


						<div class="card-body">
							<br /> <br>

							<%
							int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
							DealerOtherService service = new DealerOtherService();
							PurchaseOtherDto dto = service.getDealerDueInfoById(id, config, request);
							%>

							<!-- Floating Labels Form -->
							<form autocomplete="off" action="PayDealerOtherDueServlet" method="post"
								class="row g-3 needs-validation" novalidate>

								<div class="col-sm-3">
									<div class="control form-floating">
										<input type="date" class="form-control" id="pay_date"
											name="Pay_date" placeholder="Pay Date"
											value="<%=dto.getPay_date()%>" required> <label
											for=" Pay_date">In Date</label>
										<div class="invalid-feedback">Please, Enter In Date !</div>
									</div>
								</div>
								<!-- Name -->
								<div class="col-md-3">
									<div class="control form-floating">
										<input type="text" class="form-control" id="name" name="Name"
											placeholder="name" value="<%=dto.getName()%>" required>
										<label for="name">Name</label>
										<div class="invalid-feedback">Please, enter name!</div>
									</div>
								</div>

								<input type="hidden" name="User_id_fk" value="<%=user_id%>">
								<input id="id" type="hidden" name="Id" value="<%=id%>">
								<input type="hidden" id="c_y_session" name="C_y_session"
									value="<%=current_session%>"> <input id="dealer_id_fk"
									type="hidden" name="Dealer_id_fk"
									value="<%=dto.getDealer_id_fk()%>"> <input
									id="online_payment_id_fk" type="hidden"
									name="Online_payment_id_fk"
									value="<%=dto.getOnline_payment_id_fk()%>"> <input
									id="cash_payment_id_fk" type="hidden" name="Cash_payment_id_fk"
									value="<%=dto.getCash_payment_id_fk()%>">
<input  type=hidden 
											id="old_due" name="Old_due"
											value="<%=dto.getOld_due()+(dto.getCash_amount()+dto.getOnline_amount())%>" >
								<%-- <div class="col-sm-3" id="paid_amount_block">
									<div class="control form-floating">
										<input  type=hidden 
											id="old_due" name="Old_due"
											value="<%=dto.getOld_due()%>" > <label
											for="Old_due">Due</label>
									</div>
								</div> --%>

								<!-- Cash Amount Start -->
								<div class="col-md-3" id="cash_block">
									<div class="control form-floating">
										<input type="number" step="0.01" class="form-control"
											onblur="paidAmountEventOther()" id="cash_amount"
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
											onblur="paidAmountEventOther()" id="online_amount"
											name="Online_amount" placeholder="Online Amount"
											value="<%=dto.getOnline_amount()%>" required> <label
											for="online_amount">Online Amount</label>
									</div>
								</div>
								<!-- Online Amount end -->

								<div class="d-none" id="paid_block">
									<div class="control form-floating">
										<input readonly type="number" step="0.01"
											style="background-color: #e7ededad;" class="form-control"
											id="paid_amount" name="Pay_amount" onblur="paidAmountEventOther()"
											placeholder="pay_amount" value="<%=dto.getPay_amount()%>">
										<label for="paid_amount">Paid Amount</label>
									</div>
								</div>
								<!-- Paid Amount end -->
								<input type="hidden" id="current_date" value="<%=current_date%>">
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
												<option value="N/A" Selected='selected'>Select
													Online way</option>

												<option <%if (dto.getOnline_way().equals("Gpay")) {out.print("Selected='selected'"); }%> value="Gpay">Gpay</option>
												<option <%if (dto.getOnline_way().equals("Phonepay")) {out.print("Selected='selected'");}%> value="Phonepay">Phone Pay</option>
												<option <%if (dto.getOnline_way().equals("Paytm")) { out.print("Selected='selected'"); }%> value="Paytm">Paytm</option>
												<option <%if (dto.getOnline_way().equals("Cheque")) {out.print("Selected='selected'"); }%> value="Cheque">Cheque</option>
												<option <%if (dto.getOnline_way().equals("Online")) {out.print("Selected='selected'"); }%> value="Online">Online</option>


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
												value="<%=dto.getOnline_remark()%>" name="Online_remark"
												placeholder="Online Remark"> <label
												for="online_remark">Online Remark</label>
										</div>
									</div>
									<!-- Online Remark End -->

								</div>
								<!-- *** Online Block End *** -->
								<!-- Discount end -->
								<h6 class="text-center mt-1 card-title" style="font-size: 15px;">Payment
									Mode</h6>

								<div class="col-sm-12" style="margin-top: 0px;">
									<div class="d-flex justify-content-around">

										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="Payment_mode1" checked="checked" id="cash_mode"
												<%if ("Cash".equals(dto.getPayment_mode())) { out.print("Checked='checked'"); }%>
												checked="checked" value="Cash" onclick="checkPaymentMode();">
											<label class="form-check-label" for="cash_mode">
												Cash </label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="Payment_mode1" id="online_mode"
												<%if ("Online".equals(dto.getPayment_mode())) {out.print("Checked='checked'");}%>
												value="Online" onclick="checkPaymentMode();"> <label
												class="form-check-label" for="online_mode"> Online
											</label>
										</div>

										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="Payment_mode1" id="both_mode"
												<%if ("Both".equals(dto.getPayment_mode())) {
	out.print("Checked='checked'");
}%>
												value="Both" onclick="checkPaymentMode();"> <label
												class="form-check-label" for="both_mode"> Both </label>
										</div>

									</div>
								</div>

								<input type="hidden" id="payment_mode" name="Payment_mode"
									value="cash" />

								<div class="col-md-12">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Remark"
											id="remark" Name="Remark"><%=dto.getRemark()%></textarea>
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

	<script type="text/javascript" src="js/other_dealer.js"></script>
	
	<script>
	function paidAmountEventOther() {

		let cash_amount = parseFloat(document.getElementById("cash_amount").value);
		let online_amount = parseFloat(document.getElementById("online_amount").value);
		let old_due = parseFloat(document.getElementById("old_due").value);
		paid_amount = cash_amount + online_amount;
		
		if(paid_amount>old_due){
			alert("Amount is greater than due.");
			document.getElementById("cash_amount").value = 0.0; 
			document.getElementById("online_amount").value=  0.0; 
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
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			loadPaymentMode();
		});
	</script>


</body>
</html>