<%@page import="com.dto.PaymentDto"%>
<%@page import="com.dto.ServiceBillDto"%>
<%@page import="com.service.ServiceBillService"%>
<%@page import="com.dto.ServiceBillItemDto"%>
<%
ServiceBillDto dto = new ServiceBillDto();
ServiceBillService ser = new ServiceBillService();

// Integer
dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));

dto.setBank_id_fk(
		Integer.parseInt(request.getParameter("Bank_id_fk") == null ? "0" : request.getParameter("Bank_id_fk")));

dto.setUser_id_fk(
		Integer.parseInt(request.getParameter("User_id_fk") == null ? "0" : request.getParameter("User_id_fk")));

dto.setJob_card_id_fk(Integer
		.parseInt(request.getParameter("Job_card_id_fk") == null ? "0" : request.getParameter("Job_card_id_fk")));

// String
dto.setInvoice_no(request.getParameter("Invoice_no") == null ? "" : request.getParameter("Invoice_no"));

dto.setBill_date(request.getParameter("Bill_date") == null ? "" : request.getParameter("Bill_date"));

dto.setC_y_session(request.getParameter("C_y_session") == null ? "" : request.getParameter("C_y_session"));

dto.setGst_status(request.getParameter("Gst_status") == null ? "No" : request.getParameter("Gst_status"));

dto.setIgst_status(request.getParameter("Igst_status") == null ? "No" : request.getParameter("Igst_status"));

dto.setRemark(request.getParameter("Remark") == null ? "" : request.getParameter("Remark"));
dto.setUpcoming_date(request.getParameter("Upcoming_date") == null ? "" : request.getParameter("Upcoming_date"));
dto.setUpcoming_remark(request.getParameter("Upcoming_remark") == null ? "" : request.getParameter("Upcoming_remark"));

dto.setPayment_mode(request.getParameter("Payment_mode") == null ? "" : request.getParameter("Payment_mode"));

dto.setOnline_way(request.getParameter("Online_way") == null ? "" : request.getParameter("Online_way"));

dto.setOnline_remark(request.getParameter("Online_remark") == null ? "" : request.getParameter("Online_remark"));

dto.setOnline_date(request.getParameter("Online_date") == null ? "" : request.getParameter("Online_date"));

dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));
//Float
dto.setTotal_basic_amt(Float
		.parseFloat(request.getParameter("Total_basic_amt") == null || request.getParameter("Total_basic_amt") == "" ? "0.0" : request.getParameter("Total_basic_amt")));

dto.setDiscount_per(
		Float.parseFloat(request.getParameter("Discount_per") == null || request.getParameter("Discount_per") == "" ? "0.0" : request.getParameter("Discount_per")));

dto.setPaid_amount(
		Float.parseFloat(request.getParameter("Paid_amount") == null || request.getParameter("Paid_amount") == "" ? "0.0" : request.getParameter("Paid_amount")));

dto.setCash_amount(
		Float.parseFloat(request.getParameter("Cash_amount") == null || request.getParameter("Cash_amount") == "" ? "0.0" : request.getParameter("Cash_amount")));

dto.setOnline_amount(Float
		.parseFloat(request.getParameter("Online_amount") == null || request.getParameter("Online_amount") == "" ? "0.0" : request.getParameter("Online_amount")));

dto.setTotal_gst_amt(Float
		.parseFloat(request.getParameter("Total_gst_amt") == null || request.getParameter("Total_gst_amt") == "" ? "0.0" : request.getParameter("Total_gst_amt")));

dto.setTotal_amt_with_gst(Float.parseFloat(
		request.getParameter("Total_amt_with_gst") == null || request.getParameter("Total_amt_with_gst") == "" ? "0.0" : request.getParameter("Total_amt_with_gst")));

dto.setDiscount_amount(Float
		.parseFloat(request.getParameter("Discount_amount") == null || request.getParameter("Discount_amount") == "" ? "0.0" : request.getParameter("Discount_amount")));

dto.setLabour_charge(Float
		.parseFloat(request.getParameter("Labour_charge") == null || request.getParameter("Labour_charge") == "" ? "0.0" : request.getParameter("Labour_charge")));

dto.setOther_charge(
		Float.parseFloat(request.getParameter("Other_charge") == null || request.getParameter("Other_charge") == "" ? "0.0" : request.getParameter("Other_charge")));

dto.setFinal_amount(
		Float.parseFloat(request.getParameter("Final_amount") == null || request.getParameter("Final_amount") == "" ? "0.0" : request.getParameter("Final_amount")));

dto.setTaxable_value_0(Float
		.parseFloat(request.getParameter("Taxable_value_0") == null || request.getParameter("Taxable_value_0") == "" ? "0.0" : request.getParameter("Taxable_value_0")));

