


<!-- ======= Footer ======= -->
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<footer id="footer" class="row footer">
	<div class="copyright col-lg-8 col-sm-12 ">
		&copy; Copyright: <span><a href="https://mykhandwa.com/">Madss
				software solution.</a></span> All Rights Reserved.
	</div>
	<div class="copyright-1 col-lg-4 col-sm-12 ">
		Developed By : <a href="#"> Madss Soft. Sol. Pvt. Ltd.</a>
	</div>
</footer>
<!-- End Footer -->

<a href="#"
	class="back-to-top d-flex align-items-center justify-content-center"><i
	class="fa fa-angle-double-up"></i></a>
<script src="assets/vendor/tinymce/tinymce.min.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/quill/quill.min.js"></script>
	<script type="text/javascript"
	src="assets/vendor/data table/js/jquery-3.6.0.min.js"></script>
 <script type="text/javascript">
 var currentHref = window.location.href;
 if(!currentHref.includes("service_bill.jsp") && !currentHref.includes("sell_bill.jsp")&& !currentHref.includes("edit_sell_bill.jsp") ){
	$('.submit-btn').click(function() {
		
					var paid_amount = parseFloat(document.getElementById("paid_amount").value);

				 if (paid_amount<=0) {
					 
					alert("Please Insert Amount");
					document.getElementById("online_amount").focus();
					document.getElementById("cash_amount").focus();
					event.preventDefault();
					return false;
				}
		

			});}
</script>  
<!-- <!-- Vendor JS Files
<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/chart.js/chart.min.js"></script>
<script src="assets/vendor/echarts/echarts.min.js"></script>
<script src="assets/vendor/quill/quill.min.js"></script>
<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>

<script src="assets/vendor/php-email-form/validate.js"></script>
<script type="text/javascript"
	src="/media/js/site.js?_=87a9e5380bcd291d5eea77cf210da433"
	data-domain="datatables.net"
	data-api="https://plausible.sprymedia.co.uk/api/event"></script>
<script type="text/javascript"
	src="/media/js/dynamic.php?comments-page=extensions%2Fbuttons%2Fexamples%2Finitialisation%2Fexport.html"></script>
<script src="https://media.ethicalads.io/media/client/ethicalads.min.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/jszip.min.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/pdfmake.min.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/vfs_fonts.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/buttons.html5.min.js"></script>
<script type="text/javascript"
	src="datatables/Buttons-2.2.3/js/buttons.colVis.min.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/buttons.print.min.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/buttons.colVis.min.js"></script>
<script type="text/javascript"
	src="../../../../examples/resources/demo.js"></script>

<script type="text/javascript" class="init">
	$(document).ready(
			function() {
				
				$('#example').DataTable(
						{     
							dom : 'lBfrtip',
							buttons : [  {
								extend : 'print',
								footer:true,
								title:'',
								messageTop:function(){return printfunction();},
								
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'excel',
								footer:true,
								title:function(){return printTitle();},
								messageTop:function(){return printOtherfunction();},
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'pdf',
								footer:true,
								title:function(){return printTitle();},
								messageTop:function(){return printOtherfunction();},
								exportOptions : {
									columns : ':visible'
								}
							},  'colvis',

							],
							lengthMenu : [
									[ 20, 50, 100, 500, -1 ],
									[ '20', '50', '100',
											'500', 'all' ] ],
							pagingType : 'full_numbers',
							responsive : true,
							scrollX : true
						});
			});
</script>


<script type="text/javascript" class="init">
	$(document).ready(
			function() {
				$('#example1').DataTable(
						{
							dom : 'lBfrtip',
							buttons : [  {
								extend : 'print',
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'excel',
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'pdf',
								exportOptions : {
									columns : ':visible'
								}
							},  'colvis',

							],
							lengthMenu : [
									[ 20, 50, 100, 500, -1 ],
									[ '20', '50', '100',
											'500', 'all' ] ],
							pagingType : 'full_numbers',
							responsive : true,
							scrollX : true
						});
			});
