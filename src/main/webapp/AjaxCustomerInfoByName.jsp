<%@page import="com.service.CustomerService"%>
<%@page import="com.dto.CustomerDto"%>
<%
	String name = request.getParameter("name");


CustomerDto dto = new CustomerDto();

CustomerService ser = new CustomerService();

	dto = ser.getCustomerInfoByName(name, config, request);

	if (dto.getId() > 0) {
%>

<input id="check_cust" type="hidden" value="done" />

<input id="cust_id_val" type="hidden" value="<%=dto.getId()%>" />
<input id="name_val" type="hidden" value="<%=dto.getName()%>" />
<input id="mobile_no_val" type="hidden" value="<%=dto.getMobile_no()%>" />
<input id="address_val" type="hidden" value="<%=dto.getAddress()%>" />
<input id="gst_no_val" type="hidden" value="<%=dto.getGst_no()%>" />
<input id="old_due_val" type="hidden" value="<%=dto.getOld_due()%>" />

<%
	} else {
%>
<input id="check_cust" type="hidden" value="notdone" />
<%
	}
%>