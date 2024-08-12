<%@page import="com.service.PurchaseBillService"%>
<%@page import="com.dto.PurchaseBillItemDto"%>
<%
PurchaseBillItemDto dto = new PurchaseBillItemDto();

//************Sale Bill Item Dto Values***********
//Integer
dto.setPur_bill_id_fk(Integer
		.parseInt(request.getParameter("Pur_bill_id_fk") == null ? "0" : request.getParameter("Pur_bill_id_fk")));

dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));

dto.setItem_id_fk(
		Integer.parseInt(request.getParameter("Item_id_fk") == null ? "0" : request.getParameter("Item_id_fk")));

dto.setCat_id_fk(Integer.parseInt(request.getParameter("Cat_id_fk") == null ? "0" : request.getParameter("Cat_id_fk")));

dto.setMeasure_id_fk(
		Integer.parseInt(request.getParameter("Measure_id_fk") == null ? "0" : request.getParameter("Measure_id_fk")));

//Float

dto.setPur_base_price(Float
		.parseFloat(request.getParameter("Pur_base_price") == null ? "0" : request.getParameter("Pur_base_price")));

dto.setDiscount_per(
		Float.parseFloat(request.getParameter("Discount_per") == null ? "0" : request.getParameter("Discount_per")));

dto.setDiscount_amt(
		Float.parseFloat(request.getParameter("Discount_amt") == null ? "0" : request.getParameter("Discount_amt")));

dto.setGst_per(Float.parseFloat(request.getParameter("Gst_per") == null ? "0" : request.getParameter("Gst_per")));

dto.setPur_discount_price(Float.parseFloat(
		request.getParameter("Pur_discount_price") == null ? "0" : request.getParameter("Pur_discount_price")));

dto.setItem_qty(Float.parseFloat(request.getParameter("Item_qty") == null ? "0" : request.getParameter("Item_qty")));

//String
dto.setCat_name(request.getParameter("Cat_name") == null ? "0" : request.getParameter("Cat_name"));

dto.setMeasure_name(request.getParameter("Measure_name") == null ? "0" : request.getParameter("Measure_name"));

dto.setItem_hsn_code(request.getParameter("Item_hsn_code") == null ? "0" : request.getParameter("Item_hsn_code"));

dto.setItem_name(request.getParameter("Item_name") == null ? "0" : request.getParameter("Item_name"));

dto.setItem_code(request.getParameter("Item_code") == null ? "0" : request.getParameter("Item_code"));

dto.setPur_item_status(request.getParameter("Pur_item_status") == null ? "0" : request.getParameter("Pur_item_status"));

PurchaseBillService ser = new PurchaseBillService();
boolean b = false;

if (dto.getId() == 0) {
	b = ser.insertOnePurchaseBillItem(dto, request, config);
} else {
	b = ser.deleteOnePurchaseBillItem(dto.getId(), request, config);
}
%>

<input id="result_item_info" type="hidden" value="<%=b%>" />