</script>
<script type="text/javascript" class="init">
	$(document).ready(
			function() {
				$('#large_simple_table,#annual_example,#tution_example,#bus_example,#previous_example').DataTable(
						{
							dom : 'lBfrtip',
							buttons : [ {
								extend : 'print',
								footer : true,
								title : '',
								messageTop : printfunction(),
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'excel',
								footer : true,
								title : printTitle(),
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'pdf',
								footer : true,
								title : printTitle(),
								exportOptions : {
									columns : ':visible'
								}
							}, 'colvis',

							],
							lengthMenu : [ [ 20, 50, 100, 500, -1 ],
									[ '20', '50', '100', '500', 'all' ] ],
							pagingType : 'full_numbers',
							responsive : true,
							scrollX : true
						});
			});
</script>

<script type="text/javascript" class="init">
	$(document).ready(
			function() {
				$('#example2').DataTable(
						{
							dom : 'lBfrtip',
							buttons : [  {
								extend : 'print',
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'excel',
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'pdf',
								exportOptions : {
									columns : ':visible'
								}
							},  'colvis',

							],
							lengthMenu : [
									[ 20, 50, 100, 500, -1 ],
									[ '20', '50', '100',
											'500', 'all' ] ],
							pagingType : 'full_numbers',
							responsive : true,
							scrollX : true
						});
			});
</script>


<script type="text/javascript" class="init">
	$(document).ready(
			function() {
				$('#example3').DataTable(
						{
							dom : 'lBfrtip',
							buttons : [  {
								extend : 'print',
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'excel',
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'pdf',
								exportOptions : {
									columns : ':visible'
								}
							},  'colvis',

							],
							lengthMenu : [
									[ 20, 50, 100, 500, -1 ],
									[ '20', '50', '100',
											'500', 'all' ] ],
							pagingType : 'full_numbers',
							responsive : true,
							scrollX : true
						});
			});
</script>


<script type="text/javascript" class="init">
	$(document).ready(
			function() {
				$('#example4').DataTable(
						{
							dom : 'lBfrtip',
							buttons : [  {
								extend : 'print',
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'excel',
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'pdf',
								exportOptions : {
									columns : ':visible'
								}
							},  'colvis',

							],
							lengthMenu : [
									[ 20, 50, 100, 500, -1 ],
									[ '20', '50', '100',
											'500', 'all' ] ],
							pagingType : 'full_numbers',
							responsive : true,
							scrollX : true
						});
			});
</script>


<script type="text/javascript" class="init">
	$(document).ready(
			function() {
				$('#example5').DataTable(
						{
							dom : 'lBfrtip',
							buttons : [  {
								extend : 'print',
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'excel',
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'pdf',
								exportOptions : {
									columns : ':visible'
								}
							},  'colvis',

							],
							lengthMenu : [
									[ 20, 50, 100, 500, -1 ],
									[ '20', '50', '100',
											'500', 'all' ] ],
							pagingType : 'full_numbers',
							responsive : true,
							scrollX : true
						});
			});
</script>


<script type="text/javascript" class="init">
	$(document).ready(
			function() {
				$('#example6').DataTable(
						{
							dom : 'lBfrtip',
							buttons : [  {
								extend : 'print',
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'excel',
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'pdf',
								exportOptions : {
									columns : ':visible'
								}
							},  'colvis',

							],
							lengthMenu : [
									[ 20, 50, 100, 500, -1 ],
									[ '20', '50', '100',
											'500', 'all' ] ],
							pagingType : 'full_numbers',
							responsive : true,
							scrollX : 
						});
			});
</script>

