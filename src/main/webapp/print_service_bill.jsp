<%@page import="com.service.LogFileService"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="com.dto.MsgDto"%>
<%@page import="com.service.MsgService"%>
<%@page import="com.dto.ProjectDto"%>
<%@page import="com.service.ProjectService"%>
<%@page import="com.dto.ServiceBillDto"%>
<%@page import="com.service.ServiceBillService"%>
<%@page import="com.dto.ServiceBillItemDto"%>
<%@page import="com.service.ItemService"%>

<%@page import="com.service.JobCardService"%>
<%@page import="com.dto.JobCardDto"%>
<%@page import="com.dto.ItemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>Service Bill</title>
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
.align-right{
text-align: right;
}
.input-width{

width: 20%;}
.height{
height: 15px}
.width{
width: 78%}
.width1{
width: 35%}
.widths{
width: 24%}
.amt-width{
width: 23%}
.remark-width{
width: 15%}
.border-right{
border-right: none;}
.widthm{
width: 45%}
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

			ServiceBillService service = new ServiceBillService();
			ServiceBillDto bill_dto = service.getServiceBillInfoById(id, config, request);


			String igst_status = "";

			if (igst_status != null) {
				igst_status = bill_dto.getIgst_status();
			}
			%>
		
		<div style="float: left; width: 578px; border: 1px solid; border-bottom: none;">
				



				<div
					style="width: 100%; float: left; font-size: 20px; color: #000; text-align: center;">

					<div style="width: 20%; float: left; font-size: 19px;">
						<img src="ProjectImage/<%=project.getId()%>.jpg"
							onerror="this.src='assets/img/logo.jpg'"
							style="float: left; width: 80px;">
							<div style="float: left; width: 100%;">
					<div style="width: 90%; float: left; font-size: 11px; color: #000; padding: 0px 5px 0px;">
