<%@include file="include/head.jsp"%>
<style>
.form-label {
	color: #f00;
	font-size: 15px;
	font-weight: bolder;
}

.div-width {
padding-left: 1.5em;
	width: fit-content;
	white-space: nowrap;
}

.form-check h6 {
	color: #787373;
	font-size: 13px;
	font-weight: 400;
}

.form-check h6 i {
	font-size: 9px;
	border: 1px solid;
	border-radius: 50%;
	padding: 1%;
}

.form-check-label {
	color: #000;
	font-size: 12px;
}

.form-check-input {
	margin-top: 4px;
}

.icon-color {

	color: #f00;
}
</style>
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
				<h1>Features</h1>
			</div>
		</div>



		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-10">

					<div class="card" style="border-radius: 25px;">
						<div class="card-body">
							<br />

							<%
							int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
							UserService service = new UserService();
							UserDto dto = service.getuserInfoById(id, config, request);
							%>

							<!-- Floating Labels Form -->
							<form autocomplete="off" action="UserServlet" method="post"
								class="row g-3 needs-validation" novalidate>

								<div class="col-sm-6 mt-3">
									<label for="yourName" class="form-label"> Name</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="Name"><i
											class="ri-user-fill icon-color"></i></span> <input type="text"
											name="Name" class="form-control" id="name"
											value="<%=dto.getName()%>" required> <input
											type="hidden" value="<%=id%>" name="Id"> <input
											type="hidden" value="2" name="flag">


									</div>
								</div>



								<div class="col-sm-6 mt-3">
									<label for="yourName" class="form-label"> Mobile No.</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="PhoneNo."><i
											class="bi bi-phone-fill icon-color"></i></span> <input type="number"
											step="0.01" min="0"
											onblur="checkNameAvail(this.value, <%=id%>, 'Mobile');"
											name="Mobile_no" class="form-control" id="mobileno"
											value="<%=dto.getMobile_no()%>" required>
										<div class="invalid-feedback">Please, enter your Phone
											No.!</div>
									</div>
								</div>


								<div class="col-6 mt-3">
									<label for="yourPassword" class="form-label">Password</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="Password"><i
											class="ri-lock-2-fill icon-color"></i></span> <input type="PASSWORD"
											name="Password" class="form-control" id="PASSWORD"
											value="<%=dto.getPassword()%>" required>
										<div class="invalid-feedback">Please enter your
											password!</div>
									</div>
								</div>

								<div class="col-6 mt-3">
									<label for="yourUsername" class="form-label">Address</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="Address"><i
											class="bi bi-geo-alt-fill icon-color"></i></span> <input type="text"
											name="Address" class="form-control" id="local_address"
											value="<%=dto.getAddress()%>" required>
										<div class="invalid-feedback">Please choose a Address.</div>
									</div>
								</div>

								<div class="col-md-12 mt-2">
									<label for="Activationdate" class="form-label">Status</label>
									<div class="form-floating control mb-3">
										<select class="form-select" id="status" name="Status"
											aria-label="working post">
											<option value="Active"
												<%if (dto.getStatus().equalsIgnoreCase("Active")) {out.print("selected='selected'");}%>>Active</option>

											<option value="Block"
												<%if (dto.getStatus().equalsIgnoreCase("Block")) {out.print("selected='selected'");}%>>Block</option>

										</select> <label for="Status">Status</label>
										<div class="invalid-feedback">Please, select Employee
											Status!</div>
									</div>
								</div>

								<label for="Activationdate" class="form-label">Features</label>
								<div class="col-md-12"
									style="display: grid; grid-template-columns: repeat(1, 1fr); grid-gap: 20px;">

									<div class="form-control">

										<%
										String[] icon = { "bi bi-car-front", "bi bi-card-checklist", "bi bi-asterisk", "bi bi-box-arrow-in-up", "fa-sack-dollar", "fa-hand-holding-dollar",  "fa-users", "fa-indian-rupee-sign", "fa-chalkboard", "fa-sack-dollar", "fa-hand-holding-dollar", "fa-award" , "fa-user", "fa-pencil-square", "fa-trash" };
										String[] name = { "Vehicle", "Job Card", "Service", "Inventory", "Return Module", "Other Module","Spend", "Income",  "Employee",  "Master","Spend Head","Income Head", "User" , "Update",  "Delete"}; // Updated the ID for Home
										String[][] sub_name = { { "Vehicle Module", "Vehicle Stock Report"," Sold Vehicle Report","Vehicle Finance Report" },{"Job Card Module", "Job Card Report"}, { "Service Report"} , { "Sell Module", "Purchase Module","Sell Report","Purchase Report","Sell Item Report","Purchase Item Report","Required Item Report","Delear Report","Customer Report" } , {"Sell Return", "Sell Return Report", "Sell Item Return Report","Purchase Return Module", "Purchase Return Report","Purchase Return Item Report"}, {"Other Purchase Module", "Other Purchase Report ","Other Dealer Report"}, {"Spend Module ", "Spend Report"}, {"Income Module", "Income Report"}, {"Employee Module"}, {"Master Module"}, {"Spend Head Module"}, {"Income Head Module"},{"User Module"}, {"Update Module"} ,{"Delete Module"} };
										String[][] attr_name = { { "Vehicle_module", "Stock_vehicle_module","Sold_vehicle_module","Finance_module" }, {"Job_card_module", "Job_card_report"} ,  { "Service_report"} ,
												{"Sell_module", "Purchase_module", "Sell_report", "Purchase_report","Sell_item_report","Pur_item_report","Required_item_report","Dealer_report","Customer_report"}, {"Sell_return_module", "Sell_return_report","Sell_item_return_report","Purchase_return_module","Purchase_return_report","Pur_item_return_report"}, {"Other_purchase_module", "Other_purchase_report","Other_dealer_report"},
												 { "Spend_module", "Spend_report"}, {"Income_module", "Income_report"},  
												{"Employee_module"},{"Master_module"}, {"Spend_head_module"}, {"Income_head_module"}, {"User_module"}, {"Update_module"} ,{"Delete_module"}};
										String[][] attr_id = { { "vehicle_module", "stock_vehicle_module","sold_vehicle_module","finance_module" }, {"job_card_module", "job_card_report"} ,  { "service_report"} ,
												{"sell_module", "purchase_module", "sell_report", "purchase_report","sell_item_report","pur_item_report","required_item_report","dealer_report","customer_report"}, {"sell_return_module", "sell_return_report","sell_item_return_report","purchase_return_module","purchase_return_report","pur_item_return_report"}, {"other_purchase_module", "other_purchase_report","other_dealer_report"}, { "spend_module", "spend_report"}, {"income_module", "income_report"}, {"employee_module", }, {"master_module"}, {"spend_head_module"}, {"income_head_module"}, {"user_module"}, {"update_module"} ,{"delete_module"} };
										String[][] ul_get = { { dto.getVehicle_module(), dto.getStock_vehicle_module(),dto.getSold_vehicle_module(),dto.getFinance_module()}, {dto.getJob_card_module(), dto.getJob_card_report() }, {dto.getService_report()} 
										, {dto.getSell_module(), dto.getPurchase_module(),dto.getSell_report(), dto.getPurchase_report(),dto.getSell_item_report(),dto.getPur_item_report(),dto.getRequired_item_report(),dto.getDealer_report(),dto.getCustomer_report()},
										{dto.getSell_return_module(),dto.getSell_return_report(),dto.getSell_item_return_report(),dto.getPurchase_return_module(),dto.getPurchase_return_report(),dto.getPur_item_return_report()}, 
												{dto.getOther_purchase_module(), dto.getOther_purchase_report(),dto.getOther_dealer_report()},{dto.getSpend_module(), dto.getSpend_report()}, {dto.getIncome_module(),dto.getIncome_report()},{dto.getEmployee_module()},
												{dto.getMaster_module()},{dto.getSpend_head_module()}, {dto.getIncome_head_module()},{dto.getUser_module()},{dto.getUpdate_module()},{dto.getDelete_module()} };

										for (int p = 0; p < name.length; p++) {
										%>
										<div class="form-check">
											<h6 style="font-size: 13px;">
												<i class="fa-solid <%=icon[p]%>"></i>&nbsp;&nbsp;&nbsp;<b><%=name[p]%></b>
											</h6>

											<div class="row mx-5">
												<%
												for (int i = 0; i < sub_name[p].length; i++) {
												%>
												<div class="form-check col-md-4 div-width">
													<input class="form-check-input" type="checkbox"
														id="<%=attr_id[p][i]%>" name="<%=attr_name[p][i]%>"
														value="Yes" style="margin-top: 3px;"
														<%if ("Yes".equalsIgnoreCase(ul_get[p][i])) {out.print("checked='checked'");}%>>
													<label class="form-check-label" for="<%=attr_id[p][i]%>"><%=sub_name[p][i]%></label>
												</div>
												<%
												}
												%>
												
											</div>
											<hr>
										</div>
										<%
										}
										%>

									</div>
								</div>

								<br> <br>
								<div class="row mt-3">
									<div class="col-sm-12">
										<button type="submit" class="submit-btn"
											style="margin-left: 40%;">
											<b>Submit </b>
										</button>
									</div>
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


	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>

</html>