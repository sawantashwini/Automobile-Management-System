<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.service.*"%>
<%@page import="com.dto.*"%>

<%
VehicleDueDto dto = new VehicleDueDto();

/* integer */

dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));

dto.setUser_id_fk(Integer.parseInt(request.getParameter("User_id_fk") == null ? "0" : request.getParameter("User_id_fk")));

dto.setVehicle_id_fk(Integer.parseInt(request.getParameter("Vehicle_id_fk") == null ? "0" : request.getParameter("Vehicle_id_fk")));

dto.setBank_id_fk(Integer.parseInt(request.getParameter("Bank_id_fk") == null ? "0" : request.getParameter("Bank_id_fk")));

/* float */

dto.setPay_amount(Float.parseFloat(request.getParameter("Paid_amount") == null || request.getParameter("Paid_amount") == null  ? "0.0" : request.getParameter("Paid_amount")));

dto.setCash_amount(Float.parseFloat(request.getParameter("Cash_amount") == null || request.getParameter("Cash_amount") == null ? "0.0" : request.getParameter("Cash_amount")));

dto.setOnline_amount(Float.parseFloat(request.getParameter("Online_amount") == null || request.getParameter("Online_amount") == null ? "0.0" : request.getParameter("Online_amount")));

/* String */

dto.setC_y_session(request.getParameter("C_y_session") == null ? "" : request.getParameter("C_y_session"));

dto.setPay_date(request.getParameter("Pay_date") == null ? "" : request.getParameter("Pay_date"));

dto.setRemark(request.getParameter("Remark") == null ? "" : request.getParameter("Remark"));

dto.setOnline_way(request.getParameter("Online_way") == null ? "" : request.getParameter("Online_way"));

dto.setOnline_remark(request.getParameter("Online_remark") == null ? "" : request.getParameter("Online_remark"));

dto.setOnline_date(request.getParameter("Online_date") == null ? "" : request.getParameter("Online_date"));

dto.setPayment_mode(request.getParameter("Payment_mode") == null ? "" : request.getParameter("Payment_mode"));

dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));
dto.setUpcoming_date(request.getParameter("Upcoming_date") == null ? "" : request.getParameter("Upcoming_date"));
dto.setUpcoming_remark(request.getParameter("Upcoming_remark") == null ? "" : request.getParameter("Upcoming_remark"));

//************PAYMENT DTO VALUES***********
PaymentDto pay_dto = new PaymentDto();


// Integer
pay_dto.setBill_id_fk(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));
pay_dto.setBank_id_fk(Integer.parseInt(request.getParameter("Bank_id_fk") == null ? "0" : request.getParameter("Bank_id_fk")));
//Float
pay_dto.setOnline_amount(Float.parseFloat(request.getParameter("Online_amount") == null || request.getParameter("Online_amount") == "" ? "0.0" : request.getParameter("Online_amount")));
pay_dto.setCash_amount(Float.parseFloat(request.getParameter("Cash_amount") == null || request.getParameter("Cash_amount") == "" ? "0.0" : request.getParameter("Cash_amount")));
// String
pay_dto.setRemark(request.getParameter("Remark") == null ? "" : request.getParameter("Remark"));
pay_dto.setOnline_remark(request.getParameter("Online_remark") == null ? "" : request.getParameter("Online_remark"));
pay_dto.setOnline_date(request.getParameter("Online_date") == null ? "" : request.getParameter("Online_date"));
pay_dto.setOnline_way(request.getParameter("Online_way") == null ? "" : request.getParameter("Online_way"));
pay_dto.setIn_date(request.getParameter("Pay_date") == null ? "" : request.getParameter("Pay_date"));
pay_dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));
pay_dto.setType("Vehicle Due");	


VehicleDueService service = new VehicleDueService();
boolean updatestatus = false;
int id=0;
if(dto.getId()==0){
	id = service.payVehicleDue(dto, pay_dto, request, config);
	if(id>0){updatestatus=true;}
}
else{
	
	updatestatus = service.updateVehicleDueInfo(dto, pay_dto, request, config);
	
}
/* System.out.println(id); */
%>
<input type="hidden" id="updatestatus" value="<%=updatestatus%>" />
<input type="hidden" id="return_id" value="<%=id%>" />