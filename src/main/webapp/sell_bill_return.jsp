
<!-- ======= Head ======= -->
<%@include file="include/head.jsp"%>
<!-- ======= Head end======= -->


<script src="js/sellreturn.js" type="text/javascript"></script>


</head>

<body>



	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->


	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->




	<div id="result_info"></div>

	<main id="main" class="main">
		<!-- ======= Breadcrumbs ======= -->
		<%@include file="breadcrumbs/sellreturn.jsp"%>
		<!--  Breadcrumbs End-->



		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Sell Return</h1>
			</div>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-12">

					<div class="card">


						<div class="card-body" style="padding-top: 15px;">

							<!-- Floating Labels Form -->
							<form autocomplete="off" action="SaleBillReturnServlet"
								method="post" class="row g-3 needs-validation" novalidate>

								<div class="col-lg-2 col-md-2 col-6">
									<div class="control form-floating">
										<input type="Date" class="form-control" id="bill_date"
											name="Bill_date" placeholder="bill_date"
											value="<%=current_date%>" required> <label
											for="bill_date">Date</label>
										<div class="invalid-feedback">Please, enter bill_date!</div>
									</div>
								</div>

								<%
								SaleBillReturnService sell_ser = new SaleBillReturnService();
								String invoice = sell_ser.getMaxInvoiceNo(current_date, request, config);

								int max_invoice_id = 1;

								if (invoice != null) {
									max_invoice_id = Integer.parseInt(invoice);
									max_invoice_id = max_invoice_id + 1;
								}
								%>

								<div class="col-lg-2 col-md-2 col-6">
									<div class="control form-floating">

										<input type="text" class="form-control" id="invoice_no"
											name="Invoice_no" placeholder="invoice_no"
											value="<%=max_invoice_id%>"><label for="invoice_no">Invoice
											No.</label>
										<div class="invalid-feedback">Please, enter invoice_no!</div>
									</div>
								</div>

								<div class="col-lg-3 col-md-4 col-6">
									<div class="row d-flex justify-content-center">

										<div class="form-check col-4 mt-2" style="margin-left: 5px;">
											<input class="form-check-input" type="checkbox"
												id="igst_status" name="Igst_status" value="Yes"
												onclick="findIgstChecked();"> <label
												class="form-check-label" for="igst_status"
												style="font-size: 13px;"> IGST </label>
										</div>
										<div class="form-check col-4 mt-2">

											<input class="form-check-input" type="checkbox"
												id="gst_status" name="Gst_status" value="Yes"> <label
												class="form-check-label" for="gst_status"
												style="font-size: 13px;"> GST</label>
										</div>



									</div>

								</div>

								<div class="col-md-4 col-6" style="margin-left: 25px;">

									<div
										class="control form-floating d-flex justify-content-center">

										<input type="text" class="form-control" list="datalist_name"
											id="search_name" placeholder="Name"
											onblur="findCustInfoByName(this.value);" autocomplete="off" />
										<input type="hidden" value="0">
										<datalist id="datalist_name">

											<%
											CustomerService service1 = new CustomerService();
											ArrayList<CustomerDto> list3 = service1.getCustomerInfo(config, request);
											for (CustomerDto dto_path : list3) {
											%>
											<option value="<%=dto_path.getName()%>" />
											<%
											}
											%>
										</datalist>
										<label for="search_name">Search By Name</label>

										<div style="width: 30px; margin-left: 8px;">
											<div class="mt-2" title="Reset customer information">
												<i class="fa fa-refresh main-color lock-refresh"
													onclick="removeCustDet();"></i>
											</div>

										</div>

									</div>



								</div>
								<!-- Name -->


								<div class="col-md-3">
									<div class="control form-floating">
										<input required type="text" class="form-control" id="name"
											name="Name" placeholder="name" required> <label
											for="name">Name</label>
										<div class="invalid-feedback">Please, enter name!</div>
									</div>
								</div>

								<input type="hidden" id="customer_id_fk" name="Customer_id_fk"
									value="0"> <input type="hidden" id="id" value="0">


								<div class="col-md-3">
									<div class="control form-floating">
										<input type="number" class="form-control" id="mobile_no"
											name="Mobile_no" placeholder="mobile" required> <label
											for="mobile">Mobile No.</label>
										<div class="invalid-feedback">Please, enter mobile no!</div>
									</div>
								</div>


								<div class="col-md-3">
									<div class="control form-floating">
										<input required type="text" class="form-control" id="address"
											name="Address" placeholder=" address"> <label
											for="address">Address</label>
									</div>
								</div>


								<div class="col-md-3">
									<div class="control form-floating">
										<input required type="text" class="form-control" id="gst_no"
											name="Gst_no" placeholder=" Gst_no"> <label
											for="gst_no">Gst no</label>
									</div>
								</div>



								<input type="hidden" class="form-control" id="c_y_session"
									name="C_y_session" value="<%=current_session%>">


								<h5 class="text-center card-title form-heading">Add Item</h5>

								<div class="table-responsive mt-0" id="table_design">
									<table class="table">
										<thead class="text-center" id="thead">
											<tr>
												<th>Code</th>
												<th>Name</th>
												<th>GST%</th>
												<th>Gst Price</th>
												<th>Base Price</th>
												<th>Dis%</th>
												<!-- <th>Dis. Amt</th> -->
												<th>Dis. Price</th>
												<th>Quantity</th>
												<!-- <th>Total Amt
											</th> -->
												<th style="width: 5%;">Add</th>

											</tr>
										</thead>

										<tbody class="text-center" id="tbody">
											<tr>
												<td>
													<div class="col-md-12 refresh-container"
														data-add="add_item.jsp" data-list="item">
														<div class="control form-floating refresh-input">
															<input type="text" class="form-control" id="item_code"
																 placeholder="Item Code"> <input
																type="hidden" id="item_id" value="0" /> <label
																for="Item Code">Item Code</label>

														</div>
													</div> <%-- <div class="d-flex">
														<div class="refresh_button" title="Refresh Items">
															<div class="refresh_add" id="item_parent">
																<%@include file="include/refresh_add.jsp"%>

															</div>

														</div>
														<div class="form">

															<input type="text" class="form-control" list="browsers1"
																id="item_code" autocomplete="off"
																onblur="checkItemAvail(this.value);" />
															<datalist id="browsers1">

																<%
																ItemService ser = new ItemService();
																ArrayList<ItemDto> list = ser.getAvailItemInfo(config, request);
																for (ItemDto dto : list) {
																%>
																<option value="<%=dto.getItem_code()%>" />
																<%
																}
																%>
															</datalist>
														</div>
													</div> --%>
												</td>

												<td>

													<div class="form">
														<input type="text" class="form-control" id="item_name"
															disabled value="" value="0" />

														<div id="rev"></div>
														<input type="hidden" id="cat_id"> <input type="hidden"
															id="measure_id"> <input type="hidden"
															id="cat_name"> <input type="hidden"
															id="measure_name"> <input type="hidden"
															id="sell_item_status"> <input type="hidden"
															id="hsn_code">

													</div>

												</td>

												<td>
													<div class="form">

														<input type="number" class="form-control" id="gst_per"
															disabled value="0" step=0.01 />
													</div>
												</td>

												<td>

													<div class="form">

														<input type="number" class="form-control"
															id="item_price_with_gst" onblur="findBasePrice()"
															step=0.01 disabled />
													</div>

												</td>

												<td>

													<div class="form">

														<input type="number" class="form-control"
															id="sell_base_price" onblur="findGstPrice()" step=0.01 />
													</div>

												</td>


												<td>
													<div class="form">
														<input type="number" class="form-control" id="dis_per"
															value="0" onblur="findDiscountAmtRow();" step=0.01 /> <input
															type="hidden" id="dis_amt" step=0.01 />
													</div>
												</td>

												<!-- <td>
													<div class="form">

														<input type="number" class="form-control" id="dis_amt" value="0"
															onblur="findDiscountPerRow();" step=0.01/>
													</div>


												</td> -->

												<td>
													<div class="form">
														<input type="number" class="form-control"
															id="item_price_with_dis"
															onblur="findDiscountPerAmtRow();" step=0.01 />
													</div>
												</td>

												<td>
													<div class="form">
														<input type="number" class="form-control" id="qty"
															onblur="findTotalRowAmount();" step=0.01 value="1" /> <input
															type="hidden" id="tot_amt" step=0.01 />
													</div>
												</td>

												<!-- <td>
													<div class="form">
														<input type="number" class="form-control" id="tot_amt" readonly
															 step=0.01/>
													</div>
												</td> -->
												<td class="text-center">
													<div class="control col-12">
														<input type="button" onfocus="autoFocus()"
															class="form-control add-icon">
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>

								<h5 class="text-center card-title mt-0 form-heading">Item
									Details</h5>

								<div class="table-responsive mt-0">
									<table class="table">
										<thead class="text-center" id="thead">
											<tr>
												<th>Code</th>
												<th>Name</th>
												<th>GST%</th>
												<th>Gst Price</th>
												<th>Base Price</th>
												<th>Dis%</th>
												<th>Dis. Amt</th>
												<th>Dis. Price</th>
												<th>Quantity</th>
												<th>Total Amt</th>
												<th>Delete</th>

											</tr>
										</thead>
										<tbody id="tableScroll" class="text-center">

										</tbody>
									</table>
								</div>


								<div class="col-md-2 col-6" id="paid_amount_block">
									<div class="control form-floating">
										<input readonly type="text" class="form-control"
											id="total_basic_amt" name="Total_basic_amt"
											placeholder="total_basic_amt" value="0" required step=0.01>
										<label for="total_basic_amt">Total amount</label>
									</div>
								</div>

								<!-- Total Fees end -->


								<div class="col-md-2 col-6" id="cgst_block">
									<div class="control form-floating">
										<input readonly type="text" class="form-control" id="cgst"
											name="Cgst" placeholder="cgst" value="0" required step=0.01>
										<label for="cgst">CGST</label>

									</div>
								</div>

								<input type="hidden" id="taxable_value_0" name="Taxable_value_0"
									value="0"> <input type="hidden" id="gst_amount_5"
									name="Gst_amount_5" value="0"><input type="hidden"
									id="taxable_value_5" name="Taxable_value_5" value="0">

								<input type="hidden" id="gst_amount_12" name="Gst_amount_12"
									value="0"> <input type="hidden" id="taxable_value_12"
									name="Taxable_value_12" value="0"> <input type="hidden"
									id="gst_amount_18" name="Gst_amount_18" value="0"> <input
									type="hidden" id="taxable_value_18" name="Taxable_value_18"
									value="0"> <input type="hidden" id="gst_amount_28"
									name="Gst_amount_28" value="0"> <input type="hidden"
									id="taxable_value_28" name="Taxable_value_28" value="0">

								<input type="hidden" id="total_gst_amt" name="Total_gst_amt"
									value="0">


								<!-- sgst Start -->
								<div class="col-md-2 col-6" id="sgst_block">
									<div class="control form-floating">
										<input readonly type="text" class="form-control" id="sgst"
											name="Sgst" placeholder="sgst" value="0" required step=0.01>
										<label for="sgst">SGST</label>
									</div>
								</div>
								<!-- sgst end -->


								<!-- Igst Start -->
								<div class="d-none" id="igst_block">
									<div class="control form-floating">
										<input readonly type="text" class="form-control" id="igst"
											name="Igst" placeholder="igst" value="0" step=0.01> <label
											for="sgst">IGST</label>
									</div>
								</div>
								<!-- Igst end -->



								<div class="col-md-2 col-6" id="paid_amount_block">
									<div class="control form-floating">
										<input readonly type="text" class="form-control"
											id="total_amt_with_gst" name="Total_amt_with_gst"
											placeholder="total_amt_with_gst" value="0" step=0.01>
										<label for="total_amount_with_gst">Total price with
											GST</label>
									</div>
								</div>
								<!-- Discount Start -->

								<div class="col-md-2 col-6" id="paid_amount_block">
									<div class="control form-floating">
										<input type="text" class="form-control" id="discount_per"
											name="Discount_per" placeholder="Discount_per" value="0"
											onblur="findDiscountAmt();" required> <label
											for="discount_per">Discount%</label>
									</div>
								</div>
								<div class="col-md-2 col-6" id="paid_amount_block">
									<div class="control form-floating">
										<input type="text" class="form-control" id="discount_amount"
											name="Discount_amount" placeholder="discount_amount"
											onblur="findDiscountPer();" value="0" step=0.01> <label
											for="discount_amt">Discount amt</label>
									</div>
								</div>
								<!-- Discount end -->


								<!-- Paid Amount Start -->
								<div class="col-md-2 col-6">
									<div class="control form-floating">
										<input type="text" style="background-color: #e7ededad;"
											class="form-control" id="final_amount" name="Final_amount"
											placeholder="Final Amount" value="0"
											onblur="findDiscountPerAmt();" step=0.01> <label
											for="final_amount">Final Amount</label>
									</div>
								</div>
								<!-- Paid Amount end -->


								<!-- Cash Amount Start -->
								<div class="col-md-2 col-6" id="cash_block">
									<div class="control form-floating">
										<input type="text" class="form-control"
											onblur="paidAmountEvent();findRemainingAmount();"
											id="cash_amount" name="Cash_amount" placeholder="Cash Amount"
											value="0" step=0.01> <label for="cash_amount">Cash
											Amount</label>
									</div>
								</div>
								<!-- Cash Amount end -->

								<!-- Online Amount Start -->
								<div class="d-none" id="online_amt_block">
									<div class="control form-floating">
										<input type="text" class="form-control"
											onblur="paidAmountEvent();findRemainingAmount();"
											id="online_amount" name="Online_amount"
											placeholder="Online Amount" value="0" step=0.01> <label
											for="online_amount">Online Amount</label>
									</div>
								</div>
								<!-- Online Amount end -->

								<!-- Paid Amount Start -->
								<div class="d-none" id="paid_block">
									<div class="control form-floating">
										<input readonly type="text"
											style="background-color: #e7ededad;" class="form-control"
											id="paid_amount" name="Paid_amount" placeholder="Paid Amount"
											value="0" step=0.01> <label for="paid_amount">Paid
											Amount</label>
									</div>
								</div>
								<!-- Paid Amount end -->

								<!-- Remaining Amount Start -->
								<div class="col-md-2 col-6" id="remaining_block">
									<div class="control form-floating">
										<input readonly type="text"
											style="background-color: #e7ededad;" class="form-control"
											id="remaining_amount" placeholder="Remaining Amount"
											value="0" step=0.01> <label for="remaining_amount">Remaining
											Amount</label>
									</div>
								</div>
								<!-- Remaining Amount end -->

								<div class="d-none" id="online_block">

									<!-- Online Date Start-->
									<div class="col-md-3 col-6">
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
									<div class="col-md-3 col-6">
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
									<div class="col-md-3 refresh-container mb-3"
										data-add="add_bank.jsp" data-list="bank">
										<div class="control form-floating refresh-input">
											<input type="text" class="form-control" id="bank_name"
												placeholder="Select Bank Name"> <input type="hidden"
												id="bank_id_fk" name="Bank_id_fk" value="0" /> <label
												for="bank_name">Select Bank Name</label>
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

													<option value="<%=Bank_dto.getId()%>"><%=Bank_dto.getName()%></option>


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
									<div class="col-md-3 col-6">
										<div class="control form-floating">
											<input class="form-control" id="online_remark"
												name="Online_remark" placeholder="Online Remark"> <label
												for="online_remark">Online Remark</label>
										</div>
									</div>
									<!-- Online Remark End -->

								</div>
								<!-- *** Online Block End *** -->


								<h5 class="text-center card-title form-heading">Payment
									Details</h5>
								<div class="container d-flex justify-content-center">
									<div class="col-md-3">
										<div class="d-flex justify-content-around">

											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="Payment_mode1" id="cash_mode" value="Cash"
													onclick="checkPaymentMode1();" checked> <label
													class="form-check-label" for="cash_mode"> Cash </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="Payment_mode1" id="online_mode" value="Online"
													onclick="checkPaymentMode1();"> <label
													class="form-check-label" for="online_mode"> Online
												</label>
											</div>

											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="Payment_mode1" id="both_mode" value="Both"
													onclick="checkPaymentMode1();"> <label
													class="form-check-label" for="both_mode"> Both </label>
											</div>

										</div>
									</div>
								</div>


								<input type="hidden" id="payment_mode" name="Payment_mode"
									value="Cash" />



								<div class="col-md-12">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Remark"
											id="remark" Name="Remark"></textarea>
										<label for="remark">Remark</label>
									</div>
								</div>


								<input type="hidden" id="user_id_fk" name="User_id_fk"
									value="<%=user_id%>">


								<div class="text-center">
									<button type="submit" onclick="checkform()" class="submit-btn">Submit</button>
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
	<script>
		$("#item_code").on(
				'change',
				function() {

					var dataListID = $(this).attr('list');

					var selectedOption = $("#" + dataListID + " option[value='"
							+ this.value + "']");
					var dataId = selectedOption.data('id');
					if (typeof dataId === 'undefined') {
						$("#cat_id").val('0');
						$("#cat_name").val('0');
						$("#measure_id").val('0');
						$("#measure_name").val('0');
						$("#item_name").val('0');
						$("#gst_per").val('0');
						$("#sell_base_price").val('0');
						$("#hsn_code").val('0');
						$("#sell_item_status").val('0');

						return;
					}
					var category = selectedOption.data('category');
					var cat_name = selectedOption.data('cat_name');
					var measure = selectedOption.data('measure');
					var measure_name = selectedOption.data('measure_name');
					var item_name = selectedOption.data('item_name');
					var gst_per = selectedOption.data('gst_per');
					var sell_base_price = selectedOption
							.data('sell_base_price');
					var hsn_code = selectedOption.data('hsn_code');
					var sell_item_status = selectedOption
							.data('sell_item_status');

					$("#cat_id").val(category);
					$("#cat_name").val(cat_name);
					$("#measure_id").val(measure);
					$("#measure_name").val(measure_name);
					$("#item_name").val(item_name);
					$("#gst_per").val(gst_per);
					$("#sell_base_price").val(sell_base_price);
					$("#hsn_code").val(hsn_code);
					$("#sell_item_status").val(sell_item_status);
					document.getElementById("dis_per").focus();
					findDuplicateCode();
					findGstPrice();

				});
	</script>



	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>
</html>