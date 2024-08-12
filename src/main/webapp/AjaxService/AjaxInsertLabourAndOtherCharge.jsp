<%@page import="com.service.JobCardService"%>
<%@page import="com.dto.JobCardDto"%>
<%
JobCardDto dto = new JobCardDto();

dto.setLabour_charge(Float.parseFloat(request.getParameter("Labour_charge") == null || request.getParameter("Labour_charge") == "" ? "0.0" : request.getParameter("Labour_charge")));
dto.setJob_card_id_fk(Integer.parseInt(request.getParameter("Job_card_id_fk") == null ? "0" : request.getParameter("Job_card_id_fk")));
dto.setOther_charge(Float.parseFloat(request.getParameter("Other_charge") == null || request.getParameter("Other_charge") == "" ? "0.0" : request.getParameter("Other_charge")));
JobCardService ser = new JobCardService();
boolean b = false;

if(dto.getId()==0){

	 b = ser.updateLabourAndOtherCharge(dto, request, config);
}
	
%>

<input id="item_result" type="hidden" value="<%=b%>" />
