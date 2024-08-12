<%@page import="com.service.LogFileService"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>

<%@page import="com.dto.*"%>
<%@page import="com.service.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<title>Sold Vehicle receipt</title>
<style>
a {
	text-decoration: none;
}

body {
	font-family: Arial, sans-serif;
	text-align: center;
}

.centered-container {
	max-width: 450px;
	margin: 0 auto;
}

.hotel-logo {
	max-width: 80px; /* Decreased logo width */
	float: left; /* Move logo to the left */
	margin-right: 20px; /* Add some space between logo and hotel info */
}

.hotel-logo img {
	width: 100%;
}

.hotel-info {
	display: flex;
	align-items: center;
	justify-content: center; /* Center-align hotel info */
	margin-bottom: 10px;
	/* Decreased margin between hotel info and customer details */
}

.hotel-details {
	text-align: left;
}

.hotel-name, .hotel-address, .hotel-mob {
	margin: 0; /* Remove default margins */
}

table {
	border-collapse: collapse;
	margin: 0 auto;
	width: 100%;
}

th, td {

	border: 1px solid black;
	padding: 4px 8px;
	/* text-align: left; */
	font-size: 12px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

.total-row {
	font-weight: bold;
}

h3 {
	font-size: 16px;
	margin: 6px;
}

.item_row td {
	border-right: 1px solid;
 
  border-top: none;
  border-bottom: none;
}
}

.item_row {
	/* border: 1px solid black; */
	border-left: 1px solid black;
	border-right: 1px solid black;
}

td, th {
	
}

.right {
	float: right;
	padding-right: 3px;
}

.left {
	float: left;
	padding-left: 3px;
}

.print-button {
	background: #ff3f00;
	color: #fff;
	border: none;
	padding: 6px 15px;
	border-radius: 5px;
	font-size: 18px;
	cursor: pointer;
	margin-top: 20px;
}

.print-button:hover {
	background: #f03c02;
}

.home-button {
	background: #4c4846;
	color: #fff;
	border: none;
	padding: 6px 15px;
	border-radius: 5px;
	font-size: 18px;
	cursor: pointer;
	margin-top: 20px;
}

.home-button:hover {
	background: #373534;
}

.rupee-symbol::before {
	content: "\20B9"; /* Unicode character for the Rupee symbol (₹) */
}

.cust-massage {
	font-size: 12px;
}
.align-left{
text-align: left;
width: 3%;}
.align-right{
text-align: right;
}
.input-width{

width: 20%;}
.height{
height: 15px}
.width{
width: 52%}
.widths{
width: 18%}
.amt-width{
width: 28%}
.remark-width{
width: 22%}
.border-right{
border-right: none;}
</style>

