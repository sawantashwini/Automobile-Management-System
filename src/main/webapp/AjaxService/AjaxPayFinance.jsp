<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.service.*"%>
<%@page import="com.dto.*"%>

<%
VehicleInfoDto dto = new VehicleInfoDto();

dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));

dto.setUser_id_fk(Integer.parseInt(request.getParameter("User_id_fk") == null ? "0" : request.getParameter("User_id_fk")));

dto.setFinance_bank_id_fk(Integer.parseInt(request.getParameter("Finance_bank_id_fk") == null ? "0" : request.getParameter("Finance_bank_id_fk")));

dto.setFinance_amount(Float.parseFloat(request.getParameter("Finance_amount") == null || request.getParameter("Finance_amount") == "" ? "0.0" : request.getParameter("Finance_amount")));



dto.setFinance_online_date(request.getParameter("Finance_online_date") == null ? "" : request.getParameter("Finance_online_date"));

dto.setFinance_cheque_no(request.getParameter("Finance_cheque_no") == null ? "" : request.getParameter("Finance_cheque_no"));

dto.setFinance_pay_date(request.getParameter("Finance_pay_date") == null ? "" : request.getParameter("Finance_pay_date"));

dto.setFinance_remark(request.getParameter("Finance_remark") == null ? "" : request.getParameter("Finance_remark"));

PaymentDto pay_dto = new PaymentDto();

//************PAYMENT DTO VALUES***********
// Integer
pay_dto.setBill_id_fk(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));
pay_dto.setBank_id_fk(Integer.parseInt(request.getParameter("Finance_bank_id_fk") == null ? "0" : request.getParameter("Finance_bank_id_fk")));
//Float
pay_dto.setOnline_amount(Float.parseFloat(request.getParameter("Finance_amount") == null || request.getParameter("Finance_amount") == "" ? "0.0" : request.getParameter("Finance_amount")));
// String
pay_dto.setRemark(request.getParameter("Finance_remark") == null ? "" : request.getParameter("Finance_remark"));
pay_dto.setOnline_date(request.getParameter("Finance_online_date") == null ? "" : request.getParameter("Finance_online_date"));
pay_dto.setOnline_way("Check");
pay_dto.setOnline_remark(request.getParameter("Finance_cheque_no") == null ? "" : request.getParameter("Finance_cheque_no"));

pay_dto.setIn_date(request.getParameter("Finance_pay_date") == null ? "" : request.getParameter("Finance_pay_date"));
pay_dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));
pay_dto.setType("Vehicle Finance");


VehicleFinanceService service = new VehicleFinanceService();
boolean updatestatus =false;
updatestatus = service.updateVehicleFinance(pay_dto, dto, request, config);
System.out.println(updatestatus);
%>
<input type="hidden" id="updatestatus" value="<%=updatestatus%>" />