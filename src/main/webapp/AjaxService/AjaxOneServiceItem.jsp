<%@page import="com.service.ServiceBillService"%>
<%@page import="com.dto.ServiceBillItemDto"%>
<%
ServiceBillItemDto dto = new ServiceBillItemDto();

//************Sale Bill Item Dto Values***********
//Integer
dto.setBill_id_fk(Integer.parseInt(request.getParameter("Bill_id_fk") == null ? "0" : request.getParameter("Bill_id_fk")));

dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));

dto.setItem_id_fk(Integer.parseInt(request.getParameter("Item_id_fk") == null ? "0" : request.getParameter("Item_id_fk")));

dto.setJob_card_id_fk(Integer.parseInt(request.getParameter("Job_card_id_fk") == null ? "0" : request.getParameter("Job_card_id_fk")));

dto.setCat_id_fk(Integer.parseInt(request.getParameter("Cat_id_fk") == null ? "0"	: request.getParameter("Cat_id_fk")));

dto.setMeasurement_id_fk(Integer.parseInt(request.getParameter("Measurement_id_fk") == null ? "0" : request.getParameter("Measurement_id_fk")));

//Float

dto.setSell_base_price(Float.parseFloat(request.getParameter("Sell_base_price") == null || request.getParameter("Sell_base_price") == "" ? "0.0" : request.getParameter("Sell_base_price")));

dto.setDiscount_per(Float.parseFloat(request.getParameter("Discount_per") == null || request.getParameter("Discount_per") == "" ? "0.0" : request.getParameter("Discount_per")));

dto.setDiscount_per_amount(Float.parseFloat(request.getParameter("Discount_per_amount") == null  || request.getParameter("Discount_per_amount") == "" ? "0.0" : request.getParameter("Discount_per_amount")));

dto.setGst_per(Float.parseFloat(request.getParameter("Gst_per") == null || request.getParameter("Gst_per") == "" ? "0.0" : request.getParameter("Gst_per")));

dto.setDiscount_sell_gst_price(Float.parseFloat(request.getParameter("Discount_sell_gst_price") == null || request.getParameter("Discount_sell_gst_price") == "" ? "0.0" : request.getParameter("Discount_sell_gst_price")));

dto.setItem_qty(Float.parseFloat(request.getParameter("Item_qty") == null || request.getParameter("Item_qty") == "" ? "0.0" : request.getParameter("Item_qty")));


//String
dto.setCat_name(request.getParameter("Cat_name") == null ? "" : request.getParameter("Cat_name"));

dto.setMeasurement_name(request.getParameter("Measurement_name") == null ? "" : request.getParameter("Measurement_name"));

dto.setHsn_code(request.getParameter("Hsn_code") == null ? "" : request.getParameter("Hsn_code"));

dto.setItem_name(request.getParameter("Item_name") == null ? "" : request.getParameter("Item_name"));

dto.setItem_code(request.getParameter("Item_code") == null ? "" : request.getParameter("Item_code"));

dto.setWarranty(request.getParameter("Warranty") == null ? "" : request.getParameter("Warranty"));
dto.setWarranty_date(request.getParameter("Warranty_date") == null ? "" : request.getParameter("Warranty_date"));

dto.setSell_item_status(request.getParameter("Sell_item_status") == null ? "" : request.getParameter("Sell_item_status"));

	
	ServiceBillService ser = new ServiceBillService();
	boolean b = false;
	
	if(dto.getId()==0){
		System.out.println("biill");
		 b = ser.insertOneServiceBillItem(dto, request, config);
	}
	else{
		b = ser.deleteOneServiceBillItem(dto.getId(), request, config);
	}
	
%>

<input id="item_result" type="hidden" value="<%=b%>" />