</head>
<body>
	<div class="centered-container">

		<%
		ProjectService project_ser = new ProjectService();
		ProjectDto project = project_ser.getProjectInfoById(1, config, request);
		%>
		<%
			NumberFormat format = new DecimalFormat("##.##");

			String Gst = request.getParameter("sadsafsaffdfsafdsadfsa") == null
					? ""
					: request.getParameter("sadsafsaffdfsafdsadfsa");

			int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
			VehicleInfoService service = new VehicleInfoService();

			VehicleInfoDto dto = service.getVehicleInfoById(id, config, request);

			
			%>
		
		<div style="float: left; width: 448px; border: 1px solid; border-bottom: none;">
				



				<div
					style="width: 100%; float: left; font-size: 20px; color: #000; text-align: center;">

					<div style="width: 20%; float: left; font-size: 19px;">
						<img src="ProjectImage/<%=project.getId()%>.jpg"
							onerror="this.src='assets/img/logo.jpg'"
							style="float: left; width: 80px;">
							<div style="float: left; width: 100%;">
					
					<div
						style="width: 100%; float: left; font-size: 11px; text-align: right; color: #000; padding: 0px 5px 0; display: none;">
						<b>Mobile -</b>9826607332
					</div>
				</div>
					</div>

					<div style="width: 60%; float: left; font-size: 21px;">




						<span
							style="font-size: 21px; width: 100%; float: left; margin-top: 5px;">
							<b style="color: #f00;"><%=project.getNAME()%></b>
						</span> <span
							style="font-size: 13px; width: 100%; float: left; margin-top: 5px;">
							Address : <%=project.getLocal_address()%></span> <span
							style="font-size: 13px; width: 100%; float: left; margin-top: 5px;">
							Mob. : <%=project.getMobile_no()%></span> <span
							style="font-size: 15px; width: 100%; float: left; margin-top: 10px;"><b>Invoice </b>
							
						</span>


					</div>



				</div>


			</div>
			 <%-- <h3 style="font-size: 15px;">Customer Details</h3> 
	
	 
		<table >
			<tr >
			<th class="align-right" width="3%;">Name:</th>
				<td class="align-left " width="80%;"><%=dto.getCustomer_name()%></td>
				
				<th class="align-right " width="2%">Mob.:</th>
				<td class="align-left input-width"><%=dto.getCustomer_mobile_no()%></td>
			</tr>
			
			
			<tr >
			
				<th class="align-right ">Add.:</th>
				<td class="align-left width"><%=dto.getCustomer_address()%></td>
				<th class="align-right">City:</th>
				<td class="input-width align-left"><%=dto.getCity_name()%></td>
			</tr>
			
		</table> --%>
	<table>
			<tr>
				<th class="align-right" width="3%;">Name:</th>
				<td class="align-left" style="width: 54%;"><%=dto.getCustomer_name()%></td>
				<th class="align-right ">Date:</th>
				<td class="input-width align-left"><%=LogFileService.changeFormate(dto.getPurchase_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>

			</tr>

			<tr>

				<th class="align-right " width="2%">Mob.:</th>
				<td class="align-left "  width="80%;"><%=dto.getCustomer_mobile_no()%></td>
				<th class="align-right">Invoice.:</th>
				<td class="input-width align-left"><%=dto.getInvoice_no()%></td>

			</tr>
			<tr>

				<th class="align-right ">Add.:</th>
				<td class="align-left " width="80%;"><%=dto.getCustomer_address()%></td>
				<th class="align-right">City.:</th>
				<td class="input-width align-left"><%=dto.getCity_name()%></td>
			</tr>

		</table>
		<h3 style="font-size: 15px;">Vehicles Details</h3> 
	<table >
			
				<tr>
			<th class="align-right" style="width: 17%;" >Chassis no.:</th>
				<td class="align-left " style="width: 25%;"><%=dto.getChassis_no()%></td>
			<th class="align-right "style="width: 15%;" >Company:</th>
				<td class=" align-left"style="width: 25%;"><%=dto.getBike_company_name()%></td>
			</tr>
			<tr>
				
			
				<th class="align-right ">Vehicle no:</th>
				<td class="align-left "><%=dto.getVehicle_no()%></td>
				<th class="align-right">Model:</th>
				<td class="align-left " ><%=dto.getModel_name()%></td>
			</tr>
			
			<tr >
				
				
				
					
				<th class="align-right ">Engine No.:</th>
				<td class="align-left "><%=dto.getEngine_no()%></td>
				
			<th class="align-right">Color:</th>
				<td class=" align-left"><%=dto.getColor_name()%></td>
				
			</tr>
			<tr >
			
				
			<th class="align-right ">Key no:</th>
				<td class="align-left "><%=dto.getKey_number()%></td>
				<th class="align-right ">Service no:</th>
				<td class="align-left "><%=dto.getService_book_no()%></td>
			</tr>
			
			<%-- <tr >
			
				<th class="align-right ">Charger no:</th>
				<td class="align-left "> <%=dto.getCharger_number()%></td>
					<th class="align-right">Remote no:</th>
				<td class=" align-left"> <%=dto.getRemote_no()%></td>
			
					
			</tr>
			
			<tr >
			
				<th class="align-right">Battery 1:</th>
				<td class=" align-left"><%=dto.getBattery1_no()%></td>
					<th class="align-right ">Battery 2:</th>
				<td class="align-left "> <%=dto.getBattery2_no()%></td>
			</tr>
			<tr >
			
				
				<th class="align-right">Battery 3:</th>
				<td class=" align-left"><%=dto.getBattery3_no()%></td>
				<th class="align-right ">Battery 4:</th>
				<td class="align-left widths"> <%=dto.getBattery4_no()%></td>
			</tr>
			<tr >
			
				
				<th class="align-right">Battery 5:</th>
				<td class=" align-left"><%=dto.getBattery5_no()%></td>
				<th class="align-right ">Battery 6:</th>
				<td class="align-left "> <%=dto.getBattery6_no()%></td>
			</tr> --%>
			
		
			
		</table>
 
	 

	<%--  <h3 style="font-size: 15px;">Customer Details</h3> 
	
	 
		<table >
			<tr >
			<th class="align-right" width="3%;">Name:</th>
				<td class="align-left " width="80%;"><%=dto.getCustomer_name()%></td>
				
				<th class="align-right " width="2%">Mob.:</th>
				<td class="align-left input-width"><%=dto.getCustomer_mobile_no()%></td>
			</tr>
			
			
			<tr >
			
				<th class="align-right ">Add.:</th>
				<td class="align-left width"><%=dto.getCustomer_address()%></td>
				<th class="align-right">City:</th>
				<td class="input-width align-left"><%=dto.getCity_name()%></td>
			</tr>
			
		</table> --%>

 <h3 style="font-size: 15px;">Sale Details</h3> 
		<table >
			<tr >
			<th class="align-right" width="12%;">Sale Price:</th>
				<td class="align-left widths" ><%=dto.getSale_price()%></td>
				
				<th class="align-right " width="10%;">Due Price.:</th>
				<td class="align-left input-width"><%=dto.getDue_sale_price()%></td>
			</tr>
			
			
			<tr >
			
				<th class="align-right ">Finance Amt:</th>
				<td class="align-left widths"><%=dto.getFinance_amount()%></td>
				<th class="align-right">Due Paid:</th>
				<td class="input-width align-left"><%=dto.getDue_sale_price_paid()%></td>
			</tr>
			
		</table>
	
	

	

	

<%-- <table><tr class="total-row" style="height: 35px;">
				<th class="remark-width align-right" >Paid Amount:</th>
				<td><span class="left"><%=dto.getCash_amount()+dto.getOnline_amount()%></span></td>
			</tr></table>
		

		<h3 >Payment Details</h3>

		<table>
			<tr class="total-row">
				<th>Mode:</th>
				<th>Cash:</th>
				<th>Online:</th>
				<th>Total:</th>
				

				<%
				if (dto.getPayment_mode().equalsIgnoreCase("Online") || dto.getPayment_mode().equalsIgnoreCase("Both")) {
				%>
				<th>On. Way :</th>
				<th>On. Date:</th>
				<%
				}
				%>
			</tr>
			<tr class="total-row">
				<td><%=dto.getPayment_mode() %></td>
				<td><span class="rupee-symbol"></span><%=dto.getCash_amount()%></td>
				<td><span class="rupee-symbol"></span><%=dto.getOnline_amount()%></td>
				<td><span class="rupee-symbol"></span><%=dto.getCash_amount()+dto.getOnline_amount()%></td>
			

				<%
				if (dto.getPayment_mode().equalsIgnoreCase("Online") || dto.getPayment_mode().equalsIgnoreCase("Both")) {
				%>

				<td><%=dto.getOnline_way()%></td>
				<td><%=LogFileService.changeFormate(dto.getOnline_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
				<%
				}
				%>
			</tr>

			<%
			if (dto.getPayment_mode().equalsIgnoreCase("Online") || dto.getPayment_mode().equalsIgnoreCase("Both")) {
			%>
			<%
			if (!dto.getOnline_remark().equalsIgnoreCase("N/A") && dto.getOnline_remark() != null) {
			%>
			<tr class="total-row">
				<th>On. Remark:</th>
				<td colspan="6"><span class="left"><%=dto.getOnline_remark()%></span></td>
			</tr>
			<%
			}
			%>
			<%
			}
			%>

			<%
			if (!dto.getRemark().equalsIgnoreCase("N/A") && dto.getRemark() != null) {
			%>
			<tr class="total-row">
				<th class="remark-width align-left">Remark:</th>
				<td colspan="6"><span class="left"><%=dto.getRemark()%></span></td>
				
			</tr>
			<%
			}
			%>

		</table>
		<table><tr class="total-row" >
				<th class="amt-width align-left" style="border-top: none;">Amount in Words:</th>
				<td style="border-top: none;"><span class="left" id="WordsAmount1"></span><span class="left">Rupees Only</span></td>
			</tr></table>
			Note:<%=project.getTerm_and_conditions()%>
			<script src="js/toword.js"></script>
			
			<script src="js/jquery-1.9.1.js"></script>
		<script>
			$().ready(function() {
				var aAmount = <%=Math.round(bill_dto.getTotal_amt_with_gst())%>;

				if (!isNaN(aAmount)) {
					aAmount = parseFloat(aAmount);
					var aVarText = "Rs. " + NumToWord(aAmount) + " Only.";
					document.getElementById("WordsAmount1").innerHTML = aVarText;
					//document.getElementById("WordsAmount2").innerHTML = aVarText;
				}
				NumToWord(<%=Math.round(dto.getCash_amount()+dto.getOnline_amount())%>,'WordsAmount1');
				
			});
			</script> --%>
			

		<%
		MsgService msg_ser = new MsgService();
		MsgDto msg_dto = msg_ser.getMsgInfoById(1, config, request);
		%>

		 <p class="cust-massage"><%=msg_dto.getName()%></p>   

		<button class="print-button" id="print-button" onclick="printBill()">Print</button>
		<a class="home-button" id="home-button" href="manage_sold_vehicle.jsp">Home</a>

	</div>

	<script>
		function printBill() {
			// Hide the print button
			var button = document.getElementById("print-button");
			button.style.display = "none";
			var homebutton = document.getElementById("home-button");
			homebutton.style.display = "none";

			// Print the document
			window.print();

			// Show the print button again after printing
			button.style.display = "";
			homebutton.style.display = "";
		}
	</script>
</body>
</html>

