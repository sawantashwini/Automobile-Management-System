
<%@page import="com.dto.PurchaseBillItemDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.PurchaseBillService"%>
<%
											int bill_id = Integer.parseInt(request.getParameter("Purchase_id") == null ? "0" : request.getParameter("Purchase_id"));
											
											PurchaseBillService service = new PurchaseBillService();

											
											ArrayList<PurchaseBillItemDto> list = service.getPurchaseBillItemInfoById(bill_id, config, request);
										
											
											int i=1;

											for (PurchaseBillItemDto item_dto : list) {
												
												float pur_discount_price= item_dto.getPur_base_price()-item_dto.getDiscount_amt();
												float gst_price= pur_discount_price*item_dto.getGst_per()/100;
											%>


<tr>

	<td><%=item_dto.getItem_code()%> <input type="hidden"
		id="item_code<%=i%>" name="Item_code"
		value="<%=item_dto.getItem_code()%>"> <input
		id="hsn_code<%=i%>" type="hidden" name="Hsn_code"
		value="<%=item_dto.getItem_hsn_code()%>"> <input type="hidden"
		id="item_id<%=i%>" name="Item_id"
		value="<%=item_dto.getItem_id_fk()%>"> <input type="hidden"
		id="gstamt_with_qty<%=i%>" name="Gstamt_with_qty"
		value="<%=item_dto.getItem_qty()*gst_price%>" step=0.01></td>


	<td><%=item_dto.getItem_name()%> <input type="hidden"
		id="item_name<%=i%>" name="Item_name"
		value="<%=item_dto.getItem_name()%>"></td>
	<td><%=item_dto.getGst_per()%> <input type="hidden"
		id="gst_per<%=i%>" name="Gst_per" value="<%=item_dto.getGst_per()%>"></td>

	<td><%=item_dto.getPur_base_price()%> <input type="hidden"
		id="pur_base_price<%=i%>" name="Pur_base_price"
		value="<%=item_dto.getPur_base_price()%>" step=0.01></td>

	<td><%=item_dto.getDiscount_per()%> <input type="hidden"
		id="dis_per<%=i%>" name="Dis_per"
		value="<%=item_dto.getDiscount_per()%>"></td>
	<td><%=item_dto.getDiscount_amt()%> <input type="hidden"
		id="dis_amt<%=i%>" name="Dis_amt"
		value="<%=item_dto.getDiscount_amt()%>" step=0.01></td>

	<td><%=pur_discount_price %> <input type="hidden"
		id="pur_discount_price<%=i%>" name="Pur_discount_price"
		value="<%=pur_discount_price %>" step=0.01></td>

	<td><%=item_dto.getItem_qty()%> <input type="hidden"
		id="item_qty<%=i%>" name="Item_qty"
		value="<%=item_dto.getItem_qty()%>"></td>

	<td><%=pur_discount_price*item_dto.getItem_qty()%> <input
		type="hidden" id="tot_amt<%=i%>" name="Tot_amt"
		value="<%=pur_discount_price*item_dto.getItem_qty()%>" step=0.01></td>



	<td><i class="bi bi-trash main-color"
		onclick="deletePurchaseItem('<%=item_dto.getId()%>');"> </i></td>
</tr>

<%
															i=i+1;
															} %>
