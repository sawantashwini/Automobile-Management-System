
<!-- ======= css ======= -->
<%@include file="include/head.jsp"%>
<!-- ======= css end======= -->

</head>

<body >
	<div id="info"></div>

	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->

	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->

	<main id="main" class="main">

		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Edit Other Purchase</h1>
			</div>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-10">

					<div class="card">


						<div class="card-body">
							<br />

							<%
							int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
							String flag = request.getParameter("flag");
							PurchaeOtherService service = new PurchaeOtherService();
							PurchaseOtherDto dto = service.getPurchaeOtherInfoById(id, config, request);
							%>

							<!-- Floating Labels Form -->
							<form autocomplete="off" action="PurchaeOtherServlet"
								enctype="multipart/form-data" method="post"
								class="row g-3 needs-validation"
								novalidate>
								<input type="hidden" id="c_y_session" name="C_y_session"
									value="<%=current_session%>"> <input type="hidden"
									name="Id" value="<%=id%>"> <input type="hidden"
									name="Flag" id="flag" value="<%=flag%>"> <input
									type="hidden" name="User_id_fk" id="user_id_fk"
									value="<%=user_id%>"> <input type="hidden"
									name="Dealer_id_fk" id="dealer_id_fk"
									value="<%=dto.getDealer_id_fk()%>">

								<div class="col-md-4 col-12 mb-2">
									<div class="control form-floating">
										<input type="date" class="form-control" id="bill_date"
											name="Bill_date" placeholder="bill_date"
											value="<%=dto.getBill_date()%>" required> <label
											for="bill_date">Bill Date</label>
										<div class="invalid-feedback">Please, enter Bill date!</div>
									</div>
								</div>

								<div class="col-md-4  d-flex justify-content-center">



									<div class="control form-floating mb-3 col-md-11 col-11">
										<input readonly type="text" class="form-control"
											list="datalist_name" id="name" value="<%=dto.getName()%>"
											onblur="findInfoByName(this.value);" name="Name"
											placeholder="Name" autocomplete="off" />
										<datalist id="datalist_name">
											<%
											DealerOtherService service1 = new DealerOtherService();
											ArrayList<PurchaseOtherDto> list3 = service1.getActiveDealerOtherInfo(config, request);
											for (PurchaseOtherDto dto_path : list3) {
											%>
											<option value="<%=dto_path.getName()%>" />
											<%
											}
											%>
										</datalist>
										<label for="search_name">Name</label>
									</div>
									<div class="refresh_add" id="other_parent">
										<%@include file="include/refresh_add.jsp"%>
									</div>

								</div>


								<div class="col-md-3 col-12 mb-2">
									<div class="control form-floating">
										<input type="number" step="0.01" class="form-control"
											id="total_amount" name="Total_amount"
											placeholder="total_amount" value="<%=dto.getTotal_amount()%>"
											required> <label for="total_amount">Total
											amount</label>
									</div>
								</div>

								<div class="col-md-12 col-12 mb-2">
									<div class="control form-floating">
										<textarea class="form-control" placeholder="Remark"
											style="height: 70px;" id="remark" Name="Remark"><%=dto.getRemark()%></textarea>
										<label for="remark">Remark</label>
									</div>
								</div>

								<div class="d-flex justify-content-center">
									<div class="col-md-2">
										<div class="control form-floating">
											<div class="file-form" style="padding: 2%;">
												<div class="d-flex justify-content-center">
													<img src="PurchaseOtherImage/<%=dto.getId()%>.jpg"
														id="preview-selected-image"
														onerror="this.src='assets/img/dummy.png'" alt=""
														style="height: 80px; width: 80px;">
												</div>
												<div class="d-flex justify-content-center">
													<div class="pt-1 pb-1">
														<div style="display: none;">
															<input name="File" type="file" id="file"
																onchange="previewImage(event);">
														</div>
														<label for="file" id="file-label"> <a
															class="btn btn-primary btn-sm"
															title="Upload new profile image"> <i
																class="bi bi-upload"></i>
														</a>
														</label>
													</div>
													<%-- <div class="pt-1 pb-1" style="margin-left: 2px;">
														<a class="btn btn-primary btn-sm" title="download"
															href="PurchaseOtherImage/<%=dto.getId()%>.jpg" id="download"
															download><i class="fa-solid fa-download"></i> </a>
													</div> --%>
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

	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->
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
						document.getElementById('name').removeAttribute(
								'readonly')
						document.getElementById('name').value = "";

					}

				}
			});

		}
	</script>


</body>

</html>