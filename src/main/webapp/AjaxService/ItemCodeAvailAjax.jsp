<%@page import="com.service.ItemService"%>
<%@page import="com.dto.ItemDto"%>
<%
	String item_code = request.getParameter("item_code");


ItemDto dto = new ItemDto();

ItemService pro_ser = new ItemService();

	dto = pro_ser.getItemInfoByCode(item_code, config, request);

	if (dto.getId() > 0) {
%>

<input id="check_item" type="hidden" value="done" />

<input id="item_id_val" type="hidden" value="<%=dto.getId()%>" />
<input id="item_name_val" type="hidden" value="<%=dto.getName()%>" />
<input id="cat_id_val" type="hidden" value="<%=dto.getCat_id_fk()%>" />

<input id="cat_name_val" type="hidden" value="<%=dto.getCategory_name()%>" />
<input id="measure_id_val" type="hidden" value="<%=dto.getMeasure_id_fk()%>" />
<input id="measure_name_val" type="hidden" value="<%=dto.getMeasure_name()%>" />
<input id="gst_per_val" type="hidden" value="<%=dto.getGst_per()%>" />
<input id="sell_base_price_val" type="hidden" value="<%=dto.getSale_price()%>" />
<input id="hsn_code_val" type="hidden" value="<%=dto.getHsn_code()%>" />
<input id="sell_item_status_val" type="hidden" value="<%=dto.getStatus()%>" />


<%
	} else {
%>
<input id="check_item" type="hidden" value="notdone" />
<%
	}
%>