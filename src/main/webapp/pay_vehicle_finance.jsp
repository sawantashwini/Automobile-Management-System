	<%@page import="com.dto.BankDto"%>
<%@page import="com.service.BankService"%>
<%@page import="com.dto.CityDto"%>
<%@page import="com.service.CityService"%><%@page import="com.dto.VehicleInfoDto"%>
<%@page import="com.service.VehicleInfoService"%>
<%@page import="com.dto.ColorDto"%>
<%@page import="com.service.ColorService"%>
<%@page import="java.util.ArrayList"%>

	
	
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
	
	<main id="main" class="main">
		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Pay Vehicle Finance</h1>
			</div>
		</div>



		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
						
						
							<!-- <br /> -->
							
							<%
							int id = Integer.parseInt(request.getParameter("id") == null ? "0"
									: request.getParameter("id"));
							VehicleInfoService service = new VehicleInfoService();

							VehicleInfoDto dto = service.getVehicleInfoById(id, config, request);
						%>
						
						
					
								
								
									<h5 class="text-center card-title" style="margin-bottom: -15px;">Vehicle Details</h5>

						

		  <div class="table-responsive">
							<table class="table info-table table-borderless mt-4 table-color">
                    <tr>
                    	<th width="75px">Company</th>
                    	<th width="2px">:</th>
                    	<td width="350px"><%=dto.getBike_company_name()%></td>
                    	<th width="150px">Vehicle No.</th>
                    	<th width="2px">:</th>
                    	<td width="250px"><%=dto.getVehicle_no()%></td>
                    	<th width="150px">Chassis No.</th>
                    	<th width="2px">:</th>
                    	<td width="250px"><%=dto.getChassis_no()%></td>
                    </tr>
                    
                  
                     <tr>
                    	<th >Model </th>
                    	<th>:</th>
                    	<td ><%=dto.getModel_name()%></td>
                        <th>Engine No.</th>
                    	<th>:</th>
                    	<td><%=dto.getEngine_no()%></td>
                    	  <th>Color</th>
                    	<th>:</th>
                    	<td><%=dto.getColor_name()%></td>
                    	
                    </tr>
                     
                    </table>
                    </div>
			
							
							
							
							<h5 class="text-center card-title">Pay Vehicle Finance</h5>
							
							<!-- Floating sold vehicle Form -->
							<form autocomplete="off"  class="row g-3 needs-validation" novalidate>

								<input type="hidden" id="User_id_fk" value="<%=user_id%>">
								<input type="hidden" id="vehicle_id" value="<%=dto.getId()%>">
								
								
								<div class="col-sm-2">
									<div class="control form-floating">
										<input type="date" class="form-control" id="finance_pay_date"
											name="Pay_date" placeholder="Pay Date" required value="<%=dto.getFinance_pay_date()== "" ? current_date : dto.getFinance_pay_date()%>">
										<label for="sold_date">Pay Date</label>
										<div class="invalid-feedback">Please, Enter Pay
											Date!</div>
									</div>
								</div>
								
								<div class="col-sm-2">
									<div class="control form-floating">
										<input type="number" step="0.01" class="form-control" id="finance_amount"
										 placeholder="Finance Amount" required value="<%=dto.getFinance_amount()%>">
										<label for="sold_date">Amount</label>
										<div class="invalid-feedback">Please, Enter Finance 
											Amount!</div>
									</div>
								</div>
								
								<div class="col-sm-2">
									<div class="control form-floating">
										<input type="date" class="form-control" id="finance_online_date" 
											name="Finance_online_date" placeholder="Finanace Online Date" required value="<%=dto.getFinance_online_date()== "" ? current_date : dto.getFinance_online_date()%>">
										<label for="sold_date">Online Date</label>
										<div class="invalid-feedback">Please, Enter Online
											Date!</div>
									</div>
								</div> 
								
								<div class="col-sm-3">
									<div class="control form-floating">
										<input type="text" class="form-control" id="finance_cheque_no" placeholder="Finance Cheque No." 
											value="<%=dto.getFinance_cheque_no()==null?"":dto.getFinance_cheque_no()%>" required> <label
											for="finance_cheque_no" >Cheque No.</label>
									</div>
								</div>
								<div class="col-md-2 refresh-container mb-3" data-add="add_bank.jsp" data-list="bank">								
									<div class="control form-floating refresh-input">
										<input type="text" class="form-control" id="bank_name" placeholder="Select Bank Name">
										<input type="hidden" id="bank_id_fk" name="Finance_bank_id_fk" value="<%=dto.getFinance_bank_id_fk()%>"/>
										<label for="bank_name">Select Bank Name</label>
										<div class="invalid-feedback">Please, Select Bank!</div>
									</div>			
								</div>
								<%-- <!-- Bank Detail start -->
									<div class="col-md-2">
										<div id="refresh_bank">
											<div class="control form-floating d-flex">
												<select class="form-select" id="bank_id_fk"
													name="Finance_bank_id_fk" aria-label="working post">
													<option value="0" Selected='selected'>Select Bank
														Name</option>

													<%
													BankService ser1 = new BankService();

													ArrayList<BankDto> list1 = ser1.getBankInfo(config, request);

													for (BankDto Bank_dto : list1) {
													%>

													<option value="<%=Bank_dto.getId()%>"<%if (Bank_dto.getId() == dto.getFinance_bank_id_fk()) {%>selected="selected" <%}%>><%=Bank_dto.getName()%></option>


													<%
													}
													%>

												</select> <label for="finance_bank_id_fk">Select Bank</label>
											</div>
										</div>
									</div>
									<div class="refresh_add"
										id="bank_parent">
										<%@include file="include/refresh_add.jsp"%>
									</div>
								 --%>
								<div class="col-md-12">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Address"
											id="finance_remark" Name="Finance_remark" required style="height: 70px"><%=dto.getFinance_remark()==null?"N/A": dto.getFinance_remark()%></textarea>
										<label for="customer_address">Remark</label>
										<div class="invalid-feedback">Please, Enter Finance Remark!</div>
									</div>
								</div>

								<div id="sub" class="text-center">
									<input type="button" value="Submit" name="submit" id="submit"
										onclick="dueSubmit()" class="submit-btn" />
								</div>
								<div id="res_status"></div>
								
								</form>

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
function refreshBank() {
		
		//alert("Start");
		var flag = 'Bank';
		
		
			$.ajax({

				url : 'AjaxDesign/AjaxRefreshAvailItem.jsp',
				data : 'Flag='+ flag,
				type : 'post',
				success : function(msg) {

					//alert(msg);

					$('#finance_bank_id_fk').html(msg);
					

					

				}
			});
			

	}
		</script>
	<script type="text/javascript">
	
	 


	
	

	function dueSubmit() {
		
		var id = document.getElementById("vehicle_id").value;
		var finance_online_date = document.getElementById("finance_online_date").value;
		var finance_amount = document.getElementById("finance_amount").value;
		var finance_remark = document.getElementById("finance_remark").value;
		var finance_cheque_no = document.getElementById("finance_cheque_no").value;
		var finance_pay_date = document.getElementById("finance_pay_date").value;
		var finance_bank_id_fk = document.getElementById("bank_id_fk").value;
		
		
		
		$
				.ajax({
					url : 'AjaxService/AjaxPayFinance.jsp',
					data : 'Id='+ id
					+ '&Finance_amount='+ finance_amount 
					+ '&Finance_online_date='+ finance_online_date 
					+ '&Finance_cheque_no='+ finance_cheque_no 
					+ '&Finance_pay_date='+ finance_pay_date 
					+ '&Finance_bank_id_fk=' + finance_bank_id_fk
					+ '&Finance_remark=' + finance_remark,
					type : 'post',
					success : function(msg) {
						//alert(msg);
						$('#res_status').html(msg);
						var status = document.getElementById("updatestatus").value;
						if (status=='true') {
							window.location.href = "manage_sold_vehicle.jsp?msg=YesFin";
						} else {
							window.location.href = "manage_sold_vehicle.jsp?msg=NoFin";
						}

					}
				});
		
		

	}

	
	</script>


	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>

</html>