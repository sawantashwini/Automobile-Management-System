
<!-- ======= Head ======= -->
<%@include file="include/head.jsp"%>
<!-- ======= Head end======= -->

<script src="js/purchase.js" type="text/javascript"></script>



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
		<%@include file="breadcrumbs/purchase.jsp"%>
		<!--  Breadcrumbs End-->

		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Purchase</h1>
			</div>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-12">

					<div class="card" style="border-radius: 20px;">


						<div class="card-body">
							<br /> <br>

							<!-- Floating Labels Form -->
							<form autocomplete="off" action="PurchaseBillServlet"
								method="post" name="frmMr" class="row g-3 needs-validation"
								novalidate>


								<div class="col-lg-2 col-md-2 col-6">
									<div class="control form-floating">
										<input type="hidden" name="User_id_fk" value="<%=user_id%>">
										<input type="Date" class="form-control" id="in_date"
											name="Bill_date" placeholder="bill_date"
											value="<%=current_date%>" required> <label
											for="bill_date">Date</label>
										<div class="invalid-feedback">Please, enter bill_date!</div>
									</div>
								</div>

								<%-- <%
									PurchaseBillService sell_ser = new PurchaseBillService();
									String invoice= sell_ser.getMaxInvoiceNo(current_date, request, config); 					
									
									int max_invoice_id = 1;
									
									if(invoice!=null)
									{
										max_invoice_id = Integer.parseInt(invoice);
										max_invoice_id = max_invoice_id + 1;
									}
					
									%>
 --%>
								<div class="col-lg-2 col-md-2 col-6">
									<div class="control form-floating">

										<input type="text" class="form-control" id="invoice_no"
											value="" name="Invoice_no" placeholder="invoice_no">
										<label for="invoice_no">Invoice No.</label>
									</div>
								</div>
	<div class="col-md-4 refresh-container mb-3"
									data-add="add_dealer.jsp" data-list="dealer">
									<div class="control form-floating refresh-input">
										<input type="text" class="form-control" id="dealer_name"
											placeholder="Select Category"> <input type="hidden"
											id="dealer_id_fk" name="Dealer_id_fk" value="0" /> <label
											for="dealer_name">Select Dealer</label>
										<div class="invalid-feedback">Please, Select Dealer!</div>
									</div>
								</div>
								<%-- <div class="col-md-4  d-flex justify-content-center">


									<div class="control form-floating mb-3 col-md-11 col-11">


										<input type="text" class="form-control" list="datalist_name"
											id="name" placeholder="Name"
											onblur="findDealerInfoByName(this.value);" autocomplete="off"
											required /> <input type="hidden" id="dealer_id_fk"
											name="Dealer_id_fk" value="0">

										<datalist id="datalist_name">

											<%
											DealerService service1 = new DealerService();
											ArrayList<DealerDto> list3 = service1.getDealerInfo(config, request);
											for (DealerDto dto_path : list3) {
											%>
											<option value="<%=dto_path.getName()%>" />
											<%
											}
											%>
										</datalist>
										<label for="search_name">Dealer Name</label>


									</div>

									<div class="refresh_add" id="dealer_parent">
										<%@include file="include/refresh_add.jsp"%>
									</div>

								</div>
 --%>
								<input type="hidden" class="form-control" id="c_y_session"
									name="C_y_session" value="<%=c_y_session%>">


								<div class="col-lg-2 col-md-2 col-3">

									<div class="form-check">
										<input class="form-check-input" type="checkbox"
											id="igst_status" name="Igst_status" value="Yes"
											onclick="findIgstChecked();" style="margin-top: 15px;">
										<label class="form-check-label" for="photo"
											style="font-size: 15px; margin-top: 12px;"> IGST </label>
									</div>


								</div>


								<h5 class="text-center card-title form-heading">Add item</h5>

								<div class="table-responsive mt-0">
									<table class="table">
										<thead class="text-center" id="thead">
											<tr>
												<th>Code</th>
												<th>Name</th>
												<th>GST%</th>

												<th>Base Price</th>
												<th>Dis%</th>
												<!-- <th>Dis. Amt</th> -->
												<th>Dis. Price</th>
												<th>Qty</th>
												<!-- <th>Amount</th> -->
												<th style="width: 5%;">Add</th>

											</tr>
										</thead>
										<tbody class="text-center" id="tbody">
											<tr>
												<td>
													<div class="col-md-12 refresh-container"
														data-add="add_item.jsp" data-list="pur_item">
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
															ArrayList<ItemDto> list = ser.getItemInfo(config, request);
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
															disabled value="" />

														<div id="rev"></div>
														<input type="hidden" id="item_id"> <input
															type="hidden" id="cat_id"> <input type="hidden"
															id="measure_id"> <input type="hidden"
															id="cat_name"> <input type="hidden"
															id="measure_name"> <input type="hidden"
															id="pur_item_status"> <input type="hidden"
															id="hsn_code">

													</div>
												</td>

												<td>
													<div class="form">

														<input type="number" step="0.01" class="form-control"
															id="gst_per" disabled value="" />
													</div>
												</td>

												<td>

													<div class="form">

														<input type="number" step="0.01" class="form-control"
															id="pur_base_price" onblur="setbasicToGStPrice();" />
													</div>

												</td>
												<td>
													<div class="form">

														<input type="number" step="0.01" class="form-control"
															id="dis_per" onblur="setItemDisPer();" value="0" /> <input
															type="hidden" id="dis_amt" step=0.01 />
													</div>
												</td>

												<!-- <td>
													<div class="form">

														<input type="number" step="0.01" class="form-control" id="dis_amt"
															onblur="setItemDisAmt()" value="0" />
													</div>
												</td> -->

												<td>
													<div class="form">

														<input type="number" step="0.01" class="form-control"
															id="pur_discount_price" onblur="setDisPurPrice();" />
													</div>


												</td>
												<td>

													<div class="form">
														<input type="number" step="0.01" class="form-control"
															id="qty" onblur="findTotalRowDiscount();" value="1" /> <input
															type="hidden" id="tot_amt" step=0.01 /> <input
															type="hidden" id="gstamt_with_qty" value="0" step=0.01 />
													</div>


												</td>

												<!-- <td>
													<div class="form">

														<input type="number" step="0.01" class="form-control" id="tot_amt"
															readonly /> <input
															type="hidden" id="gstamt_with_qty" value="0" />

													</div>


												</td> -->
												<td class="text-center">
													<div class="control col-12">
														<input type="button" id="auto_focus_button"
															class="form-control add-icon">
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<script type="text/javascript">
									var myButton = document
											.getElementById("auto_focus_button");

									myButton.addEventListener("click",
											autoFocus);
									myButton
											.addEventListener("blur", autoFocus);
								</script>

								<h5 class="text-center card-title mt-0 form-heading">Item
									Details</h5>


								<div class="table-responsive mt-0">
									<table class="table">
										<thead class="text-center" id="thead">
											<tr>
												<th>Code</th>
												<th>Name</th>
												<th>GST%</th>

												<th>Base Price</th>
												<th>Dis%</th>
												<th>Dis. Amt</th>
												<th>Dis. Price</th>
												<th>Qty</th>
												<th>Amount</th>
												<th>Delete</th>

											</tr>
										</thead>
										<tbody id="tableScroll" class="text-center" id="tbody">

										</tbody>
									</table>
								</div>


								<div class="col-sm-3" id="paid_amount_block">
									<div class="control form-floating">
										<input readonly type="text" class="form-control"
											id="total_basic_amount" name="Total_basic_amount"
											placeholder="total_basic_amount" onblur="findTotal();"
											value="0" step=0.01> <label for="total_fees">Total
											amount</label>
									</div>
								</div>

								<!-- Total Fees end -->

								<div class="col-md-3" id="cgst_block">
									<div class="control form-floating">
										<input readonly type="text" class="form-control" id="cgst"
											name="Cgst" placeholder="cgst" value="0" readonly="readonly"
											step=0.01> <label for="cgst">CGST</label>

									</div>
								</div>


								<input type="hidden" class="form-control" id="taxable_value_0"
									name="taxable_value_0" placeholder="taxable_value_0" value="0">


								<input type="hidden" class="form-control" id="gst_amount_5"
									name="Gst_amount_5" placeholder="gst_amount_5" value="0">


								<input type="hidden" class="form-control" id="taxable_value_5"
									name="Taxable_value_5" placeholder="taxable_value_5" value="0">


								<input type="hidden" class="form-control" id="gst_amount_12"
									name="Gst_amount_12" placeholder="taxable_value_0" value="0">


								<input type="hidden" class="form-control" id="taxable_value_12"
									name="Taxable_value_12" placeholder="taxable_value_12"
									value="0"> <input type="hidden" class="form-control"
									id="gst_amount_18" name="Gst_amount_18"
									placeholder="gst_amount_18" value="0"> <input
									type="hidden" class="form-control" id="taxable_value_18"
									name="Taxable_value_18" placeholder="taxable_value_18"
									value="0"> <input type="hidden" class="form-control"
									id="gst_amount_28" name="Gst_amount_28"
									placeholder="gst_amount_28" value="0"> <input
									type="hidden" class="form-control" id="taxable_value_28"
									name="Taxable_value_28" placeholder="taxable_value_28"
									value="0">





								<!-- sgst Start -->
								<div class="col-sm-3" id="sgst_block">
									<div class="control form-floating">
										<input readonly type="text" class="form-control" id="sgst"
											name="Sgst" placeholder="sgst" value="0" readonly="readonly"
											step=0.01> <label for="sgst">SGST</label>
									</div>
								</div>
								<!-- sgst end -->


								<!-- Igst Start -->
								<div class="d-none" id="igst_block">
									<div class="control form-floating">
										<input readonly type="text" class="form-control" id="igst"
											name="Igst" placeholder="igst" value="0" readonly="readonly"
											step=0.01> <label for="sgst">IGST</label>
									</div>
								</div>
								<!-- Igst end -->

								<input type="hidden" id="total_gst_amount"
									name="Total_gst_amount" value="0" step="0.01">


								<!-- Discount Start -->
								<div class="col-sm-3" id="paid_amount_block">
									<div class="control form-floating">
										<input readonly type="text" class="form-control"
											id="total_amt_with_gst" name="Total_amount_with_gst"
											placeholder="total_amount_with_gst" value="0"
											readonly="readonly" step=0.01> <label
											for="total_amount_with_gst">Total price with GST%</label>
									</div>
								</div>



								<div class="col-md-12">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Remark"
											id="remark" Name="Remark">N/A</textarea>
										<label for="remark">Remark</label>
									</div>
								</div>


								<div class="text-center">
									<button type="submit" onclick="checkform();" class="submit-btn">Submit</button>


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
						$("#pur_base_price").val('0');
						$("#hsn_code").val('0');
						$("#pur_item_status").val('0');

						return;
					}
					var category = selectedOption.data('category');
					var cat_name = selectedOption.data('cat_name');
					var measure = selectedOption.data('measure');
					var measure_name = selectedOption.data('measure_name');
					var item_name = selectedOption.data('item_name');
					var gst_per = selectedOption.data('gst_per');
					var pur_base_price = selectedOption.data('pur_base_price');
					var hsn_code = selectedOption.data('hsn_code');
					var pur_item_status = selectedOption
							.data('pur_item_status');

					$("#cat_id").val(category);
					$("#cat_name").val(cat_name);
					$("#measure_id").val(measure);
					$("#measure_name").val(measure_name);
					$("#item_name").val(item_name);
					$("#gst_per").val(gst_per);
					$("#pur_base_price").val(pur_base_price);
					$("#hsn_code").val(hsn_code);
					$("#pur_item_status").val(pur_item_status);
					document.getElementById("dis_per").focus();
					findDuplicateCode();

				});
	</script>

	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>
</html>