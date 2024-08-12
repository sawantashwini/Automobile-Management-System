<!DOCTYPE html>
<%@page import="com.dto.*"%>
<%@page import="com.service.*"%>


<%@page import="javax.transaction.xa.XAResource"%>
<%@page import="com.service.LogFileService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>


<html>
<head>

<% 
	ProjectService project_h_ser = new ProjectService();
    	ProjectDto pro_h_dto = project_h_ser.getProjectInfoById(1 , config, request);
    %>

<title><%=pro_h_dto.getNAME() %></title>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />

<!-- Favicons -->
<link href="ProjectImage/<%=pro_h_dto.getId()%>.jpg" rel="icon">

<!-- Google Fonts -->

<style type="text/css">
.sbmit_blue {
	width: 110px;
	height: 25px;
	float: left;
	color: #FFFFFF;
	font-weight: bold;
	font-size: 13px;
	border-radius: 6px;
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from (          
		                         
		                  #003366), to(#00CCFF));
	background: -webkit-linear-gradient(top, #003366, #00CCFF);
	background: -moz-linear-gradient(top, #003366, #00CCFF);
	background: -ms-linear-gradient(top, #003366, #00CCFF);
	background: -o-linear-gradient(top, #003366, #00CCFF);
	background: -webkit-linear-gradient(top, #003366, #00CCFF);
	background: -moz-linear-gradient(top, #003366, #00CCFF);
	background: -ms-linear-gradient(top, #003366, #00CCFF);
	background: -webkit-linear-gradient(top, #003366, #00CCFF);
	background: -moz-linear-gradient(top, #003366, #00CCFF);
	background: -ms-linear-gradient(top, #003366, #00CCFF);
	background: -webkit-linear-gradient(top, #003366, #00CCFF);
	background: -moz-linear-gradient(top, #003366, #00CCFF);
	background: -ms-linear-gradient(top, #003366, #00CCFF);
}

/*--------------------------------------------------------------
# Submit button
--------------------------------------------------------------*/
.submit-btn {
	margin: 6px;
	margin-left: 25px;
	cursor: pointer;
	width: 110px;
	height: 30px;
	float: left;
	color: #FFFFFF;
	font-weight: bold;
	font-size: 13px;
	border-radius: 6px;
	color: #fff;
	background: #ff3f00;
	border: 0;
	border-radius: 10px;
	padding: 8px 20px;
}

.submit-btn:hover {
	color: #fff;
	background: #f03c02;
	border-radius: 10px;
	border: 0;
}

/*--------------------------------------------------------------
# Reset button
--------------------------------------------------------------*/
.reset-btn {
	margin: 6px;
	margin-left: 25px;
	cursor: pointer;
	width: 110px;
	height: 30px;
	float: left;
	color: #FFFFFF;
	font-weight: bold;
	font-size: 13px;
	border-radius: 6px;
	color: #fff;
	background: #4c4846;
	border: 0;
	border-radius: 10px;
	padding: 8px 24px;
}

.reset-btn:hover {
	color: #fff;
	background: #373534;
	border-radius: 10px;
	border: 0;
}
</style>
<style type="text/css">
#printable {
	display: none;
}

@media print {
	#non-printable {
		display: none;
	}
	#printable {
		display: block;
	}
}

.table>tbody>tr>td {
	border-top: none;
}
</style>

<script type="text/javascript">
	function NewPrint(Copies) {
		var Count = 0;
		while (Count < Copies) {
			window.print(0);
			Count++;
		}
	}
</script>

<script>
	function printform() {
		//alert("yes");
		var printContent = document.getElementById('wrapper').innerHTML;
		myWin = window
				.open(
						"",
						"print_window",
						"left=0,top=0,width=0,height=0,toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=yes,copyhistory=0,resizable=yes");
		myWin.document
				.write('<html><head><link rel="stylesheet" href="css/bootstrap.css" type="text/css" /><title>Receipt</title></head><body ><div>'
						+ printContent + '</div></body></html>');
		myWin.print();
		myWin.document.close();
	}
</script>

<%


ProjectService project_head_ser = new ProjectService();
ProjectDto project_head_dto = project_head_ser.getProjectInfoById(1, config, request);
%>

</head>
<body >
	<table>
		<tbody>
			<%
			

				NumberFormat format = new DecimalFormat("##.##");

				String Gst = request.getParameter("sadsafsaffdfsafdsadfsa") == null
						? ""
						: request.getParameter("sadsafsaffdfsafdsadfsa");

				
				int id = Integer.parseInt(request.getParameter("id") == null ? "0"
						: request.getParameter("id"));
				VehicleInfoService service = new VehicleInfoService();

				VehicleInfoDto dto = service.getVehicleInfoById(id, config, request);
				

				/* String igst_status = "";

				if (igst_status != null) {
					igst_status =dto.getIgst_status();
				}
 */			%>
			<tr>
				<td><div>
						<input class="reset-btn" value="Print" onclick="printform()"
							type="button">
					</div>
					<div>
						<a href="index.jsp"> <input value="Home" class="submit-btn"
							type="button">
						</a>
					</div></td>
			</tr>
		</tbody>
	</table>
	<div
		style="margin: 0 auto; width: 700px; font-family: 'Times New Roman', Times, serif;"
		id="wrapper">
		<div style="width: 700px; float: left; border: 1px solid;">


			<div
				style="float: left; width: 100%; border-bottom: 1px solid; margin-bottom: 10px;">
				<div style="float: left; width: 100%;">
					<div
						style="width: 50%; float: left; font-size: 11px; color: #000; padding: 5px 5px 0;">

						<%-- <%
						if (dto.getIgst_status().equalsIgnoreCase("yes")) {
						%>


						<b>GSTIN -</b> 12345

						<%
						}
						%> --%>
					</div>
					<div
						style="width: 100%; float: left; font-size: 11px; text-align: right; color: #000; padding: 5px 5px 0; display: none;">
						<b>Mobile -</b>9826607332
					</div>
				</div>



				<div
					style="width: 100%; float: left; font-size: 20px; color: #000; text-align: center;">

					<div style="width: 20%; float: left; font-size: 19px;">
						<img src="ProjectImage/<%=pro_h_dto.getId()%>.jpg"  onerror="this.src='assets/img/car.jpg'"
							style="margin: 30px; float: left; width: 80px;">
					</div>

					<div style="width: 60%; float: left; font-size: 21px;">




						<span
							style="font-size: 21px; width: 100%; float: left; margin-top: 5px;">
							<b style="color: #f00;"><%=project_head_dto.getNAME()%></b>
						</span> <span
							style="font-size: 15px; width: 100%; float: left; margin-top: 5px;">
							Address : <%=project_head_dto.getLocal_address()%></span> <span
							style="font-size: 13px; width: 100%; float: left; margin-top: 5px;">
							Mob. : <%=project_head_dto.getMobile_no()%></span> <span
							style="font-size: 15px; width: 100%; float: left; margin-top: 10px;">
							<b>Finance Invoice</b>
						</span> </span>


					</div>

					<div style="width: 20%; float: left; font-size: 19px;"></div>

				</div>


			</div>
			<!--head end-->


			<div>
				<h5 style="text-align: center; margin-top: 10px;">Vehicle
					Details</h5>
				<table
					style="width: 100%; border-bottom: 1px solid; margin-top: -15px;">



					<tbody>
						<tr style="text-align: left; font-size: 13px;">

							<td style="width: 10%;"><b>Model No.</b></td>

							<td style="width: 45%;">: <%=dto.getModel_name()%></td>

							<td style="width: 5%;"><b>Company</b></td>

							<td style="width: 95%;">: <%=dto.getBike_company_name()%></td>

						</tr>


						<tr style="text-align: left; font-size: 13px;">
							<td style="width: 10%;"><b>Chassis No.</b></td>

							<td style="width: 65%;">: <%=dto.getChassis_no()%></td>


							<td style="width: 5%;"><b>Color</td>

							<td style="width: 65%;">: <%=dto.getColor_name()%></td>
						</tr>

						<tr style="text-align: left; font-size: 13px;">
							<td style="width: 10%;"><b>Engine No.</b></td>

							<td style="width: 65%;">:<%=dto.getEngine_no()%></td>


							<td style="width: 10%;"><b>Vehicle No</b></td>

							<td style="width: 75%;">: <%=dto.getVehicle_no()%></td>

						</tr>

	<tr style="text-align: left; font-size: 13px;">

							<td style="width: 5%;"><b>Name</b></td>

							<td style="width: 65%;">: <%=dto.getCustomer_name()%></td>
								<td style="width: 10%;"><b>Mobile No</b></td>

							<td style="width: 90%;">: <%=dto.getCustomer_mobile_no()%></td>

							

						</tr>

					</tbody>
				</table>




			</div>

			<div style="width: 100%; float: left; border-top: 1px solid;">
				<div class="col-md-12" style="padding: 0px;">


					<div style="width: 68%">



						<div style="width: 100%; float: left;">
							<%
							if (dto.getFinance_bank_id_fk()>0) {
							%>

							<table style="width: 100%; line-height: 15px;">
								<tbody>

									<tr style="font-size: 11px;">
										<td style="padding-left: 2px; padding-top: 5px;" width="30%"><b>Bank
												Info</b></td>

									</tr>

									<tr style="font-size: 11px;"">
										<td style="padding-left: 2px;" valign="top" width="30%"><b>Bank-</b></td>
										<td style="padding-right: 2px;"><b><%=dto.getBank_name()%></b></td>

									</tr>
									<tr style="font-size: 11px;">
										<td style="padding-left: 2px;"><b>Acc. No-</b></td>
										<td style="padding-right: 2px;"><b><%=dto.getAccount_no()%></b></td>
									</tr>

									<tr style="font-size: 11px;"">
										<td style="padding-left: 2px;" width="30%"><b>IFC
												Code-</b></td>
										<td style="padding-right: 2px;"><b><%=dto.getIfsc_code()%></b></td>

									</tr>

								</tbody>

							</table>

							<%
							}
							%>







							<div style="width: 100%; float: left;">



								<table style="width: 100%; line-height: 15px;">
									<tbody>


										<tr style="font-size: 13px;"">
											<td style="padding-left: 2px;" valign="top" width="30%"><b>Remark-</b></td>
											<td style="padding-right: 2px; text-align: left;"><%=dto.getFinance_remark()%></td>

										</tr>



									</tbody>
								</table>
							</div>
						</div>

					</div>


					<div style="border-left: 1px solid; width: 30%; float: left;">
						<table style="width: 100%; line-height: 15px;">
							<tbody>






								<tr style="font-size: 12px;">
									<td align="right"><b>Pay date</b></td>
									<td align="right" style="padding-right: 2px;"><%=LogFileService.changeFormate(dto.getFinance_pay_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>

								</tr>

								<tr style="font-size: 12px;">
									<td align="right"><b>Finance amount</b></td>
									<td align="right" style="padding-right: 2px;"><%=dto.getFinance_amount()%></td>

								</tr>




								<tr style="font-size: 12px;">
									<td align="right"><b>Online date</b></td>
									<td align="right" style="padding-right: 2px;"><%=LogFileService.changeFormate(dto.getFinance_online_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>

								</tr>


								<tr style="font-size: 12px; border-bottom: 1px solid;">
									<td align="right"><b>Cheque No</b></td>
									<td align="right" style="padding-right: 2px; color: #f00;"><b><%=dto.getFinance_cheque_no()%></b></td>

								</tr>


								<tr style="font-size: 12px; border-bottom: 1px solid;">
									<td align="right"><b></b></td>
									<td align="right" style="padding-right: 2px;"></td>
								</tr>
								<tr style="font-size: 12px; border-bottom: 1px solid;">
									<td align="right"><b></b></td>
									<td align="right" style="padding-right: 2px;"></td>
								</tr>

								<tr style="font-size: 12px; border-bottom: 1px solid;">
									<td align="right"><b></b></td>
									<td align="right" style="padding-right: 2px;"></td>
								</tr>

								<tr style="font-size: 12px; border-bottom: 1px solid;">
									<td align="right"><b></b></td>
									<td align="right" style="padding-right: 2px;"></td>
								</tr>
	<tr style="font-size: 12px; border-bottom: 1px solid;">
									<td align="right"><b></b></td>
									<td align="right" style="padding-right: 2px;"></td>
								</tr>
									<tr style="font-size: 12px; border-bottom: 1px solid;">
									<td align="right"><b></b></td>
									<td align="right" style="padding-right: 2px;"></td>
								</tr>
									<tr style="font-size: 12px; border-bottom: 1px solid;">
									<td align="right"><b></b></td>
									<td align="right" style="padding-right: 2px;"></td>
								</tr>


							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div style="width: 100%; float: left;">
				<div style="width: 100%; float: left;">
					<div class="col-md-12"
						style="border-top: 1px solid #999; padding-top: 5px;">

						<b style="font-size: 14px;">Amount in Words -</b> <span
							id="WordsAmount1" valign="top"
							style="padding-left: 2px; font-size: 13px;"> </span> <span
							style="padding-left: 2px; font-size: 13px;">Only</span>




					</div>
				</div>
			</div>

		</div>
	</div>
	<script src="js/toword.js"></script>
	<!-- <script src="js/bootstrap.min.js"></script> -->
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
				NumToWord(<%=Math.round(dto.getFinance_amount())%>,'WordsAmount1');
				
			});
			</script>


</body>

</html>
