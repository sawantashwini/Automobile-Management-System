<%@page import="com.service.* "%>
<%@page import="com.dto.* "%>

<%
	String chassis_no = (request.getParameter("chassis_no") == null ? "" : request.getParameter("chassis_no"));
	
	
	boolean check_status = false;
	
	JobCardService ser = new JobCardService();
	VehicleInfoDto dto = new VehicleInfoDto();

	check_status = ser.checkChasisNoAvail(chassis_no, dto, request,config);

%>
<input id="chasis_no_val"  type="hidden" value="<%=dto.getChassis_no()%>">
<input id="done_ser"  type="hidden" value="<%=dto.getDone_service_count()%>">
<input id="ser_count"  type="hidden" value="<%=dto.getService_count()%>">

<input id="check_status" type="hidden" value="<%=check_status%>">