dto.setGst_amount_5(
		Float.parseFloat(request.getParameter("Gst_amount_5") == null || request.getParameter("Gst_amount_5") == "" ? "0.0" : request.getParameter("Gst_amount_5")));

dto.setTaxable_value_5(Float
		.parseFloat(request.getParameter("Taxable_value_5") == null || request.getParameter("Taxable_value_5") == "" ? "0.0" : request.getParameter("Taxable_value_5")));

dto.setGst_amount_12(Float
		.parseFloat(request.getParameter("Gst_amount_12") == null || request.getParameter("Gst_amount_12") == "" ? "0.0" : request.getParameter("Gst_amount_12")));

dto.setTaxable_value_12(Float.parseFloat(
		request.getParameter("Taxable_value_12") == null || request.getParameter("Taxable_value_12") == "" ? "0.0" : request.getParameter("Taxable_value_12")));

dto.setGst_amount_18(Float
		.parseFloat(request.getParameter("Gst_amount_18") == null || request.getParameter("Gst_amount_18") == "" ? "0.0" : request.getParameter("Gst_amount_18")));

dto.setTaxable_value_18(Float.parseFloat(
		request.getParameter("Taxable_value_18") == null || request.getParameter("Taxable_value_18") == "" ? "0.0" : request.getParameter("Taxable_value_18")));

dto.setGst_amount_28(Float
		.parseFloat(request.getParameter("Gst_amount_28") == null || request.getParameter("Gst_amount_28") == "" ? "0.0" : request.getParameter("Gst_amount_28")));
dto.setBill_time_amt(Float
		.parseFloat(request.getParameter("Paid_amount") == null || request.getParameter("Paid_amount") == "" ? "0.0" : request.getParameter("Paid_amount")));

dto.setTaxable_value_28(Float.parseFloat(
		request.getParameter("Taxable_value_28") == null || request.getParameter("Taxable_value_28") == "" ? "0.0" : request.getParameter("Taxable_value_28")));

//Job card details

dto.setCustomer_name(request.getParameter("Customer_name") == null ? "" : request.getParameter("Customer_name"));

dto.setCustomer_mobile_no(
		request.getParameter("Customer_mobile_no") == null ? "" : request.getParameter("Customer_mobile_no"));

dto.setCustomer_address(
		request.getParameter("Customer_address") == null ? "" : request.getParameter("Customer_address"));

dto.setModel_name(request.getParameter("Model_name") == null ? "" : request.getParameter("Model_name"));

dto.setChassis_no(request.getParameter("Chassis_no") == null ? "" : request.getParameter("Chassis_no"));

dto.setEngine_no(request.getParameter("Engine_no") == null ? "" : request.getParameter("Engine_no"));

dto.setType(request.getParameter("Type") == null ? "" : request.getParameter("Type"));

//************PAYMENT DTO VALUES***********
PaymentDto pay_dto = new PaymentDto();

// Integer
pay_dto.setBill_id_fk(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));
pay_dto.setBank_id_fk(
		Integer.parseInt(request.getParameter("Bank_id_fk") == null ? "0" : request.getParameter("Bank_id_fk")));
//Float
pay_dto.setOnline_amount(Float
		.parseFloat(request.getParameter("Online_amount") == null || request.getParameter("Online_amount") == "" ? "0.0" : request.getParameter("Online_amount")));
pay_dto.setCash_amount(
		Float.parseFloat(request.getParameter("Cash_amount") == null || request.getParameter("Cash_amount") == "" ? "0.0" : request.getParameter("Cash_amount")));
// String
pay_dto.setRemark(request.getParameter("Remark") == null ? "" : request.getParameter("Remark"));
pay_dto.setOnline_remark(request.getParameter("Online_remark") == null ? "" : request.getParameter("Online_remark"));
pay_dto.setOnline_date(request.getParameter("Online_date") == null ? "" : request.getParameter("Online_date"));
pay_dto.setOnline_way(request.getParameter("Online_way") == null ? "" : request.getParameter("Online_way"));
pay_dto.setIn_date(request.getParameter("Bill_date") == null ? "" : request.getParameter("Bill_date"));
pay_dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));
pay_dto.setType("Service Bill");

int id = 0;
boolean b = false;

// condition for insert

if (dto.getId() == 0) {
	id = ser.insertServiceBillInfo(pay_dto, dto, request, config);
	if (id != 0) {
		b = true;
	}
}

// condition for updating

else {
	id = ser.updateServiceBillInfoById(dto, pay_dto, request, config);
	if (id != 0) {
		b = true;
	}
}
%>

<input id="updatestatus" type="hidden" value="<%=b%>" />
<input id="bill_response_id" type="hidden" value="<%=id%>" />
