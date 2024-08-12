<%@page import="com.service.SaleBillReturnService"%>
<%@page import="com.dto.SaleBillItemDto"%>
<%
SaleBillItemDto dto = new SaleBillItemDto();

//************Sale Bill Item Dto Values***********
//Integer
dto.setBill_id_fk(Integer.parseInt(request.getParameter("Bill_id_fk") == null ? "0" : request.getParameter("Bill_id_fk")));

dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));

dto.setItem_id_fk(Integer.parseInt(request.getParameter("Item_id_fk") == null ? "0" : request.getParameter("Item_id_fk")));

dto.setCat_id_fk(Integer.parseInt(request.getParameter("Cat_id_fk") == null ? "0"	: request.getParameter("Cat_id_fk")));

dto.setMeasurement_id_fk(Integer.parseInt(request.getParameter("Measurement_id_fk") == null ? "0" : request.getParameter("Measurement_id_fk")));

//Float

dto.setSell_base_price(Float.parseFloat(request.getParameter("Sell_base_price") == null ? "0" : request.getParameter("Sell_base_price")));

dto.setDiscount_per(Float.parseFloat(request.getParameter("Discount_per") == null ? "0" : request.getParameter("Discount_per")));

dto.setDiscount_per_amount(Float.parseFloat(request.getParameter("Discount_per_amount") == null ? "0" : request.getParameter("Discount_per_amount")));

dto.setGst_per(Float.parseFloat(request.getParameter("Gst_per") == null ? "0" : request.getParameter("Gst_per")));

dto.setDiscount_sell_gst_price(Float.parseFloat(request.getParameter("Discount_sell_gst_price") == null ? "0" : request.getParameter("Discount_sell_gst_price")));

dto.setItem_qty(Float.parseFloat(request.getParameter("Item_qty") == null ? "0" : request.getParameter("Item_qty")));


//String
dto.setCat_name(request.getParameter("Cat_name") == null ? "0" : request.getParameter("Cat_name"));

dto.setMeasurement_name(request.getParameter("Measurement_name") == null ? "0" : request.getParameter("Measurement_name"));

dto.setHsn_code(request.getParameter("Hsn_code") == null ? "0" : request.getParameter("Hsn_code"));

dto.setItem_name(request.getParameter("Item_name") == null ? "0" : request.getParameter("Item_name"));

dto.setItem_code(request.getParameter("Item_code") == null ? "0" : request.getParameter("Item_code"));

dto.setSell_item_status(request.getParameter("Sell_item_status") == null ? "0" : request.getParameter("Sell_item_status"));

String flag = request.getParameter("Flag") == null ? "0" : request.getParameter("Flag");
	
SaleBillReturnService ser = new SaleBillReturnService();
	boolean b = false;
	if(flag.equalsIgnoreCase("Sale Bill")){
		if(dto.getId() == 0){
		 b = ser.insertOneSaleBillItemReturn(dto, request, config);
		}
		else{
			b = ser.deleteOneSaleBillItemReturn(dto.getId(), request, config);
		}
	}
	
%>

<input id="item_result" type="hidden" value="<%=b%>" />
