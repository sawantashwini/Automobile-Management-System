
<%@page import="com.dto.ServiceBillDto"%>
<%@page import="com.service.ServiceBillService"%>
<%@page import="com.dto.ServiceBillItemDto"%>
<%@page import="com.service.ItemService"%>
<%@page import="com.dto.BankDto"%>
<%@page import="com.service.BankService"%>
<%@page import="com.service.JobCardService"%>
<%@page import="com.dto.JobCardDto"%>
<%@page import="com.dto.ItemDto"%>
<%@page import="java.util.ArrayList"%>

<!-- head -->
<%@include file="include/head.jsp"%>
<!-- head end -->

</head>

<body onload="findTotal(); loadpaymentEvent(); checkBilling();">



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
				<h1>Service Bill</h1>
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
							ServiceBillService service = new ServiceBillService();
							ServiceBillDto dto = service.getServiceBillInfoById(id, config, request);
							%>

							<!-- Floating Labels Form -->
							<form autocomplete="off" method="post"
								class="row g-3 needs-validation" novalidate>

								<!-- Current bill date start -->
								<div class="col-md-3">
									<div class="control form-floating">
										<input type="Date" class="form-control" id="bill_date"
											name="Bill_date" placeholder="bill_date"
											value="<%=dto.getBill_date()%>" required> <label
											for="bill_date">Date</label>
										<div class="invalid-feedback">Please, enter bill_date!</div>
									</div>
								</div>
								<!-- Current bill date End -->

								<%
								ServiceBillService sell_ser = new ServiceBillService();
								String invoice = sell_ser.getMaxInvoiceNo(current_date, request, config);

								int max_invoice_id = 1;

								if (invoice != null) {
									max_invoice_id = Integer.parseInt(invoice);
									max_invoice_id = max_invoice_id + 1;
								}
								%>

								<!-- Invoice No. start -->
								<div class="col-md-2">
									<div class="control form-floating">

										<input type="text" class="form-control" id="invoice_no"
											name="Invoice_no" placeholder="invoice_no"
											value="<%=dto.getInvoice_no()%>"><label
											for="invoice_no">Invoice No.</label>
										<div class="invalid-feedback">Please, enter invoice_no!</div>
									</div>
								</div>
								<!-- Invoice No. End -->

								<!-- GST or Reguler Start -->
								<div class="col-md-1 justify-content-around">
									<div class="d-flex-row">


										<div class="form-check ">
											<input class="form-check-input" type="checkbox"
												<%if (dto.getIgst_status().equalsIgnoreCase("Yes")) {%>
												checked="checked" <%}%> id="igst_status" name="Igst_status"
												value="Yes" onclick="findIgstChecked();"> <label
												class="form-check-label" for="igst_status"
												style="font-size: 13px;"> IGST </label>
										</div>

										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												<%if (dto.getGst_status().equalsIgnoreCase("Yes")) {%>
												checked="checked" <%}%> id="gst_status" name="Gst_status"
												value="Yes"> <label class="form-check-label"
												for="gst_status" style="font-size: 13px;"> GST</label>
										</div>

									</div>

								</div>
								<!-- GST or Reguler End -->



								<!-- Customer name Start -->
								<div class="col-md-3">
									<div class="control form-floating">
										<input type="text" class="form-control" id="customer_name"
											name="Customer_name" placeholder="customer_name"
											value="<%=dto.getCustomer_name()%>" required> <label
											for="customer_name">Customer Name</label>
										<div class="invalid-feedback">Please, enter
											customer_name!</div>
									</div>
								</div>
								<!-- Customer name End -->

								<!-- Customer mobile no. Start -->
								<div class="col-md-3">
									<div class="control form-floating">
										<input type="number" class="form-control"
											id="customer_mobile_no" name="Customer_mobile_no"
											placeholder="customer_mobile_no"
											value="<%=dto.getCustomer_mobile_no()%>" required> <label
											for="customer_mobile_no">Customer Mobile No.</label>
										<div class="invalid-feedback">Please, enter
											customer_mobile_no!</div>
									</div>
								</div>
								<!-- Customer mobile no. End -->

								<!-- Customer address Start -->
								<div class="col-md-12">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="customer_address"
											id="customer_address" Name="Customer_address" required
											style="height: 70px"><%=dto.getCustomer_address()%></textarea>
										<label for="address"> Customer Address</label>
										<div class="invalid-feedback">Please, Enter Customer
											Address!</div>
									</div>
								</div>
								<!-- Customer address End -->

								<!-- Model Name Start -->
								<div class="col-sm-4">
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
								<div class="col-sm-4">
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
								<div class="col-sm-4">
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

								<!-- Service Type Start -->
								<div class="col-sm-4">
									<div class="control form-floating">
										<input readonly type="text" class="form-control" id="type"
											name="Type" placeholder="Type " value="<%=dto.getType()%>"
											required> <label for="type">Service Type</label>
										<div class="invalid-feedback">Please, select Service
											Type!</div>
									</div>
								</div>
								<!-- Service Type End -->
								<!-- Service Type End -->


								<input type="hidden" class="form-control" id="c_y_session"
									name="C_y_session" value="<%=current_session%>">


								<hr style="color: black;">

								<h5 class="text-center card-title" style="margin-top: -2%;">Vehicles
									Item Details</h5>

								<div class="table-responsive">
									<table class="table">
										<thead class="text-center" id="thead">
											<tr>
												<th style="width: 10%">Code</th>
												<th>Name</th>
												<th>GST%</th>
												<th>Gst Price</th>
												<th>Base Price</th>
												<th>Dis%</th>
												<th>Dis. Amt</th>
												<th>Dis. Price</th>
												<th>Quantity</th>
												<th>Warranty</th>
												<th>Date</th>
												<th>Total Amt</th>
												<th style="width: 5%;">Add</th>
											</tr>
										</thead>
										<tbody class="text-center" id="tbody">
											<tr>
												<td>
												<div class="col-md-12 refresh-container" data-add="add_item.jsp" data-list="item">								
									<div class="control form-floating refresh-input">
										<input type="text" class="form-control" id="item_code"  placeholder="Item Code" >
										<input type="hidden" id="item_id"  value="0"/>
										<!-- <label for="Item Code">Item Code</label> -->
										
									</div>			
								</div>
													<%-- <div class="d-flex">
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
																for (ItemDto item_dto : list) {
																%>
																<option value="<%=item_dto.getItem_code()%>" />
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
															value="" value="0" />

														<div id="rev"></div>
														<input type="hidden" id="item_id"> <input
															type="hidden" id="cat_id"> <input type="hidden"
															id="measure_id"> <input type="hidden"
															id="cat_name"> <input type="hidden"
															id="measure_name"> <input type="hidden"
															id="sell_item_status"> <input type="hidden"
															id="hsn_code">

													</div>

												</td>

												<td>
													<div class="form">

														<input type="text" class="form-control" id="gst_per"
															value="" value="0" />
													</div>
												</td>

												<td>

													<div class="form">

														<input type="text" class="form-control"
															id="item_price_with_gst" onblur="findBasePrice()" />
													</div>

												</td>

												<td>

													<div class="form">

														<input type="text" class="form-control"
															id="sell_base_price" onblur="findGstPrice()" />
													</div>

												</td>

												<td>
													<div class="form">

														<input type="number" class="form-control" id="dis_per"
															value="0" onblur="findDiscountAmtRow();" />
													</div>


												</td>

												<td>
													<div class="form">

														<input type="number" class="form-control" id="dis_amt"
															value="0" onblur="findDiscountPerRow();" />
													</div>


												</td>

												<td>
													<div class="form">
														<input type="number" class="form-control"
															id="item_price_with_dis"
															onblur="findDiscountPerAmtRow();" />
													</div>
												</td>

												<td>
													<div class="form">
														<input type="text" class="form-control" id="qty"
															onblur="findTotalRowAmount();" />
													</div>
												</td>

												<td>
													<div class="form">
														<select class="form-control" id="warranty"
															onchange="findTotalRowAmount();">
															<option value="No">No</option>
															<option value="Yes">Yes</option>
														</select>
													</div>

												</td>
												<td>
													<div class="form">
													<input type="date" class="form-control" id="warranty_date" value="0"
															onchange="findTotalRowAmount();" />
													
													</div>

												</td>

												<td>
													<div class="form">
														<input type="number" class="form-control" id="tot_amt" />
													</div>
												</td>

												<td class="text-center">
													<div class="control col-12">
														<input type="button" onfocus="insertItem();"
															class="form-control add-icon">
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>

								<hr>

								<div class="table-responsive" id="table_design">
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

												<th>Warranty</th>
												<th>Date</th>
												<th>Total Amt</th>
												<th>Delete</th>



											</tr>
										</thead>
										<tbody class="text-center tbody" id="tbody_design">

											<%
											ServiceBillService bill_ser = new ServiceBillService();
											ArrayList<ServiceBillItemDto> list_bill = bill_ser.getServiceBIllItemInfoByBillId(0, id, config, request);
											int i = 1;
											for (ServiceBillItemDto item_dto : list_bill) {

												float item_price_with_dis = item_dto.getSell_base_price() - item_dto.getDiscount_per_amount();
												float gst_price = item_price_with_dis * item_dto.getGst_per() / 100;
											%>
											<tr>
												<td align="center"><%=item_dto.getItem_code()%><input
													id="item_code<%=i%>" type="hidden" name="Item_code"
													value="<%=item_dto.getItem_code()%>"></td>

												<td align="center"><%=item_dto.getItem_name()%><input
													id="item_name<%=i%>" type="hidden" name="Item_name"
													value="<%=item_dto.getItem_name()%>"> <input
													id="item_id<%=i%>" type="hidden" name="Item_id"
													value="<%=item_dto.getItem_id_fk()%>"></td>

												<td align="center" style="display: none"><%=item_dto.getCat_name()%>
													<input id="cat_name<%=i%>" type="hidden" name="Cat_name"
													value="<%=item_dto.getCat_name()%>"> <input
													id="cat_id<%=i%>" type="hidden" name="Cat_id"
													value="<%=item_dto.getCat_id_fk()%>"> <input
													id="measure_id<%=i%>" type="hidden" name="Measure_id"
													value="<%=item_dto.getMeasurement_id_fk()%>"> <input
													id="measure_name<%=i%>" type="hidden" name="Measure_name"
													value="<%=item_dto.getMeasurement_name()%>"> <input
													id="sell_item_status<%=i%>" type="hidden"
													name="Sell_item_status"
													value="<%=item_dto.getSell_item_status()%>"> <input
													id="discount_sell_gst_price<%=i%>" type="hidden"
													name="Discount_sell_gst_price"
													value="<%=item_dto.getDiscount_sell_gst_price()%>">
													<input id="hsn_code<%=i%>" type="hidden" name="Hsn_code"
													value="<%=item_dto.getHsn_code()%>"> <%
 float gst_price_with_qty = 0;
 if (item_dto.getWarranty().equalsIgnoreCase("No")) {
 	gst_price_with_qty = item_dto.getItem_qty() * gst_price;
 }
 %> <input id="gst_price_with_qty<%=i%>" type="hidden"
													name="Gst_price_with_qty" value="<%=gst_price_with_qty%>"></td>

												<td align="center"><%=item_dto.getGst_per()%><input
													id="gst_per<%=i%>" type="hidden" name="Gst_per"
													value="<%=item_dto.getGst_per()%>"></td>
												<%
												float gst_price1 = item_dto.getSell_base_price() * item_dto.getGst_per() / 100;
												%>
												<td align="center"><%=item_dto.getSell_base_price() + gst_price1%><input
													id="item_price_with_gst<%=i%>" type="hidden"
													name="Item_price_with_gst"
													value="<%=item_dto.getSell_base_price() + gst_price1%>"></td>

												<td align="center"><%=item_dto.getSell_base_price()%><input
													id="sell_base_price<%=i%>" type="hidden"
													name="Sell_base_price"
													value="<%=item_dto.getSell_base_price()%>"></td>

												<td align="center"><%=item_dto.getDiscount_per()%><input
													id="dis_per<%=i%>" type="hidden" name="Dis_per"
													value="<%=item_dto.getDiscount_per()%>"></td>

												<td align="center"><%=item_dto.getDiscount_per_amount()%><input
													id="dis_amt<%=i%>" type="hidden" name="Dis_amt"
													value="<%=item_dto.getDiscount_per_amount()%>"></td>


												<td align="center"><%=item_price_with_dis%><input
													id="item_price_with_dis<%=i%>" type="hidden"
													name="Item_price_with_dis" value="<%=item_price_with_dis%>">
												</td>

												<td align="center"><%=item_dto.getItem_qty()%><input
													id="qty<%=i%>" type="hidden" name="Qty"
													value="<%=item_dto.getItem_qty()%>"></td>

												<td align="center"><%=item_dto.getWarranty()%></td>
												<td align="center"><%=LogFileService.changeFormate(item_dto.getWarranty_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
												<%
												float tot_amt = 0;
												if (item_dto.getWarranty().equalsIgnoreCase("No")) {
													tot_amt = item_price_with_dis * item_dto.getItem_qty();
												}
												%>
												<td align="center"><%=tot_amt%><input
													id="tot_amt<%=i%>" type="hidden" name="Tot_amt"
													value="<%=tot_amt%>"></td>

												<td><i class="bi bi-trash main-color"
													onclick="deleteItem('<%=item_dto.getId()%>');"> </i></td>

												<%
												i = i + 1;

												}
												%>
											
										</tbody>
									</table>
								</div>


								<div class="col-md-2" id="paid_amount_block">
									<div class="control form-floating">
										<input readonly type="number" class="form-control"
											id="total_basic_amt" name="Total_basic_amt"
											placeholder="total_basic_amt" value="0" required> <label
											for="total_basic_amt">Service amount</label>
									</div>
								</div>

								<!-- Total Fees end -->


								<div class="col-md-2" id="cgst_block">
									<div class="control form-floating">
										<input type="number" class="form-control" id="cgst"
											name="Cgst" placeholder="cgst" value="0" required readonly> <label
											for="cgst">CGST</label>

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
								<div class="col-sm-2" id="sgst_block">
									<div class="control form-floating">
										<input type="number" class="form-control" id="sgst"
											name="Sgst" placeholder="sgst" value="0" required readonly> <label
											for="sgst">SGST</label>
									</div>
								</div>
								<!-- sgst end -->


								<!-- Igst Start -->
								<div class="d-none" id="igst_block">
									<div class="control form-floating">
										<input type="number" class="form-control" id="igst"
											name="Igst" placeholder="igst" value="0" required> <label
											for="sgst">IGST</label>
									</div>
								</div>
								<!-- Igst end -->



								<div class="col-md-2" id="paid_amount_block">
									<div class="control form-floating">
										<input type="number" class="form-control"
											id="total_amt_with_gst" name="Total_amt_with_gst"
											placeholder="total_amt_with_gst" value="0"
											onblur="findFinalAmount();" required> <label
											for="total_amount_with_gst">Service price with GST</label>
									</div>
								</div>

								<div class="col-sm-2">
									<div class="control form-floating">
										<input type="number" class="form-control" id="labour_charge"
											name="labour_charge" placeholder="labour_charge"
											onblur="findFinalAmount();"
											value="<%=dto.getLabour_charge()%>" required> <label
											for="labour_charge">Labour Charge</label>
									</div>
								</div>

								<div class="col-sm-2">
									<div class="control form-floating">
										<input type="number" class="form-control" id="other_charge"
											name="Other_charge" placeholder="Other_charge"
											onblur="findFinalAmount();"
											value="<%=dto.getOther_charge()%>" required> <label
											for="Other_charge">Other Charge</label>
									</div>
								</div>
								<!-- Discount Start -->

								<div class="col-sm-2">
									<div class="control form-floating">
										<input type="number" class="form-control" id="tot_ser_price"
											placeholder="Final_service_price" value="0" required>
										<label for="tot_ser_price">Final Service Price</label>
									</div>
								</div>

								<div class="col-sm-2">
									<div class="control form-floating">
										<input type="number" class="form-control" id="discount_per"
											name="Discount_per" placeholder="Discount_per"
											value="<%=dto.getDiscount_per()%>"
											onblur="findDiscountAmt();" required> <label
											for="discount_per">Discount Percent(%)</label>
									</div>
								</div>
								<div class="col-sm-2">
									<div class="control form-floating">
										<input type="number" class="form-control" id="discount_amount"
											name="Discount_amount" placeholder="discount_amount"
											onblur="findDiscountPer();"
											value="<%=dto.getDiscount_amount()%>" required> <label
											for="discount_amt">Discount Amount</label>
									</div>
								</div>
								<!-- Discount end -->



								<!-- Paid Amount Start -->
								<div class="col-sm-3">
									<div class="control form-floating">
										<input type="number" style="background-color: #e7ededad;"
											class="form-control" id="final_amount" name="Final_amount"
											placeholder="Final Amount" value="0"
											onblur="findDiscountPerAmt();paidAmountEvents();" required>
										<label for="final_amount">Final Amount</label>
									</div>
								</div>
								<!-- Paid Amount end -->
								<!-- Due Fees Start -->
								<div class="col-sm-2">
									<div class="control form-floating">
										<input type="number" readonly step="0.01" min="0"
											value="<%=dto.getFinal_amount() - dto.getPaid_amount()%>"
											class="form-control" id="due_amt" name="Due_amt"
											placeholder=" Due_amt"> <label for="due_amt">Due
											Fees</label>
									</div>
								</div>
								<!-- Due Fees end -->
								<!-- Paid Amount Start -->
								<div class="col-sm-2">
									<div class="control form-floating">
										<input readonly type="number"
											style="background-color: #e7ededad;" class="form-control"
											id="paid_amount" name="Paid_amount" placeholder="Paid Amount"
											value="<%=dto.getPaid_amount()%>" required> <label
											for="paid_amount">Paid Amount</label>
									</div>
								</div>
								<!-- Paid Amount end -->

								<!-- Online Date Start-->
								<div class="col-md-2">
									<div class="control form-floating">
										<input type="date" class="form-control"
											placeholder="Upcoming_date" id="upcoming_date"
											value="<%=dto.getUpcoming_date()%>" name="Upcoming_date">
										<label for="upcoming_date">Upcoming Date</label>
										<div class="invalid-feedback">Please, Enter Online Date!</div>
									</div>
								</div>
								<!-- Online Date End -->
								<div class="col-md-4">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Upcoming_remark"
											id="upcoming_remark" Name="Upcoming_remark"><%=dto.getUpcoming_remark()%></textarea>
										<label for="upcoming_remark">Upcoming Remark</label>
									</div>
								</div>

								<div class="col-md-4">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Remark"
											id="remark" Name="Remark"><%=dto.getRemark()%></textarea>
										<label for="remark">Remark</label>
									</div>
								</div>



								<input type="hidden" id="user_id_fk" name="User_id_fk"
									value="<%=user_id%>"> <input type="hidden" id="id"
									value="<%=id%>"> <input type="hidden" id="status"
									value="Active"> <input type="hidden"
									id="job_card_id_fk" value="<%=dto.getJob_card_id_fk()%>">


								<div id="sub" class="text-center">
									<input type="button" value="Submit" name="submit" id="submit"
										onclick="dueSubmitEdit()" class="submit-btn" />
								</div>
								<div id="res_status"></div>
								<div id="result_item_info"></div>




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
	<script src="js/service_bill.js" type="text/javascript"></script>

	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->
<script>

$("#item_code").on('change', function() {
	
    var dataListID = $(this).attr('list');
    
    var selectedOption = $("#" + dataListID + " option[value='" + this.value + "']");
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
    var sell_base_price = selectedOption.data('sell_base_price');
    var hsn_code = selectedOption.data('hsn_code');
    var sell_item_status = selectedOption.data('sell_item_status');
   
 
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
   

   
});</script>

</body>
</html>


<%-- 	<h5 class="text-center card-title">Payment Details</h5>
								<div class="container d-flex justify-content-center">
									<div class="col-md-4 col-sm-12 d-flex justify-content-around">

										<div class="form-check" style="margin-right: 5px;">
											<input class="form-check-input" type="radio"
												name="Payment_mode1" id="cash_mode" value="Cash"
												onclick="checkPaymentMode();"
												<%if(dto.getPayment_mode().equalsIgnoreCase("Cash")){%>
												checked <%} %>> <label class="form-check-label"
												for="payment_mode1"> Cash </label>
										</div>
										<div class="form-check" style="margin-right: 5px;">
											<input class="form-check-input" type="radio"
												name="Payment_mode1" id="online_mode" value="Online"
												onclick="checkPaymentMode();"
												<%if(dto.getPayment_mode().equalsIgnoreCase("Online")){%>
												checked <%} %>> <label class="form-check-label"
												for="payment_mode1"> Online </label>
										</div>

										<div class="form-check" style="margin-right: 5px;">
											<input class="form-check-input" type="radio"
												name="Payment_mode1" id="both_mode" value="Both"
												onclick="checkPaymentMode();"
												<%if(dto.getPayment_mode().equalsIgnoreCase("Both")){%>
												checked <%} %>> <label class="form-check-label"
												for="payment_mode1"> Both </label>
										</div>

									</div>
								</div>


								<input type="hidden" id="payment_mode" name="Payment_mode"
									value="Cash" />

								<!-- Cash Amount Start -->
								<div class="col-md-3" id="cash_block">
									<div class="control form-floating">
										<input type="number" step="0.01" class="form-control"
											 id="cash_amount" name="Cash_amount"
											 onblur="paidAmountEvent()" placeholder="Cash Amount"
											value="<%=dto.getCash_amount() %>" required> <label
											for="cash_amount">Cash Amount</label>
									</div>
								</div>
								<!-- Cash Amount end -->

								<!-- Online Amount Start -->
								<div class="d-none" id="online_amt_block">
									<div class="control form-floating">
										<input type="number" step="0.01" class="form-control"
											 id="online_amount" name="Online_amount" 
											 onblur="paidAmountEvent()" placeholder="Online Amount"
											value="<%=dto.getOnline_amount() %>" required> <label
											for="online_amount">Online Amount</label>
									</div>
								</div>
								<!-- Online Amount end -->

								<!-- Paid Amount Start -->
								<div class="d-none" id="paid_block">
									<div class="control form-floating">
										<input readonly type="number"
											style="background-color: #e7ededad;" class="form-control"
											id="paid_amount" name="Paid_amount" placeholder="Paid Amount"
											value="<%=dto.getCash_amount()+dto.getOnline_amount() %>" required> <label for="paid_amount">Paid
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
												value="<%=dto.getOnline_date() %>" name="Online_date">
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
													<%if(dto.getOnline_way().equalsIgnoreCase("N/A")){out.print("selected");} %>>select
													payment way</option>
												<option value="Gpay"
													<%if(dto.getOnline_way().equalsIgnoreCase("Gpay")){out.print("selected");} %>>Gpay</option>
												<option value="Phonepay"
													<%if(dto.getOnline_way().equalsIgnoreCase("Phonepay")){out.print("selected");} %>>Phone
													Pay</option>
												<option value="Paytm"
													<%if(dto.getOnline_way().equalsIgnoreCase("Paytm")){out.print("selected");} %>>Paytm</option>
												<option value="Cheque"
													<%if(dto.getOnline_way().equalsIgnoreCase("Cheque")){out.print("selected");} %>>Cheque</option>
												<option value="Online"
													<%if(dto.getOnline_way().equalsIgnoreCase("Online")){out.print("selected");} %>>Online</option>



											</select> <label for="online_way">Select Online Way</label>
										</div>
									</div>
									<!-- Online way end -->


									<!-- Bank Detail start -->
									<div class="col-md-3">
										<div class="control form-floating ">
											<select class="form-select" id="bank_id_fk" name="Bank_id_fk"
												aria-label="working post">
												<option selected disabled value="0">Select Bank</option>

												<%
												BankService ser1 = new BankService();

												ArrayList<BankDto> list1 = ser1.getActiveBankInfo(config, request);

												for (BankDto Bank_dto : list1) {
												%>
												<option
													<%if (Bank_dto.getId() == dto.getBank_id_fk()) {
											out.print("selected");
											}%>
													value="<%=Bank_dto.getId()%>"><%=Bank_dto.getName()%></option>

												<%
												}
												%>

											</select> <label for="bank_id_fk">Select Bank</label>
										</div>
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
								<!-- *** Online Block End *** --> --%>

