<%@page import="com.dto.JobCardDto"%>
<%@page import="com.service.JobCardService"%>

<%@page import="java.util.ArrayList"%>
	<!-- head -->
	<%@include file="include/head.jsp"%>
	<!-- head end -->
	</head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Automobile Management</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- ======= css ======= -->
<%@include file="include/css.jsp"%>
<!-- ======= css end======= -->
<script src="js/sell.js" type="text/javascript"></script>



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
				<h1>Edit Service Job Card</h1>
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
							JobCardService service = new JobCardService();

							JobCardDto dto = service.getJobCardInfoById(id, config, request);
							%>

							<!-- Floating Labels Form -->
							<form autocomplete="off" action="JobCardServlet" method="post"
								class="row g-3 needs-validation" novalidate>

								<input type="hidden" name="User_id_fk" id="user_id_fk"
											value="<%=user_id%>">
											
											<div class="col-sm-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="job_card_no"
											name="Job_card_no" placeholder="Job_card_no " 
											value="<%=dto.getJob_card_no()%>" required>
										<label for="job_card_no">Job card no</label>
										<div class="invalid-feedback">Please, Enter Job card no
											!</div>
									</div>
								</div>
								<!-- Customer Name Start -->
								<div class="col-sm-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="customer_name"
											name="Customer_name" placeholder="Customer Name"
											value="<%=dto.getCustomer_name()%>" required> <label
											for="customer_name">Customer Name</label>
										<div class="invalid-feedback">Please, Enter customer
											name!</div>
									</div>
								</div>
								<!-- Customer Name End -->
					
								<!-- Customer Mobile No. Start -->
								<div class="col-sm-6">
									<div class="control form-floating">
										<input type="text" class="form-control"
											id="customer_mobile_no" name="Customer_mobile_no"
											placeholder="Customer Mobile No."
											value="<%=dto.getCustomer_mobile_no()%>" required> <label
											for="customer_mobile_no">Customer Mobile No.</label>
										<div class="invalid-feedback">Please, Enter Customer
											Mobile No.!</div>
									</div>
								</div>
								<!-- Customer Mobile No. End -->

								<!-- Customer Address Start -->
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
								<!-- Customer Address End -->


								<input type="hidden" name="Id" value="<%=id%>">


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
									<div id="rev"></div>
										<input type="text" readonly class="form-control" id="chassis_no" onchange="checkChassisNo(this.value);"
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

								<!-- In Date Start -->
								<div class="col-sm-4">
									<div class="control form-floating">
										<input type="date" class="form-control" id="in_date"
											name="In_date" placeholder="in_date Date"
											value="<%=dto.getIn_date()%>" required value=""> <label
											for="in_date">In Date</label>
										<div class="invalid-feedback">Please, Enter In_date!</div>
									</div>
								</div>
								<!-- In Date End -->

								<!-- Due Date Start -->
								<div class="col-sm-4">
									<div class="control form-floating">
										<input type="date" class="form-control" id="out_date"
											name="Out_date" placeholder="Out Date"
											value="<%=dto.getOut_date()%>" required value=""> <label
											for="out_date">Due Date</label>
										<div class="invalid-feedback">Please, Enter Out Date!</div>
									</div>
								</div>
								<!-- Due Date End -->

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
<!-- Sales person Name Start -->
								<div class="col-sm-6">
									<div class="control form-floating">
										<input type="text" class="form-control" id="sales_person_name"
											name="Sales_person_name" placeholder="Sales_person_name " value="<%=dto.getSales_person_name()%>"  required>
										<label for="sales_person_name">Sales Person Name</label>
										<div class="invalid-feedback">Please, Enter Sales Person  
											name!</div>
									</div>
								</div>
								<!-- Customer Name End -->
								<!-- Working Start -->
								<div class="col-md-12">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="working"
											id="working" Name="Working" required style="height: 70px"><%=dto.getWorking()%></textarea>
										<label for="working"> Working</label>
										<div class="invalid-feedback">Please, Enter working!</div>
									</div>
								</div>
								<!-- Working End -->

								<!-- Remark Start -->
								<div class="col-md-12">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="remark"
											id="remark" Name="Remark" required style="height: 70px"><%=dto.getRemark()%></textarea>
										<label for="remark"> Remark</label>
										<div class="invalid-feedback">Please, Enter Remark!</div>
									</div>
								</div>
								<!-- Remark End -->

								<!-- Submit Start -->
								<div class="text-center">
									<button type="submit" class="submit-btn">Submit</button>
									
								</div>
								<!-- Submit End -->


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
<script >
		
		
function checkChassisNo() {
	var chassis_no=  document.getElementById("chassis_no").value;
	//alert("hello");

		$.ajax({
			url : 'Ajax_check_chassis_avail.jsp',
			data : 'chassis_no=' + chassis_no,
			type : 'post',
			success : function(msg) {

				// alert(msg);

				$('#rev').html(msg);
				var check_status = document.getElementById("check_status").value;
				var type = document.getElementById("type");
				//alert(check_status);
				if (check_status == "true") {
					var done_ser = Number(document.getElementById("done_ser").value);
					var ser_count = Number(document.getElementById("ser_count").value);
					var chasis_no_val =document.getElementById("chasis_no_val").value;
					if(done_ser<=ser_count){
					  document.getElementById("type").value = "Free";
					 
					}
					else if(chassis_no != chasis_no_val) {
						document.getElementById("type").value = "Paid";
					}
					else{
					 document.getElementById("type").value = "Paid";
					 
					}


				} else {
					 document.getElementById("type").value = "Paid";
					 
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