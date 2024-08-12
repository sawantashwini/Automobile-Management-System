
<%@include file="include/head.jsp"%>
<script type="text/javascript" src="js/employee.js"></script>

</head>


							<%
							int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
							String month = request.getParameter("m") == null ? "" : request.getParameter("m");
							String year = request.getParameter("y") == null ? "" : request.getParameter("y");
							
							EmployeeService service = new EmployeeService();
							EmployeeDto dto = service.getEmployeeInfoById(id, config, request);
							
								int day_in_month = 0;
													
								if(month.equals("01")){
									day_in_month=31;
								}
								if(month.equals("02") ){
									day_in_month=28;
								}
								if(month.equals("03")){
									day_in_month=31;
								}
								if(month.equals("04")){
									day_in_month=30;
								}
								if(month.equals("05")){
									day_in_month=31;
								}
								if(month.equals("06")){
									day_in_month=30;
								}
								if(month.equals("07")){
									day_in_month=31;
								}
								if(month.equals("08")){
									day_in_month=31;
								}
								if(month.equals("09")){
									day_in_month=30;
								}
								if(month.equals("10")){
									day_in_month=31;
								}
								if(month.equals("11")){
									day_in_month=30;
								}
								if(month.equals("12")){
									day_in_month=31;
								}
								
								%>
							

