<%@page import="com.dto.CityDto"%>
<%@page import="com.service.CityService"%><%@page
	import="com.dto.VehicleInfoDto"%>
<%@page import="com.service.VehicleInfoService"%>
<%@page import="com.dto.ColorDto"%>
<%@page import="com.service.ColorService"%>
<%@page import="java.util.ArrayList"%>

<!-- ======= Head ======= -->
<%@include file="include/head.jsp"%>
<!-- ======= Head end======= -->
<style>
.col-4 {
	flex: 0 0 auto;
	width: 40.333333%;
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
				<h1>Sale Vehicle</h1>
			</div>
		</div>



		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">

							<%
							int id = Integer.parseInt(request.getParameter("id") == null ? "0"
									: request.getParameter("id"));
							VehicleInfoService service = new VehicleInfoService();

							VehicleInfoDto dto = service.getVehicleInfoById(id, config, request);
						%>
							<h5 class="text-center card-title" style="margin-bottom: -15px;">Vehicle
								Details</h5>


							


								  <div class="table-responsive">
							<table class="table info-table table-borderless mt-4 table-color nowrap">
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
							<h5 class="text-center card-title">Sold Vehicle</h5>




							<!-- Floating sold vehicle Form -->
							<form autocomplete="off" action="SoldVehicleServlet"
								enctype="multipart/form-data" method="post"
								class="row g-3 needs-validation" novalidate>

								<input type="hidden" name="User_id_fk" value="1">
<input type="hidden" name="Sold_status" value="sold"> <input
									type="hidden" name="Id" value="<%=id%>">


								<div class="col-sm-2">
									<div class="control form-floating">
										<input type="date" class="form-control" id="sold_date"
											name="Sold_date" placeholder="Sold Date" required
											value="<%=dto.getSold_date()== "" ? current_date : dto.getSold_date()%>">
										<label for="sold_date">Sold Date</label>
										<div class="invalid-feedback">Please, Enter Sold Date!</div>
									</div>
								</div>

								
								<div class="col-sm-3">
									<div class="control form-floating">
										<input type="text" class="form-control" id="customer_name"
											name="Customer_name" placeholder="Customer Name"
											value="<%=dto.getCustomer_name()==null ? "": dto.getCustomer_name()%>"
											required> <label for="customer_name">Customer
											Name</label>
										<div class="invalid-feedback">Please, Enter Customer
											Name Name!</div>
									</div>
								</div>

								<div class="col-sm-3">
									<div class="control form-floating">
										<input type="number" class="form-control"
											id="customer_mobile_no" name="Customer_mobile_no"
											placeholder=" Customer Mobile Number"
											value="<%=dto.getCustomer_mobile_no()==null ? "": dto.getCustomer_mobile_no()%>">
										<label for="customer_mobile_no">Customer Mobile Number</label>
									</div>
								</div>
								<div class="col-sm-3  refresh-container"
									data-add="add_city.jsp" data-list="city">
									<div class="control form-floating refresh-input">
										<input type="text" class="form-control" id="city_name"
											placeholder="Select City" required> <input
											type="hidden" id="city_id_fk" name="City_id_fk" value="<%=dto.getCity_id_fk() %>" />
										<label for="city_id_fk">Select City</label>
										<div class="invalid-feedback">Please, Select City!</div>
									</div>

								</div>
								<%-- <div class="col-sm-3 col-3">
									<div id="city_id_fk_refresh">
										<div class="control form-floating">
											<select class="form-select" id="city_id_fk"
												name="City_id_fk"
												aria-label="working post" required>
												<option value="0">Select Your City</option>
												<%
												CityService city_ser = new CityService();
												ArrayList<CityDto> city_list = city_ser.getActiveCityInfo(config, request);
												for (CityDto city_dto : city_list) {
												%>
												<option value="<%=city_dto.getId()%>" <%if(city_dto.getId()==dto.getCity_id_fk()){%> selected
												<%}%>><%=city_dto.getName()%></option>
												<%
												}
												%>
											</select> <label for="city_id_fk">Select City</label>
											<div class="invalid-feedback">Please, Select Living City!</div>
										</div>
									</div>
								</div>
								<div class="refresh_add" id="city_parent">
									<%@include file="include/refresh_add.jsp"%>
								</div> --%>


								<div class="col-md-12">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Address"
											id="customer_address" name="Customer_address" required
											style="height: 70px"><%=dto.getCustomer_address()==null?"": dto.getCustomer_address()%></textarea>
										<label for="customer_address">Customer Address</label>
										<div class="invalid-feedback">Please, Enter Customer
											Address!</div>
									</div>
								</div>




								<div class="col-sm-4">
									<div class="control form-floating">
										<input type="number" step="0.01" class="form-control"
											id="sale_price" name="Sale_price" placeholder="Sale Price"
											value="<%=dto.getSale_price()%>" onblur="findFin();" required>
										<label for="sale_price">Sale Price</label>
										<div class="invalid-feedback">Please, Enter Sale Price!</div>
									</div>
								</div>

								<div class="col-sm-4">
									<div class="control form-floating">
										<input type="number" step="0.01" class="form-control"
											id="due_sale_price" name="Due_sale_price"
											placeholder="Base Price" value="<%=dto.getDue_sale_price()%>"
											onblur="findFin();" required> <label
											for="due_sale_price">Due Sale Price</label>
										<div class="invalid-feedback">Please, Enter Due Sale
											Price!</div>
									</div>
								</div>

								<div class="col-sm-4">
									<div class="control form-floating">
										<input type="number" step="0.01" class="form-control"
											id="finance_amount" name="Finance_amount"
											placeholder="Finance Amount"
											value="<%=dto.getFinance_amount()%>" onblur="findDue();"
											required> <label for="finance_amount">Finance
											Amount</label>
										<div class="invalid-feedback">Please, Enter Finance
											Amount!</div>
									</div>
								</div>



								 <div class="col-md-2 col-4 ">
									<div class="control form-floating">
										<div class="file-form">
											<div class="d-flex justify-content-center">
												<img src="VehicleCustomerImage/<%=dto.getId()%>.jpg"
													id="preview-selected-image"
													onerror="this.src='assets/img/dummy.png'" class="preview"
													alt="No Photo" style="height: 60px; width: 60px;">
												<p id="error"></p>
											</div>
											<div class="pt-2 d-flex justify-content-around">
												<div style="display: none;">
													<input name="File" type="file" id="file"
														onchange="previewImage(event);">
												</div>
												<label for="file" id="file-label"
													title="Upload New
											Profile Picture"> <a
													class="btn btn-primary btn-sm"
													title="Upload new profile image"> <i
														class="bi bi-upload"></i>
												</a>
												</label>
											</div>
										</div>
									</div>
								</div> 
								<div class="col-md-6">
									<div class="form-control" style="height: 75px;">

										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												id="photo_status" name="Photo_status" value="Yes"
												<%if ("Yes".equals(dto.getPhoto_status())) {
												out.print("Checked='checked'");
											}%> />
											<label for="photo_status" style="font-size: 13px;">
												Passport photo submitted </label>
										</div>

										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												id="id_proof_status" name="Id_proof_status" value="Yes"
												<%if ("Yes".equals(dto.getId_proof_status())) {
												out.print("Checked='checked'");
											}%> />

											<label for="id_proof_status" style="font-size: 13px;">
												Aadhar Card copy submitted </label>
										</div>
									</div>
								</div>


								<div class="text-center">
									<button type="submit" class="submit-btn">Submit</button>
								</div>


							</form>
							<!-- End sold vehicle Form -->





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

		function findFin() {
			let sale_price = document.getElementById('sale_price').value;
			let due_sale_price = document.getElementById('due_sale_price').value;
			let finance_amount = sale_price - due_sale_price;

			if (due_sale_price >= 0) {

				document.getElementById('finance_amount').value = finance_amount
						.toFixed(2);
			} else {
				alert("Enter valid amount");
				document.getElementById('sale_price').value = 0.00;
				document.getElementById('due_sale_price').value = 0.00;
				document.getElementById('finance_amount').value = 0.00;
			}
		}

		function findDue() {
			let sale_price = document.getElementById('sale_price').value;
			let finance_amount = document.getElementById('finance_amount').value;
			//alert(sale_price);
			let due_sale_price = sale_price - finance_amount;

			if (finance_amount >= 0) {

				document.getElementById('due_sale_price').value = due_sale_price
						.toFixed(2);
			} else {
				alert("Enter valid amount");
				document.getElementById('sale_price').value = 0.00;
				document.getElementById('due_sale_price').value = 0.00;
				document.getElementById('finance_amount').value = 0.00;
			}
		}
	</script>

<script type="text/javascript">//Preview Image
function previewImage(event) {
	let reader = new FileReader();
	reader.onload = function() {
		let element = document.getElementById('preview-selected-image');
		element.src = reader.result;
	}
	reader.readAsDataURL(event.target.files[0]);
} 
</script>
	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>

</html>