<%@page import="com.service.DealerOtherService"%>
<%@page import="com.dto.PurchaseOtherDto"%>
<%
String name = request.getParameter("name");

PurchaseOtherDto dto = new PurchaseOtherDto();

DealerOtherService ser = new DealerOtherService();

dto = ser.getDealerOtherInfoByName(name, config, request);

if (dto.getId() > 0) {
%>
<input id="check" type="hidden" value="done" />
<input id="id_val" type="hidden" value="<%=dto.getId()%>" />

<%
} else {
%>
<input id="check" type="hidden" value="notdone" />
<%
}
%>