<%@include file="include/head.jsp"%>
</head>
<body>


	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->


	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->




	<main id="main" class="main">



		<%@include file="breadcrumbs/bank.jsp"%>

		<div class="pagetitle text-center">
			<h1 id="page_title">Bank Cash Credit Report</h1>
		</div>

		<section class="section">
			<div class="row">
				<div class="card" style="border-radius: 25px;">
					<div class="card-body table-responsive">

						<br>

						<table id="small_simple_table" class="table hover table-responsive nowrap" style="width: 100%;">
							<thead class="text-center" id="thead">
								<tr>
									<th style="width: 8%; text-align: center;">S.N0.</th>
									<th style="width: 18%; text-align: center;">In Date</th>
									<th style="width: 10%; text-align: center;">Bank Name</th>
									<th style="width: 10%; text-align: center;">Amount</th>
									<th style="width: 10%; text-align: center;">Remark</th>
									<th style="width: 8%; text-align: center;">Status</th>
									<th style="width: 8%; text-align: center;">Edit</th>

									<th style="width: 8%; text-align: center;">Delete</th>
								</tr>

							</thead>
							<tbody class="text-center" id="tbody">
								<%
								BankCashCreditService ser = new BankCashCreditService();
								ArrayList<BankDto> list1 = ser.getCashCreditInfo(config, request);
								for (BankDto dto : list1) {
								%>
								<tr>
									<td><%=list1.indexOf(dto) + 1%></td>
									<td><%=LogFileService.changeFormate(dto.getIn_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
									<td><%=dto.getCredit_bank_name()%></td>
									<td><%=dto.getCredit_amount()%></td>
									<td><%=dto.getRemark()%></td>
									<td class="main-color"><%=dto.getStatus()%></td>

									<td><a href="edit_bank_cash_credit.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>

									<td><a
										onclick="return confirm('Are you sure? You want to delete')"
										href="AjaxBankDelete.jsp?id=<%=dto.getId()%>&cash_id_fk=<%=dto.getCash_id_fk()%>&online_id_fk=<%=dto.getOnline_id_fk()%>&type=Bank_Cash"> <i
											class="bi bi-trash main-color"></i></a></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->
	
	<!-- print script without date -->
<script>
function printfunction(){
	var page_title=document.getElementById('page_title').innerHTML;
	
	
	
	return '<h1 style="text-align:center;margin-bottom:10px;">'+page_title+'</h1>';
	
}


function printTitle(){
	//alert("print");
	var page_title=document.getElementById('page_title').innerHTML;
	
	return page_title;
	
}
</script>
	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->
	<!-- ======= Footer ======= -->
	<%@include file="include/datatable_script_footer.jsp"%>
	<!-- End Footer -->

</body>

</html>