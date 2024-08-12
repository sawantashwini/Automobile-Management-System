<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.*"%>
<%@page import="com.service.*"%>

<%@page import="java.io.File"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@include file="UserTrack.jsp"%>
<%@page import="com.dto.ProjectDto"%>
<%@page import="com.service.ProjectService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<%
ProjectService project_header_ser = new ProjectService();
ProjectDto project_dto = project_header_ser.getProjectInfoById(1, config, request);
%>



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script>
	window.location.hash = "no-back-button";
	window.location.hash = "Again-no-back-button";//for google chrome
	window.onhashchange = function() {
		window.location.hash = "no-back-button";
	};
</script>

<link href="css/carousel.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<link href="css/bootstrap.css" rel="stylesheet" />

<title><%=project_dto.getNAME()%></title>
<link href="ProjectImage/<%=project_dto.getId()%>.jpg" rel="icon" />


<style type="text/css">
.sbmit_blue {
	width: 110px;
	height: 25px;
	float: left;
	color: #FFFFFF;
	font-weight: bold;
	font-size: 13px;
	border-radius: 6px;
	background: -webkit-gradient(linear, 0% 0%, 0% 400px, from (      
		                                                               
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
				.write('<html><head><link href="css/carousel.css" rel="stylesheet" /><link href="css/style.css" rel="stylesheet" /><link href="css/bootstrap.css" rel="stylesheet" /><title>Receipt</title></head><body style="text-transform: capitalize;">'
						+ printContent + '</body></html>');
		myWin.print();
		myWin.document.close();
	}
</script>
</head>
<body style="text-transform: capitalize;">
	<div class="container-fluid">
		<div class="container">
			<div class="row" id="wrapper">


				<%
				NumberFormat format = new DecimalFormat("#");
				int value = Integer.parseInt(request.getParameter("value") == null ? "0" : request.getParameter("value"));

				if (value == 1) {
					String filename = "word.doc";
					File filepath = new File(filename);
					response.setContentType("application/vnd.ms-word");
					response.setHeader("Content-Disposition", "inline; filename=" + filepath);
				}

				String msg = request.getParameter("msg");
				int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
				EmployeeSalaryService service = new EmployeeSalaryService();

				EmployeeSalaryDto dto = service.getSalaryInfoById(id, config, request);
				%>

				<div style="background: #FFF; min-height: 420px; width: 720px;">
					<div
						style="width: 100%; font-size: 20px; color: #000; display: flex; justify-content: center; align-items: center;">

						<div
							style="width: 30%; height: 20%; display: flex; justify-content: normal; align-items: center;">
							<img src="ProjectImage/<%=project_dto.getId()%>.jpg" onerror="this.src='assets/img/car.jpg'" width="90px"
								height="90px" style="margin: 10px; text-align: rignt;">

						</div>

						<div style="width: 70%; text-align: left;">
							<span><b style="font-size: 22px;"><%=project_dto.getNAME()%></b>
							</span> <br> <span style="font-size: 15px; padding-left: 10%;">
								Address :- <%=project_dto.getLocal_address()%>
							</span> <br> <span style="font-size: 15px; padding-left: 5%;">
								Mobile No. :- <%=project_dto.getMobile_no()%>
							</span>

						</div>
					</div>

					<div
						style="color: #000; font-size: 13px; margin-top: 10px; font-weight: bold; border-top: 1px solid; border-bottom: 1px solid; text-align: center;">
						Employee Salary Reciept</div>


					<div class="table-responsive">

						<table class="table "
							style="margin-top: 10px; margin-bottom: 0px; font-weight: bold; font-size: 15px;">


							<tr>

								<td style="border: none; width: 15%"><b>Name </b></td>
								<td style="border: none; width: 54%">:&nbsp;&nbsp;<%=dto.getEmployee_name()%></td>
								<td style="border: none; width: 15%"><b>Receipt No</b></td>
								<td style="border: none; width: 15%">:&nbsp;&nbsp;S<%=id%></td>

							</tr>




							<tr>
								<td style="border: none; width: 15%"><b>Qualification </b></td>
								<td style="border: none; width: 54%">:&nbsp;&nbsp;<%=dto.getQualification()%></td>

								<td style="border: none; width: 15%"><b> Mobile no</b></td>
								<td style="border: none; width: 15%">:&nbsp;&nbsp;<%=dto.getMobile_no()%></td>
							</tr>
							<tr
								style="border: none; width: 15%; margin-top: 0px; padding-top: 0px; height: 30px;">
								<td
									style="border: none; width: 15%; margin-top: 0px; padding-top: 0px;"><b>Address
								</b></td>
								<td style="border: none; width: 58%;">:&nbsp;&nbsp;<%=dto.getAddress()%></td>
							</tr>
						</table>
					</div>
					<div>



						<table
							style="border: 1px solid #000; width: 725px; font-weight: bold;">


							<tr style="font-size: 13px;">
								<td width="20%" style="text-align: center;">Month Year</td>
								<td width="20%" style="text-align: center;">Pay Date</td>
							    <td width="20%" style="text-align: center;">Salary Per Month</td>
								<td width="15%" style="text-align: center;">Paid Salary</td>
							</tr>

							<%String monthString;
					        switch (Integer.parseInt(dto.getPaid_month())) {
				            case 1:  monthString = "January";       break;
				            case 2:  monthString = "February";      break;
				            case 3:  monthString = "March";         break;
				            case 4:  monthString = "April";         break;
				            case 5:  monthString = "May";           break;
				            case 6:  monthString = "June";          break;
				            case 7:  monthString = "July";          break;
				            case 8:  monthString = "August";        break;
				            case 9:  monthString = "September";     break;
				            case 10: monthString = "October";       break;
				            case 11: monthString = "November";      break;
				            case 12: monthString = "December";      break;
				            default: monthString = "Invalid month"; break;
				        } %>

							<tr style="font-size: 13px; margin-left: 20px;">
								<td style="text-align: center;"><%=monthString%>-<%=dto.getPaid_year()%></td>
								<td style="text-align: center;"><%=LogFileService.changeFormate(dto.getPay_date(), "yyyy-MM-dd", "dd-MMMM-yyyy")%></td>
								<td style="text-align: center;"><%=dto.getSalary_per_month()%></td>
								<td style="text-align: center;"><%=dto.getAmount()%></td>
							</tr>
						</table>
						<table
							style="border: 1px solid #000; width: 725px; font-weight: bold;">

							<tr style="font-size: 13px;">
								<td width="100%" style="text-align: center;">Employee
									Working Days Details</td>
							</tr>
						</table>
						<table
							style="border: 1px solid #000; width: 725px; font-weight: bold;">


							<tr style="font-size: 13px;">
								<td width="20%" style="text-align: center;">Leave Days</td>
								<td width="20%" style="text-align: center;">Half Days</td>
								<td width="25%" style="text-align: center;">Absent Days</td>
								<td width="15%" style="text-align: center;">Full Days</td>
								<td width="15%" style="text-align: center;">Total Days</td>
							</tr>

							<tr style="font-size: 13px; margin-left: 20px;">
								<td style="text-align: center;"><%=dto.getLeave_days()%></td>
								<td style="text-align: center;"><%=dto.getHalf_days()%></td>
								<td style="text-align: center;"><%=dto.getAbsent_days()%></td>
								<td style="text-align: center;"><%=dto.getPresent_days()%></td>
								<td style="text-align: center;"><%=dto.getTotal_days()%></td>
							</tr>
						</table>


						<table
							style="border: 1px solid #000; width: 725px; font-weight: bold;">

							<tr style="font-size: 13px;">
								<td width="100%" style="text-align: center;">Payment
									Details</td>
							</tr>
						</table>
						<table
							style="border: 1px solid #000; width: 725px; font-weight: bold;">

							<tr style="font-size: 13px;">
								<td width="15%" style="text-align: center;">Payment Mode</td>
								<!-- 
								<td width="20%" style="text-align: center;">Remark</td> -->

								<td width="25%" style="text-align: center;">Online Way</td>

								<td width="15%" style="text-align: center;">Online Date</td>

								<td width="20%" style="text-align: center;">Cash</td>

								<td width="20%" style="text-align: center;">Online</td>

								<td width="20%" style="text-align: center;">Total</td>
							</tr>

							<tr style="font-size: 13px; margin-left: 20px;">
								<td style="text-align: center;"><%=dto.getPayment_mode()%></td>
								<%-- <td style="text-align: center;"><%=dto.getRemark()%></td> --%>

								<td style="text-align: center;"><%=dto.getOnline_way()%></td>

								<td style="text-align: center;"><%=dto.getOnline_date()==null||dto.getOnline_date()==""||dto.getOnline_date()=="N/A" ? "N/A" : LogFileService.changeFormate(dto.getOnline_date(), "yyyy-MM-dd", "dd-MMMM-yyyy")%></td>

								<td style="text-align: center;"><%=dto.getCash_amount()%></td>

								<td style="text-align: center;"><%=dto.getOnline_amount()%></td>

								<td style="text-align: center;"><%=dto.getCash_amount() + dto.getOnline_amount()%></td>
							</tr>
						</table>
						<table style="margin-top: 5px; width: 700px; font-weight: bold;">

						</table>

						<table style="margin-left: 20px; width: 600px; font-weight: bold;">


							<tr style="font-size: 13px;">
								<td width="70%" style="text-align: left; vertical-align: top;">Rs.(In words) -<span
									id="WordsAmount1" style="padding-left: 2px; font-size: 14px;"></span>
									Only
								</td>

								<td width="30%" style="text-align: center;"></td>

							</tr>


						</table>
	<%
		MsgService msg_ser = new MsgService();
		MsgDto msg_dto = msg_ser.getMsgInfoById(1, config, request);
		%>

		
						<div
							style="text-align: right; margin-right: 10px; margin-top: 5px; font-weight: bold;">
							<br /> <span style="font-size: 13px;"><%=msg_dto.getName()%></span>
						</div>
					</div>
				</div>
			</div>
			<table>
				<tr>
					<td><input type="button" value="Print" class="reset-btn"
						onclick="printform()" /></td>
					<%-- <td><a
						href="MonthlyFeesReciept1.jsp?value=1&dfjafdkldfadhfjkadsfh=<%=request.getParameter("dfjafdkldfadhfjkadsfh")%>">
							<input class="sbmit_blue" type="button" value="Export to doc" />
					</a></td> --%>
					<td><a href="manage_employee.jsp"> <input type="button"
							value="Back" class="submit-btn" />
					</a></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="clearfix"></div>
	<script src="js/toword.js"></script>
	<script src="js/jquery-1.9.1.js"></script>


	<script type="text/javascript">
		$().ready(function() {

			NumToWord(
	<%=format.format(dto.getAmount())%>
		, 'WordsAmount1');

		});
	</script>

</body>
</html>