<%
						if (bill_dto.getGst_status().equalsIgnoreCase("yes")) {
						%>
<b>GSTIN -</b> 12345

						<%
						}
						%>
					</div>
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
							style="font-size: 15px; width: 100%; float: left; margin-top: 10px;"><b>INVOICE </b>
							
						</span>


					</div>



				</div>


			</div>

		
		<table >
			<tr >
			<th class="align-right">Model:</th>
				<td class="align-left width1" ><%=bill_dto.getModel_name()%></td>
				<th class="align-right " >Chasis no:</th>
				<td class=" align-left width1"><%=bill_dto.getChassis_no()%></td>
				
			</tr>
			
			<tr >
				
				<th class="align-right ">Engine no:</th>
				<td class="align-left width1 "><%=bill_dto.getEngine_no()%></td>
				<th class="align-right">Service type:</th>
				<td class=" align-left width1"><%=bill_dto.getType()%></td>
				
			</tr>
			
			
		</table>

		 <h3>Customer Details</h3> 
		<table >
			<tr >
			<th class="align-right">Name:</th>
				<td class="align-left width" ><%=bill_dto.getCustomer_name()%></td>
				<th class="align-right " >Date:</th>
				<td class="input-width align-left"><%=LogFileService.changeFormate(bill_dto.getBill_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
				
			</tr>
			
			<tr >
				
				<th class="align-right ">Mob.:</th>
				<td class="align-left width"><%=bill_dto.getCustomer_mobile_no()%></td>
				<th class="align-right">Invoice.:</th>
				<td class="input-width align-left"><%=bill_dto.getInvoice_no()%></td>
				
				
			</tr>
			<tr class="total-row" >
			
				<th  class=" align-right ">Add.:</th>
				<td  colspan="3"  class=" align-left" ><%=bill_dto.getCustomer_address()%></td>
				
			</tr>
			
		</table>


		<h3>Item Details</h3>
		
		<table >

			<tr>
				<th style="width: 0%;">No</th>
				<th style="width: 18%;">Name</th>
				<th style="width: 15%;">HSN</th>
				<th style="width: 10%;">Price.</th>
				<th style="width: 1%;">Dis(%)</th>
				<th style="width: 1%;">Dis.Price.</th>
				<th style="width: 1%;">Gst(%)</th>
				<th style="width: 5%;">Qty</th>
				<th style="width: 10%;">Amt</th>
			</tr>

			<%
			ArrayList<ServiceBillItemDto> list_bill = service.getServiceBIllItemInfoByBillId(id, config, request);
			int i = 1;
			for (ServiceBillItemDto item_dto : list_bill) {

				float item_price_with_dis = item_dto.getSell_base_price() - item_dto.getDiscount_per_amount();
				float gst_price = item_price_with_dis * item_dto.getGst_per() / 100;
						%>

			<tr class="item_row">
				<td align="center"><%=list_bill.indexOf(item_dto) + 1%></td>
							<td style="text-align: left;"><%=item_dto.getItem_name()%></td>
							<td align="center"><%=item_dto.getHsn_code()%></td>

							<td align="center"><%=item_dto.getSell_base_price()%></td>
							<td align="center"><%=item_dto.getDiscount_per()%></td>
							<td align="center"><%=item_price_with_dis%></td>
							<td align="center"><%=item_dto.getGst_per()%></td>
							<td align="center"><%=item_dto.getItem_qty()%></td>
							<td align="center"><%=Math.round(item_price_with_dis * item_dto.getItem_qty())%></td>
			</tr>
			<%
			}
			%>
			<tr class="item_row" height="30px;">
				<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>

							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"></td>	
			</tr>
			
			</table>
		
			<div style=" width: 51%; float: left;">
			<table>
			<tr class="total-row" >
			<td colspan="6" class="border-right"><span class="center">Bank Info</span></td>
			
			</tr>
<%
							if (bill_dto.getBank_id_fk() > 0) {
							%>
			<tr class="total-row">
				<td  class="widths"><span class="right ">Bank:</span></td>
				<td colspan="3" class="border-right"><span class="left "></span><%=bill_dto.getBank_name()%></td>
			</tr>
			
			<tr class="total-row">
				<td class="widths"><span class="right ">IFSC :</span></td>
				<td colspan="3" class="border-right"><span class="left "></span><%=bill_dto.getIfsc_code()%></td>
			</tr>
			<tr class="total-row">
				<td class="widths"><span class="right ">Acc. No:</span></td>
				<td colspan="3" class="border-right"><span class="left "></span><%=bill_dto.getAccount_no()%></td>
			</tr>
				<%
							} else {
							%>
								<tr class="total-row">
				<td   class="widths" ><span class="right ">Bank:</span></td>
				<td colspan="3" class="border-right"><span class="left "></span>-</td>
			</tr>
			
			<tr class="total-row">
				<td  class="widths"><span class="right ">IFSC:</span></td>
				<td colspan="3" class="border-right"><span class="left "></span>-</td>
			</tr>
			<tr class="total-row">
				<td class="widths"><span class="right ">Acc. No:</span></td>
				<td colspan="3" class="border-right"><span class="left "></span>-</td>
			</tr>
			<%
							}
							%>
			<%
								

								if (bill_dto.getDiscount_per()>0) {
								%>
				<tr class="total-row">
				<td class="widths"><span class="right height "></span></td>
				<td colspan="3" class="border-right"><span class="left "></span></td>
				
			</tr>
			<%} %>
			<%
								

								if (!"yes".equalsIgnoreCase(igst_status)) {
								%>
			<tr class="total-row">
				<td class="widths"><span class="right height "></span></td>
				<td colspan="3" class="border-right"><span class="left "></span></td>
			</tr>
			<%}%>
			<tr class="total-row">
				<td class="widths"><span class="right height"></span></td>
				<td colspan="3" class="border-right"><span class="left "></span></td>
			</tr>

			

		</table></div>
			
			<div style=" width: 49%; float: left;">
			<table>
			<tr class="total-row">
			<td class="widthm" ><span class="right">Taxable Value :</span></td>
				
				<td colspan="3" ><span ></span><%=format.format(bill_dto.getTotal_basic_amt())%></td>
			</tr>

			
			<%
								//	if(!bill_dto.getIgst_status().equalsIgnoreCase("yes")){

								if (!"yes".equalsIgnoreCase(igst_status)) {
								%>
			<tr class="total-row">
				<td class="widthm"><span class="right">CGST :</span></td>
				<td colspan="3" ><span class="rupee-symbol"></span><%=format.format(bill_dto.getTotal_gst_amt() / 2)%></td>
			</tr>
			<tr class="total-row">
				<td class="widthm"><span class="right">SGST :</span></td>
				<td colspan="3" ><span class="rupee-symbol"></span><%=format.format(bill_dto.getTotal_gst_amt() / 2)%></td>
			</tr>
			<%
			}else{
				%>
				<tr class="total-row">
				<td class="widthm"><span class="right">IGST :</span></td>
				<td colspan="3" ><span class="rupee-symbol"></span><%=format.format(bill_dto.getTotal_gst_amt())%></td>
			</tr>
			<% 
				}
			
			%>
			
			<tr class="total-row">
				<td class="widthm"><span class="right">Total Amount :</span></td>
				<td colspan="3"  style="color: #f00;"><span class="rupee-symbol"></span><%=format.format(bill_dto.getTotal_amt_with_gst())%></td>
			</tr>
			<%
								

								if (bill_dto.getDiscount_per()>0) {
								%>
			<tr class="total-row">
				<td class="width"><span class="right height">Dis(<%=format.format(bill_dto.getDiscount_per())%>%) :</span></td>
				<td colspan="3" ><span class="rupee-symbol"></span><%=format.format(bill_dto.getDiscount_amount())%></td>
			</tr>
<%} %>
			<tr class="total-row">
				<td class="widthm"><span class="right height ">Final Amt  :</span></td>
				<td colspan="3" ><span class="rupee-symbol"></span><%=Math.round(bill_dto.getFinal_amount())%></td>
			</tr>
<tr class="total-row">
				<td class="widthm"><span class="right height ">Total Paid :</span></td>
				<td colspan="3" ><span class="rupee-symbol"></span><%=format.format(bill_dto.getCash_amount() + bill_dto.getOnline_amount())%></td>
			</tr>
		</table></div>
			


<div style="width: 100%; float: left; margin-bottom: 5px;">
				<table style="width: 100%; line-height: 15px;">

					<thead>
						<tr>


							<th
								style="font-size: 12px; text-align: center; width: 20%; border-right: 1px solid #000;border-top: none;"
								rowspan="2"><b>Taxable Value</b></th>
							<%
							//	if(!bill_dto.getIgst_status().equalsIgnoreCase("yes")){

							if (!"yes".equalsIgnoreCase(igst_status)) {
							%>
							<th
								style="font-size: 12px; text-align: center; border-right: 1px solid #000; border-bottom: 1px solid #000;border-top: none;"
								colspan="2" width="40%"><b>CGST</b></th>

							<th
								style="font-size: 12px; text-align: center; border-bottom: 1px solid #000;border-top: none;"
								colspan="2" width="40%"><b>SGST</b></th>
							<%
							} else {
							%>
							<th
								style="font-size: 12px; text-align: center; border-bottom: 1px solid #000;border-top: none;"
								colspan="2" width="36%"><b>IGST</b></th>
							<%
							}
							%>
						</tr>

						<tr>

							<%
							//	if(!bill_dto.getIgst_status().equalsIgnoreCase("yes")){

							if (!"yes".equalsIgnoreCase(igst_status)) {
							%>
							<th
								style="font-size: 12px; text-align: center; width: 15%; border-right: 1px solid #000;">Rate</th>
							<th
								style="font-size: 12px; text-align: center; border-right: 1px solid #000;">Amt</th>

							<th
								style="font-size: 12px; text-align: center; width: 15%; border-right: 1px solid #000;">Rate</th>
							<th style="font-size: 12px; text-align: center;">Amt</th>
							<%
							} else {
							%>
							<th
								style="font-size: 12px; text-align: center; width: 20%; border-right: 1px solid #000;">Rate</th>
							<th style="font-size: 12px; text-align: center;">Amt</th>
							<%
							}
							%>
						</tr>
					</thead>
					<%
					//	if(!bill_dto.getIgst_status().equalsIgnoreCase("yes")){

					if (!"yes".equalsIgnoreCase(igst_status)) {
					%>
					<tbody>



						<%
						if (bill_dto.getTaxable_value_0() > 0) {
						%>

						<tr style="border-bottom: 1px solid #000; text-align: center;">


							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px; color: #f00;"><%=bill_dto.getTaxable_value_0()%></td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">0%</td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">0</td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">0%</td>


							<td style="border-top: 1px solid #000; font-size: 12px;">0</td>



						</tr>

						<%
						}

						if (bill_dto.getTaxable_value_5() > 0) {
						%>

						<tr style="border-bottom: 1px solid #000; text-align: center;">


							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px; color: #f00;"><%=bill_dto.getTaxable_value_5()%></td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">2.5%</td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;"><%=bill_dto.getGst_amount_5() / 2%></td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">2.5%</td>


							<td style="border-top: 1px solid; font-size: 12px;"><%=bill_dto.getGst_amount_5() / 2%></td>



						</tr>


						<%
						}

						if (bill_dto.getTaxable_value_12() > 0) {
						%>

						<tr style="border-bottom: 1px solid #000; text-align: center;">


							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px; color: #f00;"><%=bill_dto.getTaxable_value_12()%></td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">6%</td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;"><%=bill_dto.getGst_amount_12() / 2%></td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">6%</td>


							<td style="border-top: 1px solid #000; font-size: 12px;"><%=bill_dto.getGst_amount_12() / 2%></td>



						</tr>


						<%
						}

						if (bill_dto.getTaxable_value_18() > 0) {
						%>

						<tr style="border-bottom: 1px solid #000; text-align: center;">


							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px; color: #f00;"><%=bill_dto.getTaxable_value_18()%></td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">9%</td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;"><%=bill_dto.getGst_amount_18() / 2%></td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">9%</td>


							<td style="border-top: 1px solid #000; font-size: 12px;"><%=bill_dto.getGst_amount_18() / 2%></td>



						</tr>

						<%
						}

						if (bill_dto.getTaxable_value_28() > 0) {
						%>

						<tr style="border-bottom: 1px solid #000; text-align: center;">


							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px; color: #f00;"><%=bill_dto.getTaxable_value_28()%></td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">14%</td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;"><%=bill_dto.getGst_amount_28() / 2%></td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">14%</td>

							<td style="border-top: 1px solid #000; font-size: 12px;"><%=bill_dto.getGst_amount_28() / 2%></td>



						</tr>


						<%
						}
						%>



					</tbody>
					<%
					} else {
					%>
					<tbody>



						<%
						if (bill_dto.getTaxable_value_0() > 0) {
						%>

						<tr style="border-bottom: 1px solid #000; text-align: center;">


							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px; color: #f00;"><%=bill_dto.getTaxable_value_0()%></td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">0%</td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">0</td>




						</tr>

						<%
						}

						if (bill_dto.getTaxable_value_5() > 0) {
						%>

						<tr style="border-bottom: 1px solid #000; text-align: center;">


							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px; color: #f00;"><%=bill_dto.getTaxable_value_5()%></td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">2.5%</td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;"><%=bill_dto.getGst_amount_5()%></td>




						</tr>


						<%
						}

						if (bill_dto.getTaxable_value_12() > 0) {
						%>

						<tr style="border-bottom: 1px solid #000; text-align: center;">


							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px; color: #f00;"><%=bill_dto.getTaxable_value_12()%></td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">6%</td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;"><%=bill_dto.getGst_amount_12()%></td>




						</tr>


						<%
						}

						if (bill_dto.getTaxable_value_18() > 0) {
						%>

						<tr style="border-bottom: 1px solid #000; text-align: center;">


							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px; color: #f00;"><%=bill_dto.getTaxable_value_18()%></td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">9%</td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;"><%=bill_dto.getGst_amount_18()%></td>


						</tr>

						<%
						}

						if (bill_dto.getTaxable_value_28() > 0) {
						%>

						<tr style="border-bottom: 1px solid #000; text-align: center;">


							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px; color: #f00;"><%=bill_dto.getTaxable_value_28()%></td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;">14%</td>
							<td
								style="border-top: 1px solid #000; border-right: 1px solid #000; font-size: 12px;"><%=bill_dto.getGst_amount_28()%></td>



						</tr>


						<%
						}
						%>



					</tbody>
					<%
					}
					%>
				</table>

			</div>


		

		<h3 >Payment Details</h3>

		<table>
			<tr class="total-row">
				<th>Mode:</th>
				<th>Cash:</th>
				<th>Online:</th>
				<th>Total:</th>
				

				<%
				if (bill_dto.getPayment_mode().equalsIgnoreCase("Online") || bill_dto.getPayment_mode().equalsIgnoreCase("Both")) {
				%>
				<th>On. Way :</th>
				<th>On. Date:</th>
				<%
				}
				%>
			</tr>
			<tr class="total-row">
				<td><%=bill_dto.getPayment_mode() %></td>
				<td><span class="rupee-symbol"></span><%=bill_dto.getCash_amount()%></td>
				<td><span class="rupee-symbol"></span><%=bill_dto.getOnline_amount()%></td>
				<td><span class="rupee-symbol"></span><%=bill_dto.getPaid_amount()%></td>
			

				<%
				if (bill_dto.getPayment_mode().equalsIgnoreCase("Online") || bill_dto.getPayment_mode().equalsIgnoreCase("Both")) {
				%>

				<td><%=bill_dto.getOnline_way()%></td>
				<td><%=LogFileService.changeFormate(bill_dto.getOnline_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
				<%
				}
				%>
			</tr>

			<%
			if (bill_dto.getPayment_mode().equalsIgnoreCase("Online") || bill_dto.getPayment_mode().equalsIgnoreCase("Both")) {
			%>
			<%
			if (!bill_dto.getOnline_remark().equalsIgnoreCase("N/A") && bill_dto.getOnline_remark() != null) {
			%>
			<tr class="total-row">
				<th>On. Remark:</th>
				<td colspan="6"><span class="left"><%=bill_dto.getOnline_remark()%></span></td>
			</tr>
			<%
			}
			%>
			<%
			}
			%>

			<%
			if (!bill_dto.getRemark().equalsIgnoreCase("N/A") && bill_dto.getRemark() != null) {
			%>
			<tr class="total-row">
				<th class="remark-width align-left">Remark:</th>
				<td colspan="6"><span class="left"><%=bill_dto.getRemark()%></span></td>
				
			</tr>
			<%
			}
			%>

		</table>
		<table><tr class="total-row" >
				<th class="align-left amt-width" style="border-top: none;">Amount in Words:</th>
				<td style="border-top: none;"><span class="left" id="WordsAmount1"></span><span class="left">Rupees Only</span></td>
			</tr></table>
			<%-- Note:<%=project.getTerm_and_conditions()%> --%>
			<script src="js/toword.js"></script>
			
			<script src="js/jquery-1.9.1.js"></script>
		<script>
			$().ready(function() {
				<%-- var aAmount = <%=Math.round(bill_dto.getTotal_amt_with_gst())%>;

				if (!isNaN(aAmount)) {
					aAmount = parseFloat(aAmount);
					var aVarText = "Rs. " + NumToWord(aAmount) + " Only.";
					document.getElementById("WordsAmount1").innerHTML = aVarText;
					//document.getElementById("WordsAmount2").innerHTML = aVarText;
				} --%>
				NumToWord(<%=Math.round(bill_dto.getPaid_amount())%>,'WordsAmount1');
				
			});
			</script>
			
<%
		MsgService msg_ser = new MsgService();
		MsgDto msg_dto = msg_ser.getMsgInfoById(1, config, request);
		%>

		 <p class="cust-massage"><%=msg_dto.getName()%></p> 

		<button class="print-button" id="print-button" onclick="printBill()">Print</button>
		<a class="home-button" id="home-button" href="manage_service_bill.jsp">Home</a>

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