<script type="text/javascript" class="init">
	$(document).ready(
			function() {
				
				$('#example-small').DataTable(
						{     
							dom : 'lBfrtip',
							buttons : [  {
								extend : 'print',
								footer:true,
								title:'',
								messageTop:function(){return printfunction();},
								
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'excel',
								footer:true,
								title:function(){return printTitle();},
								
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'pdf',
								footer:true,
								title:function(){return printTitle();},
								
								exportOptions : {
									columns : ':visible'
								}
							},  'colvis',

							],
							lengthMenu : [
									[ 20, 50, 100, 500, -1 ],
									[ '20', '50', '100',
											'500', 'all' ] ],
							pagingType : 'full_numbers',
							responsive : true,
							scrollX : false
						});
			});
</script>

<script type="text/javascript" class="init">
	$(document).ready(
			function() {
				$('#small_simple_table').DataTable(
						{
							dom : 'lBfrtip',
							buttons : [ {
								extend : 'print',
								footer : true,
								title : '',
								messageTop : printfunction(),
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'excel',
								footer : true,
								title : printTitle(),
								exportOptions : {
									columns : ':visible'
								}
							}, {
								extend : 'pdf',
								footer : true,
								title : printTitle(),
								exportOptions : {
									columns : ':visible'
								}
							}, 'colvis',

							],
							lengthMenu : [ [ 20, 50, 100, 500, -1 ],
									[ '20', '50', '100', '500', 'all' ] ],
							pagingType : 'full_numbers',
							responsive : true,
							scrollX : true
						});
			});
</script> -->
<%
String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
String alert_title = "";
// Current link ke liye 
String[][] alertHrefs = { { "bank_cash_credit" }, { "bank_transaction" }, { "bank.jsp" },
		{ "city" }, { "color" }, { "company" }, { "customer.jsp","manage_customer.jsp" }, { "dealer_other.jsp","manage_dealer_other.jsp" }, { "dealer.jsp","manage_dealer.jsp" }, { "add_employee.jsp" }, 
		{ "income_head" }, { "income.jsp" }, { "item_category" }, { "item.jsp" },		
		{ "job_card" }, { "measurement" }, { "msg" }, { "purchase_other_bill" }, {"spend_head"}, {"spend.jsp"}, {"user.jsp"}, {"vehicle.jsp"},
		{"employee_attendence"}, {"manage_all_employee_salary"}, {"customer_due", "customer_upcoming_due"}, {"customer_sell_bill", "sell_bill.jsp"} ,
		{"dealer_all_bill"}, {"dealer_due"}, {"dealer_other_bills"}, {"dealer_other_due"}, {"employee_account"}, {"employee_salary"},
		{"manage_employee.jsp", "pay_all_employee_salary", "view_employee_attendance"}, {"project.jsp"}, {"purchase_bill_return"}, {"purchase_bill"},
		{"purchase_other_bill"}, {"sell_bill_return"}, 
		{"service_bill_upcoming_due", "manage_service_due"}, {"service_bill.jsp"}, {"sold_vehicle_upcoming_due", "vehicle_due"}, 
		{"manage_stock_item"}, {"manage_vehicle_finance"}, {"pay_amount_employee"}};

// alert ke liye 
String[] alertTitles = { "Bank Cash Credit", "Bank Transaction", "Bank", "City", "Color",
		"Company", "Customer", "Dealer Other", "Dealer", "Employee",
		"Income Head", "Income", "Item Category", "Item", "Job Card",
		"Measurement", "Msg", "Purchase Other" , "Spend Head", "Spend", "User", "Vehicle", "Attendence", "Emp Salary",
		"Customer Due" , "Sell Bill" , "Purchase Bill" , "Dealer Due", "Other Dealer Bills", "Other Dealer Due", "Emp Account",
		"Employee Salary", request.getParameter("alert_title"), "Project", "Purchase Bill Return", "Purchase Bill", 
		"Purchase Other", "Sell Bill Return", "Service Due", "Service Bill" , "Vehicle Due", "Stock Item", "Vehicle Finance",
		"Employee Transaction"};
String currentURL1 = request.getRequestURI();

