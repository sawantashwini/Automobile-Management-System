
<%@page import="com.service.*"%>
<%@page import="com.dto.*"%>

<%
String name = request.getParameter("Name") == null ? "" : request.getParameter("Name");

SpendHeadService ser = new SpendHeadService();
SpendHeadDto dto = ser.getSpendHeadInfobyName(name, config, request);

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
IncomeHeadService ser1 = new IncomeHeadService();
IncomeHeadDto dto1 = ser1.getIncomeHeadInfobyName(name, config, request);

if (dto1.getId() > 0) {
%>

<input id="check1" type="hidden" value="done" />
<input id="income_id_val" type="hidden" value="<%=dto1.getId()%>" />

<%
} else {
%>
<input id="check1" type="hidden" value="notdone" />
<%
}
%>