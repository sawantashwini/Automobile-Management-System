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
<title>Purchase Vehicle receipt</title>
<style>
a {
	text-decoration: none;
}

body {
	font-family: Arial, sans-serif;
	text-align: center;
}

.centered-container {
	max-width: 580px;
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
	    width: 12%;
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
}
.input-width{

width: 20%;}
.height{
height: 15px}
.width{
width: 45%}
.widths{
width: 30%}
.amt-width{
width: 30%}
.remark-width{
width: 15%}
.border-right{
border-right: none;}
.align-right{
text-align: right;
}
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

			int id = Integer.parseInt(request.getParameter("id") == null ? "0"
					: request.getParameter("id"));
			VehicleInfoService service = new VehicleInfoService();

			VehicleInfoDto dto = service.getVehicleInfoById(id, config, request);
			

			
			%>
		
		<div style="float: left; width: 578px; border: 1px solid; border-bottom: none;">
				



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
							style="font-size: 15px; width: 100%; float: left; margin-top: 10px;"><b>Receipt </b>
							
						</span>


					</div>



				</div>


			</div>

		

		<!-- <h3>Vehicle  Details</h3> -->
		<table >
			<tr>
			<th class="align-right">Model:</th>
				<td class="align-left widths" ><%=dto.getModel_name()%></td>
				
				<th class="align-right " >Company:</th>
				<td class="input-width align-left"><%=dto.getBike_company_name()%></td>
				
			</tr>
			
			<tr >
				
				<th class="align-right ">Chassis.:</th>
				<td class="align-left widths"><%=dto.getChassis_no()%></td>
				<th class="align-right">Color:</th>
				<td class="input-width align-left"><%=dto.getColor_name()%></td>
				
			</tr>
			<tr >
				
				<th class="align-right ">Engine No.:</th>
				<td class="align-left widths"><%=dto.getEngine_no()%></td>
				<th class="align-right">Invoice:</th>
				<td class="input-width align-left"><%=dto.getInvoice_no()%></td>
				
			</tr>
			<tr >
			
				<th class="align-right ">Converter no:</th>
				<td class="align-left widths"> <%=dto.getConverter_no()%></td>
				<th class="align-right">Controller no:</th>
				<td class="input-width align-left"><%=dto.getController_no()%></td>
			</tr>
			
			<tr >
			
				<th class="align-right ">Charger no:</th>
				<td class="align-left widths"> <%=dto.getCharger_number()%></td>
				<th class="align-right">Remote no:</th>
				<td class="input-width align-left"> <%=dto.getRemote_no()%></td>
			</tr>
			<tr >
			
				<th class="align-right ">Key no:</th>
				<td class="align-left widths"><%=dto.getKey_number()%></td>
				<th class="align-right">Date:</th>
				<td class="input-width align-left"><%=LogFileService.changeFormate(dto.getPurchase_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
			</tr>
			<tr >
			
				<th class="align-right ">Vehicle no:</th>
				<td class="align-left widths"><%=dto.getVehicle_no()%></td>
				<th class="align-right">Battery 1:</th>
				<td class="input-width align-left"><%=dto.getBattery1_no()%></td>
			</tr>
			<tr >
			
				<th class="align-right ">Battery 2:</th>
				<td class="align-left widths"> <%=dto.getBattery2_no()%></td>
				<th class="align-right">Battery 3:</th>
				<td class="input-width align-left"><%=dto.getBattery3_no()%></td>
			</tr>
			<tr >
			
				<th class="align-right ">Battery 4:</th>
				<td class="align-left widths"> <%=dto.getBattery4_no()%></td>
				<th class="align-right">Battery 5:</th>
				<td class="input-width align-left"><%=dto.getBattery5_no()%></td>
			</tr>
			<tr >
			
				<th class="align-right ">Battery 6:</th>
				<td class="align-left widths"> <%=dto.getBattery6_no()%></td>
				<th class="align-right">Pur. Price:</th>
				<td class="input-width align-left"><%=dto.getPurchase_price()%></td>
			</tr>
		</table>



	
			<%-- Note:<%=project.getTerm_and_conditions()%> --%>
			<script src="js/toword.js"></script>
			
			<script src="js/jquery-1.9.1.js"></script>
		
			

		<%
		MsgService msg_ser = new MsgService();
		MsgDto msg_dto = msg_ser.getMsgInfoById(1, config, request);
		%>

		 <p class="cust-massage"><%=msg_dto.getName()%></p> 

		<button class="print-button" id="print-button" onclick="printBill()">Print</button>
		<a class="home-button" id="home-button" href="manage_stock_vehicle.jsp">Home</a>

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

