<!DOCTYPE html>
<%@page import="javax.transaction.xa.XAResource"%>
<%@page import="com.dto.*"%>
<%@page import="com.service.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<html>
<head>

<%
ProjectService project_h_ser = new ProjectService();
ProjectDto pro_h_dto = project_h_ser.getProjectInfoById(1, config, request);
%>

<title><%=pro_h_dto.getNAME()%></title>


<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />

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
	color: #fff;
	background: #ff3f00;
	border: 0;
	border-radius: 10px;
	padding: 8px 24px;
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
<script src="js/toword.js"></script>
<script type="text/javascript">
	function NewPrint(Copies) {
		var Count = 0;
		while (Count < Copies) {
			window.print(0);
			Count++;
		}
	}
</script>

<script src="js/toword.js"></script>


<script src="js/jquery-1.9.1.js"></script>
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


</head>
<body >
	<%
	String cur_date = LogFileService.changeFormateOfCurrentDate("yyyy-MM-dd HH:mm");

	int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));

	DealerOtherService service = new DealerOtherService();
	PurchaseOtherDto dto = service.getDealerDueInfoById(id, config, request);
	%>

	<table>
		<tbody>

			<tr>
				<td><div style="width: 85px;">
						<input class="submit-btn" value="Print" onclick="printform()"
							style="width: 85px;" type="button">
					</div>
					<div style="width: 85px; margin-top: 5px;">
						<a href="manage_dealer_other_due.jsp?id=<%=dto.getDealer_id_fk()%>"> <input value="Go back"
							class="reset-btn" type="button">
						</a>
					</div></td>
			</tr>
		</tbody>
	</table>
	<div
		style="margin: 0 auto; width: 780px; font-family: 'Times New Roman', Times, serif;"
		id="wrapper">
		<div style="width: 100%; float: left;">



			<div style="width: 100%; height: 122px;"></div>




			<div>







				<div style="width: 7%; font-size: 15px; float: left;">



					<div>
						<b>Name </b>
					</div>

					<div>
						<b>Mobile </b>
					</div>




				</div>


				<div style="float: left; width: 60%; font-size: 15px;">





					<div>
						<b> : <%=dto.getName()%></b>
					</div>


					<div>
						<b> : <%=dto.getMobile_no()%></b>
					</div>

				</div>



				<div style="width: 8%; font-size: 15px; float: left;">



					<div>
						<b>GST no </b>
					</div>

					<div>
						<b>Date </b>
					</div>


				</div>


				<div style="width: 25%; font-size: 15px; float: right;">



					<div>
						<b> : <span style="text-transform: capitalize;"><%=dto.getGst_no()%></span>
						</b>
					</div>


					<div>

						<b>: <span style="text-transform: capitalize;"><%=LogFileService.changeFormate(dto.getCurrent_in_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></span></b>
					</div>

				</div>


			</div>






			<!--head end-->

			<div style="width: 780px; float: left;">
				<hr style="height: 1px; background: #000;">

				<table style="width: 780px;">


					<tbody>

						<tr
							style="border-bottom: 1px solid; text-align: left; font-size: 14px;">
							<td></td>
							<td style="font-weight: bold;">Paid amount</td>

							<td><%=dto.getPay_amount()%></td>


							<%-- <td> <%=dto.getVdrl()%></td> --%>
							<td></td>
						</tr>


					</tbody>


				</table>


				<div>
					<hr style="height: 1px; background: #000;">
				</div>
				<%
				if (!dto.getRemark().equalsIgnoreCase("N/A")) {
				%>

				<div style="margin-left: 15px;"><%=dto.getRemark()%></div>


			</div>

			<%
			}
			%>

		</div>





		<div style="width: 100%; float: left; display: none;">
			<div class="col-md-12" style="padding: 0px;">
				<br>
				<div class="col-md-5 col-sm-5 col-xs-5">
					<div style="width: 100%; float: left; font-size: 11px;">
						<!-- <b>Patient Signature</b> -->

					</div>
				</div>
				<div class="col-md-7 col-sm-7 col-xs-7">
					<div
						style="width: 100%; float: left; text-align: right; font-size: 11px;">
						<b> For- Sng </b>

					</div>
				</div>

			</div>
		</div>




	</div>

</body>
<script type="text/javascript">
	
</script>
</html>
