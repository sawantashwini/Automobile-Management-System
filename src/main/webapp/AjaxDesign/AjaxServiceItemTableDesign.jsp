<%@page import="com.dto.ServiceBillItemDto"%>
<%@page import="com.service.ServiceBillService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.LogFileService"%>
<%
int job_cart_id = Integer
		.parseInt(request.getParameter("Job_card_id") == null ? "0" : request.getParameter("Job_card_id"));
int bill_id = Integer.parseInt(request.getParameter("Bill_id") == null ? "0" : request.getParameter("Bill_id"));
%>

<%
ServiceBillService bill_ser = new ServiceBillService();
ArrayList<ServiceBillItemDto> list_bill = bill_ser.getServiceBIllItemInfoByBillId(job_cart_id, bill_id, config,
		request);
int i = 1;
for (ServiceBillItemDto item_dto : list_bill) {

	float item_price_with_dis = item_dto.getSell_base_price() - item_dto.getDiscount_per_amount();
	float gst_price = item_price_with_dis * item_dto.getGst_per() / 100;
%>
<tr>
	<td align="center"><%=item_dto.getItem_code()%><input
		id="item_code<%=i%>" type="hidden" name="Item_code"
		value="<%=item_dto.getItem_code()%>"></td>

	<td align="center"><%=item_dto.getItem_name()%><input
		id="item_name<%=i%>" type="hidden" name="Item_name"
		value="<%=item_dto.getItem_name()%>"> <input
		id="item_id<%=i%>" type="hidden" name="Item_id"
		value="<%=item_dto.getItem_id_fk()%>"></td>

	<td align="center" style="display: none"><%=item_dto.getCat_name()%>
		<input id="cat_name<%=i%>" type="hidden" name="Cat_name"
		value="<%=item_dto.getCat_name()%>"> <input id="cat_id<%=i%>"
		type="hidden" name="Cat_id" value="<%=item_dto.getCat_id_fk()%>">
		<input id="measure_id<%=i%>" type="hidden" name="Measure_id"
		value="<%=item_dto.getMeasurement_id_fk()%>"> <input
		id="measure_name<%=i%>" type="hidden" name="Measure_name"
		value="<%=item_dto.getMeasurement_name()%>"> <input
		id="sell_item_status<%=i%>" type="hidden" name="Sell_item_status"
		value="<%=item_dto.getSell_item_status()%>"> <input
		id="discount_sell_gst_price<%=i%>" type="hidden"
		name="Discount_sell_gst_price"
		value="<%=item_dto.getDiscount_sell_gst_price()%>"> <input
		id="hsn_code<%=i%>" type="hidden" name="Hsn_code"
		value="<%=item_dto.getHsn_code()%>"> <%
 float gst_price_with_qty = 0;
 if (item_dto.getWarranty().equalsIgnoreCase("No")) {
 	gst_price_with_qty = item_dto.getItem_qty() * gst_price;
 }
 %>
		<input id="gst_price_with_qty<%=i%>" type="hidden"
		name="Gst_price_with_qty" value="<%=gst_price_with_qty%>"></td>

	<td align="center"><%=item_dto.getGst_per()%><input
		id="gst_per<%=i%>" type="hidden" name="Gst_per"
		value="<%=item_dto.getGst_per()%>"></td>
	<%
	float gst_price1 = item_dto.getSell_base_price() * item_dto.getGst_per() / 100;
	%>
	<td align="center"><%=item_dto.getSell_base_price() + gst_price1%><input
		id="item_price_with_gst<%=i%>" type="hidden"
		name="Item_price_with_gst"
		value="<%=item_dto.getSell_base_price() + gst_price1%>"></td>

	<td align="center"><%=item_dto.getSell_base_price()%><input
		id="sell_base_price<%=i%>" type="hidden" name="Sell_base_price"
		value="<%=item_dto.getSell_base_price()%>"></td>

	<td align="center"><%=item_dto.getDiscount_per()%><input
		id="dis_per<%=i%>" type="hidden" name="Dis_per"
		value="<%=item_dto.getDiscount_per()%>"></td>

	<td align="center"><%=item_dto.getDiscount_per_amount()%><input
		id="dis_amt<%=i%>" type="hidden" name="Dis_amt"
		value="<%=item_dto.getDiscount_per_amount()%>"></td>


	<td align="center"><%=item_price_with_dis%><input
		id="item_price_with_dis<%=i%>" type="hidden"
		name="Item_price_with_dis" value="<%=item_price_with_dis%>">
	</td>

	<td align="center"><%=item_dto.getItem_qty()%><input
		id="qty<%=i%>" type="hidden" name="Qty"
		value="<%=item_dto.getItem_qty()%>"></td>

	<td align="center"><%=item_dto.getWarranty()%></td>
	<td align="center"><%=LogFileService.changeFormate(item_dto.getWarranty_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>
	<%
	float tot_amt = 0;
	if (item_dto.getWarranty().equalsIgnoreCase("No")) {
		tot_amt = item_price_with_dis * item_dto.getItem_qty();
	}
	%>
	<td align="center"><%=tot_amt%><input id="tot_amt<%=i%>"
		type="hidden" name="Tot_amt" value="<%=tot_amt%>"></td>

	<td><i class="bi bi-trash main-color"
		onclick="deleteItem('<%=item_dto.getId()%>');"> </i></td>

	<%
	i = i + 1;

	}
	%>