
<!-- ======= Header ======= -->
<%@include file="include/head.jsp"%>
<!-- ======= Header end======= -->

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
		<%@include file="breadcrumbs/othermodule.jsp"%>
		<!--  Breadcrumbs End-->


		<div class="row justify-content-center">
			<div class="pagetitle col-lg-10 text-center">
				<h1>Purchase Other</h1>
			</div>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-10">

					<div class="card" style="border-radius: 25px;">


						<div class="card-body">
							<br>

							<!-- Floating Labels Form -->
							<form autocomplete="off" action="PurchaeOtherServlet"
								enctype="multipart/form-data" method="post"
								class="row g-3 needs-validation"
								novalidate>
								<input type="hidden" id="c_y_session" name="C_y_session"
									value="<%=current_session%>">

								<div class="col-md-4 col-12 mb-2">
									<div class="control form-floating">
										<input type="hidden" name="User_id_fk" id="user_id_fk"
											value="<%=user_id%>"> <input type="date"
											class="form-control" id="bill_date" name="Bill_date"
											placeholder="Bill_date" value="<%=current_date%>" required>
										<label for="bill_date">Bill Date</label>
										<div class="invalid-feedback">Please, enter Bill Date!</div>
									</div>
								</div>
								<%-- <div class="col-md-4  d-flex justify-content-center">
									<div class="control form-floating mb-3 col-md-11 col-11">
										<div id="info"></div>

										<input type="text" class="form-control" list="datalist_name"
											id="name" name="Name" placeholder="Name"
											onblur="findInfoByName(this.value);" autocomplete="off" /> <input
											type="hidden" value="0">
										<datalist id="datalist_name">

											<%
											DealerOtherService service1 = new DealerOtherService();
											ArrayList<PurchaseOtherDto> list3 = service1.getActiveDealerOtherInfo(config, request);
											for (PurchaseOtherDto dto_deal : list3) {
											%>
											<option value="<%=dto_deal.getName()%>" />

											<%
											}
											%>
										</datalist>
										<label for="name">Name</label>

									</div>
									<div class="refresh_add" id="other_parent">
										<%@include file="include/refresh_add.jsp"%>
									</div>
								</div> --%>
<div class="col-md-4 refresh-container mb-3"
									data-add="add_dealer_other.jsp" data-list="other_dealer">
									<div class="control form-floating refresh-input">
										<input type="text" class="form-control" id="dealer_name"
											placeholder="Select Category"> <input type="hidden"
											id="dealer_id_fk" name="Dealer_id_fk" value="0" /> <label
											for="dealer_name">Select Dealer</label>
										<div class="invalid-feedback">Please, Select Dealer!</div>
									</div>
								</div>
								

								<div class="col-md-3 col-12 mb-2">
									<div class="control form-floating">
										<input type="number" step="0.01" class="form-control"
											id="total_amount" name="Total_amount"
											placeholder="total_amount" value="0" required> <label
											for="total_amount">Total amount</label>
									</div>
								</div>

								<div class="col-md-12 col-12 mb-2">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Remark"
											style="height: 70px;" id="remark" Name="Remark"></textarea>
										<label for="remark">Remark</label>
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
												</div>
											</div>
										</div>
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
	<script>
		//Preview Image
		function previewImage(event) {
			let reader = new FileReader();
			reader.onload = function() {
				let element = document.getElementById('preview-selected-image');
				element.src = reader.result;
			}
			reader.readAsDataURL(event.target.files[0]);
		}
		function findInfoByName(name) {

			if (name != "") {

				$
						.ajax({

							url : 'AjaxDealerOtherIdByName.jsp',
							data : 'name=' + name,
							type : 'post',
							success : function(msg) {

								// alert(msg);

								$('#info').html(msg);

								var check = document.getElementById("check").value;
								//alert(check);

								if (check == "done") {

									document.getElementById('dealer_id_fk').value = document
											.getElementById('id_val').value;

								} else {

									alert("Please Insert Right Name");
								}

							}
						});
			} else {

				alert("Please Insert Name");

			}
		}
		function refreshDealer(flag) {
			var name = document.getElementById('name').value;
			$.ajax({

				url : 'AjaxDesign/AjaxRefreshAvailItem.jsp',
				data : 'Flag=' + flag,
				type : 'post',
				success : function(msg) {

					//alert(msg);

					$('#datalist_name').html(msg);

					if (name != "") {
						document.getElementById('name').value = "";
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