for (int j = 0; j < alertHrefs.length; j++) {
	String alertTitle = alertTitles[j];
	String[] alertHref = alertHrefs[j];

	for (String alertTitleHref : alertHref) {
		if (currentURL1.contains(alertTitleHref)) {
			alert_title = alertTitle;
		}
	}
}
%>

<script type="text/javascript">



var msg = '<%=(msg != null) ? msg : ""%>';
var alert_title = '<%=(alert_title != null) ? alert_title : ""%>';

	function checkNameAvail(name, id, flag) {
		if(name!=''){
			$.ajax({
						url : 'AjaxService/AjaxCheckNameAvail.jsp',
						data : 'name=' + name + '&id=' + id + '&flag=' + flag ,
						type : 'post',
						success : function(msg) {
							//alert(msg);
							$('#name_avail_resposnse').html(msg);
							var check_name = document.getElementById("check_name").value;
							if (check_name == 'true') {
								document.getElementById('name').value = "";
								divIdNameAvail();
							}
						}
					});
	} else {
		alert("Please Insert Name");
		return false;
		document.getElementById('msg_alert').style.display = "none";
	}
	}
	function checkOnLoad(name, flag , class_name, last_line, icon_name) {
		
				$.ajax({
							url : 'AjaxService/AjaxCheckNameAvail.jsp',
							data : 'name=' + name + '&flag=' + flag 
							+ '&class_name=' + class_name + '&last_line='
							+ last_line + '&icon_name=' + icon_name,
							type : 'post',
							success : function(msg) {
								//alert(msg);
								$('#name_avail_resposnse').html(msg);
								var check_name = document.getElementById("check_name").value;
								if (check_name == 'false') {
									divIdNameAvail();
								}
							}
						});
		}
	$(document).ready(function() {
	    var msgMap = {
	        'Yes': ['Success',  alert_title, 'alert-success', 'Added Successfully', 'bi-check-circle'],
	        'No': ['UnSuccess',  alert_title, 'alert-danger', 'Not Added', 'bi-exclamation-octagon'],
	        'YesUp': ['Success',  alert_title, 'alert-success', 'Updated Successfully', 'bi-check-circle'],
	        'NoUp': ['UnSuccess',  alert_title, 'alert-danger', 'Not Updated', 'bi-exclamation-octagon'],
	        'YesDel': ['Success',  alert_title, 'alert-success', 'Deleted Successfully', 'bi-check-circle'],
	        'NoDel': ['UnSuccess',  alert_title, 'alert-danger', 'Not Deleted', 'bi-exclamation-octagon'],
	        'YesLogin': ['Success',  alert_title, 'alert-success', 'Login Successfully', 'bi-check-circle']
	    };

	    var values = msgMap[msg];

	    if (values) {
	    	checkOnLoad(...values);
	    }
	});

	
	
	function divIdNameAvail() {
		$("#name_avail_resposnse").hide().fadeIn();
		window.scrollTo(0, 0);
		hideSameAlert();
	}

	function hideSameAlert() {
		setTimeout(function() {
			$("#name_avail_resposnse").fadeOut();
		}, 3000);
	}
	
</script>
<script>
	function checkNameAvailsuv(item_code,id,flag){

		item_code = document.getElementById('item_code').value;
		
		if(item_code!=""){
			
			$.ajax({

				url : 'AjaxService/AjaxCheckNameAvail.jsp',
				data : 'item_code=' + item_code
				+ '&id=' + id
				+ '&flag=' + flag,
				type : 'post',
				success : function(msg) {

					//alert(msg);

					 $('#name_avail_resposnses').html(msg);
					 
					 var check = document.getElementById("check").value;
					if (check =='true') {
						document.getElementById('item_code').value= "";	
						document.getElementById('msg_alert').style.display= "none";	
						
					}
					

				}
			});
		} else {
			
			//alert("Please Insert Name");
			
			}

		
	}
	</script>



<script src="assets/js/main.js"></script>

<script src="js/payment.js"></script>
<script src="js/datalist-refresh.js"></script>
<script src="js/refresh_add.js"></script>