<body onload="loadPaymentMode();employeeAttendenceInfo();" >


	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->


	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->


	<main id="main" class="main">

	
		
		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Pay Salary</h1>
			</div>
		</div>



		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-12">

					<div class="card" style="border-radius: 20px;">
						<div class="card-body">
						 <br /> 
							<h5 class="text-center card-title">Employee Details</h5>

							
							<!-- Floating Labels Form -->
							<form autocomplete="off" action="EmployeeSalaryServlet" method="post"
								class="row g-3 needs-validation" novalidate>

								<div class="col-sm-4">
									<div class="control form-floating">
										<input readonly type="text" class="form-control" id="name"
											name="Name" placeholder="Model Name"
											value="<%=dto.getName()%>" required> <label
											for="name">Employee Name</label>
									</div>
								</div>

								<input type="hidden" id="employee_id_fk" name="Employee_id_fk" value="<%=id%>">
								<input type="hidden" id="user_id_fk" value="<%=user_id%>"
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
											placeholder="Base Price"
											value="<%=dto.getSalary_per_month()%>" required> <label
											for="salary_per_month">Salary Per Month</label>
									</div>
								</div>
								<!-- Salary Per Month end -->

								<!-- End Restrict Form -->

								<h5 class="text-center card-title">Pay Salary Details</h5>

								<div class="col-md-3">
									<div class="control form-floating">
										<input type="Date" class="form-control" id="in_date"
											name="In_date" placeholder="in_date"
											value="<%=current_date%>" required> <label
											for="in_date">Date</label>
										<div class="invalid-feedback">Please, enter in_date!</div>
									</div>
								</div>

								<!-- Pay Date start -->
								<div class="col-md-3">
									<div class="control form-floating">
										<input type="date" class="form-control"
											value="<%=current_date %>" id="Pay_date" name="Pay_date"
											placeholder="Pay Date" required> <label
											for="mo_nomber">Pay Date</label>
										<div class="invalid-feedback">Please, Enter Valid Date!</div>
									</div>
								</div>
								<!-- Pay Date End -->

								<!-- Paid Month start -->
								<div id="on_way" class="col-md-3">
									<div class="control form-floating mb-3">
										<select class="form-select" id="paid_month" style="pointer-events: none;" name="Paid_month"
											aria-label="working post">

												<option value="01"
													<%if (month.equals("01")) {
													out.println("selected='selected'");
												}%>>Jan</option>
												<option value="02"
													<%if (month.equals("02")) {
												out.println("selected='selected'");
											}%>>Feb</option>
												<option value="03"
													<%if (month.equals("03")) {
												out.println("selected='selected'");
											}%>>Mar</option>
												<option value="04"
													<%if (month.equals("04")) {
												out.println("selected='selected'");
											}%>>Apr</option>
												<option value="05"
													<%if (month.equals("05")) {
												out.println("selected='selected'");
											}%>>May</option>
												<option value="06"
													<%if (month.equals("06")) {
												out.println("selected='selected'");
											}%>>Jun</option>
												<option value="07"
													<%if (month.equals("07")) {
												out.println("selected='selected'");
											}%>>July</option>
													<option value="08"
													<%if (month.equals("08")) {
											out.println("selected='selected'");
										}%>>Aug</option>
												<option value="09"
													<%if (month.equals("09")) {
												out.println("selected='selected'");
											}%>>Sep</option>
												<option value="10"
													<%if (month.equals("10")) {
											out.println("selected='selected'");
										}%>>Oct</option>
												<option value="11"
													<%if (month.equals("11")) {
													out.println("selected='selected'");
												}%>>Nov</option>
												<option value="12"
													<%if (month.equals("12")) {
														out.println("selected='selected'");
													}%>>Dec</option>
											
										</select> <label for="paid_month">Select Paid Month</label>
									</div>
								</div>
								<!-- Paid Month end -->

								<!-- Paid Year start -->
								<div  class="col-md-3">
									<div class="control form-floating mb-3">
										<select class="form-select" id="paid_year" name="Paid_year" style="pointer-events: none;" onblur="employeeAttendenceInfo()" required
											aria-label="working post">
											 <option value="">Select year</option>
											 
            <% String[] options = {"2023", "2024", "2025","2026","2027"}; %>
            <% for (String option : options) { %>
            
                <option value="<%= option %>" <%= option.equals(year) ? "selected" : "" %>><%= option %></option>
                 <% } %>
										</select> <label for="paid_year">Select Paid Year</label>
									</div>
								</div>



								<!-- Leave Day Start -->
								<div class="col-sm-3">
									<div class="control form-floating">
										<input type="number" class="form-control" id="leave_days"
											name="Leave_days" placeholder="Leave Days" value="0" required>
										<label for="leave_days">Leave Days</label>
									</div>
								</div>
								<!-- Leave Day end -->

								<!-- Half Day Start -->
								<div class="col-sm-3">
									<div class="control form-floating">
										<input type="number" class="form-control" id="half_days" onblur="salaryEvent()"
											name="Half_days" placeholder="Half Days" value="0" required>
										<label for="half_days">Half Days</label>
									</div>
								</div>
								<!-- Half Day end -->

								<!-- Absent Day Start -->
								<div class="col-sm-3">
									<div class="control form-floating">
										<input type="number" class="form-control"
										 id="absent_days" name="Absent_days" onblur="salaryEvent()"
											placeholder="Absent Days" value="0" required> <label
											for="absent_days">Absent Days</label>
										<div class="invalid-feedback">Please, Enter Absent Days!</div>
									</div>
								</div>
								<!-- Absent Day end -->

								<!-- Present Day Start -->
								<div class="col-sm-3">
									<div class="control form-floating">
										<input type="number" class="form-control"
											id="present_days" name="Present_days" placeholder="Present Days" value=""
											required> <label for="present_days">Full
											Days</label>
										<div class="invalid-feedback">Please, Enter Full
											Days!</div>
									</div>
								</div>
								<!-- Present Day end -->
								
								
								<!-- Total Day Start -->
								<div class="col-sm-3">
									<div class="control form-floating"> 
										<input type="number" class="form-control"
											 id="total_days" name="Total_days"
											placeholder="Total Days" value="<%=day_in_month %>" required> <label
											for="total_days">Total Days</label>
									</div>
								</div>
								<!-- Total Day end -->



								<!-- Remaining Salary Start -->
								<div class="col-sm-3">
									<div class="control form-floating">
										<input readonly type="number" class="form-control"
											id="final_salary" name="Final_salary"
											placeholder="Final Salary" value="" required> <label
											for="remaining_salary">Final Salary</label>
									</div>
								</div>
								<!-- Remaining Salary end -->

								<!-- Cash Amount Start -->
								<div class="col-md-3" id="cash_block">
									<div class="control form-floating">
										<input type="number" class="form-control"
											onblur="paidAmountEvent()" step="0.01" id="cash_amount"
											name="Cash_amount" placeholder="Cash Amount" value="0"
											required> <label for="cash_amount">Cash
											Amount</label>
									</div>
								</div>
								<!-- Cash Amount end -->

								<!-- Online Amount Start -->
								<div class="d-none" id="online_amt_block">
									<div class="control form-floating">
										<input type="number" class="form-control"
											onblur="paidAmountEvent()" step="0.01" id="online_amount"
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
												<option value="N/A" Selected='selected'>select
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
									</div>


									<!-- Online Remark Start -->
									<div class="col-md-3">
										<div class="control form-floating">
											<input class="form-control" id="online_remark"
												name="Online_remark" placeholder="Online Remark"> <label
												for="online_remark">Online Remark</label>
										</div>
									</div>
									<!-- Online Remark End -->



								</div>
								<!-- *** Online Block End *** -->

								<h5 class="text-center card-title">Payment Mode</h5>
								<div class="container d-flex justify-content-center">
									<div class="col-md-3 ">
										<div class="d-flex justify-content-around">

											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="Payment_mode1" id="cash_mode" value="Cash"
													onclick="checkPaymentMode();" checked> <label
													class="form-check-label" for="payment_mode1"> Cash
												</label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="Payment_mode1" id="online_mode" value="Online"
													onclick="checkPaymentMode();"> <label
													class="form-check-label" for="payment_mode1">
													Online </label>
											</div>

											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="Payment_mode1" id="both_mode" value="Both"
													onclick="checkPaymentMode();"> <label
													class="form-check-label" for="payment_mode1"> Both
												</label>
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
								<div id="rev"></div>


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
	<br />
	<br />

	<script type="text/javascript">
	
		function salaryEvent() {
			
			let total_day = Number(document.getElementById("total_days").value);
			let salary = Number(document.getElementById("salary_per_month").value);
			let half = Number(document.getElementById("half_days").value);
			let absent_days = Number(document.getElementById("absent_days").value);

			let per_day = salary / 30;
			let due_absent = absent_days * per_day;
			let due_half = half * per_day / 2;
			final_salary = (salary - due_absent - due_half).toFixed(2);
			/* let present_day = total_day - (half/2 + absent_days + leave_days);
			document.getElementById("present_days").value = present_day; */
			if(final_salary>0){
				document.getElementById("final_salary").value = final_salary;
				document.getElementById("cash_amount").value = final_salary;
			}
			else{
				document.getElementById("final_salary").value = 0;
			}

		}

		/* function totaldaysBymonth(){
			var month = document.getElementById('paid_month').value;
			var year = document.getElementById('paid_year').value;
			
			if(month=='April' || month=='June' || month=='September' || month=='November'){
				document.getElementById("total_days").value = 30;
			}
			else if(month=='February'){
				if ((0 == year % 4) && (0 != year % 100) || (0 == year % 400)) {
					document.getElementById("total_days").value = 29;
			    } else {
			    	document.getElementById("total_days").value = 28;
			    }
			}
			else{
				document.getElementById("total_days").value = 31;
			}
		} */

	</script>
	
	<script >
	function employeeAttendenceInfo() {
		
		var id = document.getElementById('employee_id_fk').value;
		var month = document.getElementById('paid_month').value;
		var year = document.getElementById('paid_year').value;
		//alert(id);
		//alert(month);
		//alert(year);
		if (id) {
			
			$.ajax({

				url : 'Ajax_employee_attendence_by_id.jsp',
				data : 'id=' + id+'&month=' + month +'&year=' + year,
				type : 'post',
				success : function(msg){

				//	 alert(msg);

					$('#rev').html(msg);
					var full_day = document.getElementById("full_day_value").value;
					var half_day = document.getElementById("half_day_value").value;
					var leave_day = document.getElementById("leave_day_value").value;
					var absent_day = document.getElementById("absent_day_value").value;
					
					document.getElementById("present_days").value = full_day;
					document.getElementById("half_days").value = half_day;
					document.getElementById("leave_days").value = leave_day;
					document.getElementById("absent_days").value = absent_day;
					salaryEvent();
					
				}
			});
		} else {
		
			
			}
	}
	</script>


	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>

</html>