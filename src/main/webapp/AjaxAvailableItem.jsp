<%@page import="java.util.ArrayList"%>
<%@page import="com.service.*"%>
<%@page import="com.dto.*"%>
		<%
		String flag=request.getParameter("Flag") == null ? "" : request.getParameter("Flag");
		
		
		if(flag.equalsIgnoreCase("Company")){
			CompanyService ser = new CompanyService();
			ArrayList<CompanyDto> list1 = ser.getActiveCompanyInfo(config, request);
			%>
			<option selected  value="0"> Select Company </option>
			
			<%
			for (CompanyDto dto : list1) {%>
<option value="<%=dto.getId()%>"><%=dto.getName()%></option>
<%}
			}
		if(flag.equalsIgnoreCase("Color")){
			ColorService ser = new ColorService();
		ArrayList<ColorDto> list = ser.getActiveColorInfo(config, request);
		%>
		<option selected  value="0"> Select Color </option>
		
		<%
		for (ColorDto item_dto : list) {
		%>
		<option value="<%=item_dto.getId()%>" ><%=item_dto.getName()%></option>
		<%}
		}
		
		if(flag.equalsIgnoreCase("Category")){
			ItemCategoryService ser = new ItemCategoryService();
		ArrayList<ItemCategoryDto> list2 = ser.getActiveCategoryInfo(config, request);
		%>
		<option selected  value="0"> Select Category </option>
		
		<%
		for (ItemCategoryDto item_dto : list2) {
		%>
		<option value="<%=item_dto.getId()%>" ><%=item_dto.getName()%></option>
		<%}
		}
		if(flag.equalsIgnoreCase("Measurement")){
			MeasurementService ser = new MeasurementService();
		ArrayList<MeasurementDto> list3 = ser.getActiveMeasurementInfo(config, request);
		%>
		<option selected  value="0"> Select Measurement </option>
		
		<%
		for (MeasurementDto item_dto : list3) {
		%>
		<option value="<%=item_dto.getId()%>" ><%=item_dto.getName()%></option>
		<%}
		}
		if(flag.equalsIgnoreCase("City")){
			CityService city_ser = new CityService();
		ArrayList<CityDto> list4 = city_ser.getActiveCityInfo(config, request);
		%>
		<option selected  value="0"> Select City </option>
		
		<%
		for (CityDto item_dto : list4) {
		%>
		<option value="<%=item_dto.getId()%>" ><%=item_dto.getName()%></option>
		<%}
		}
		%>
	
		