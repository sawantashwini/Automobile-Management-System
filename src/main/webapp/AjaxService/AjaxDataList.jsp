
<%@page import="com.dto.*"%>
<%@page import="com.service.*"%>

<%@page import="java.util.ArrayList"%>

<%
String list_type = request.getParameter("type") == null ? "" : request.getParameter("type");
int parent_id = Integer.parseInt(request.getParameter("parent_id") == null ? "0" : request.getParameter("parent_id"));
System.out.println("Type: " + list_type + ", Parent Id: " + parent_id);
if (list_type.equalsIgnoreCase("company")) {
%>
<%
CompanyService bike_ser = new CompanyService();

ArrayList<CompanyDto> comp_list = bike_ser.getActiveCompanyInfo(config, request);

for (CompanyDto com_dto : comp_list) {
%>


<option data-id="<%=com_dto.getId()%>" value="<%=com_dto.getName()%>" />

<%
}
%>
<%
} else if (list_type.equalsIgnoreCase("color")) {
%>

<%
ColorService color_ser = new ColorService();

ArrayList<ColorDto> color_list = color_ser.getActiveColorInfo(config, request);

for (ColorDto color_dto : color_list) {
%>
<option data-id="<%=color_dto.getId()%>"
	value="<%=color_dto.getName()%>" />
<%
}
%>
<%
} else if (list_type.equalsIgnoreCase("city")) {
%>

<%
CityService city_ser = new CityService();
ArrayList<CityDto> city_list = city_ser.getActiveCityInfo(config, request);
for (CityDto city_dto : city_list) {
%>
<option data-id="<%=city_dto.getId()%>" value="<%=city_dto.getName()%>" />
<%
}
%>
<%
} else if (list_type.equalsIgnoreCase("bank")) {
%>

<%
BankService ser1 = new BankService();

ArrayList<BankDto> list1 = ser1.getBankInfo(config, request);

for (BankDto Bank_dto : list1) {
%>
<option data-id="<%=Bank_dto.getId()%>" value="<%=Bank_dto.getName()%>" />
<%
}
%>
<%
} else if (list_type.equalsIgnoreCase("category")) {
%>

<%
ItemCategoryService cat_ser = new ItemCategoryService();

ArrayList<ItemCategoryDto> c_list = cat_ser.getActiveCategoryInfo(config, request);

for (ItemCategoryDto c_dto : c_list) {
%>

<option data-id="<%=c_dto.getId()%>" value="<%=c_dto.getName()%>" />
<%
}
%>
<%
} else if (list_type.equalsIgnoreCase("measure")) {
%>

<%
MeasurementService m_ser = new MeasurementService();

ArrayList<MeasurementDto> m_list = m_ser.getActiveMeasurementInfo(config, request);

for (MeasurementDto m_dto : m_list) {
%>
<option data-id="<%=m_dto.getId()%>" value="<%=m_dto.getName()%>" />
<%
}
%>
<%
} else if (list_type.equalsIgnoreCase("item")) {
%>

<%
ItemService ser = new ItemService();
ArrayList<ItemDto> list = ser.getAvailItemInfo(config, request);
for (ItemDto dto : list) {
%>
<option data-id="<%=dto.getId()%>"
	data-category="<%=dto.getCat_id_fk()%>"
	data-cat_name="<%=dto.getCategory_name()%>"
	data-measure="<%=dto.getMeasure_id_fk()%>"
	data-measure_name="<%=dto.getMeasure_name()%>"
	data-item_name="<%=dto.getName()%>"
	data-gst_per="<%=dto.getGst_per()%>"
	data-sell_base_price="<%=dto.getSale_price()%>"
	data-hsn_code="<%=dto.getHsn_code()%>"
	data-sell_item_status="<%=dto.getStatus()%>"
	value="<%=dto.getItem_code()%>" />
<%
}
%>
<%
} else if (list_type.equalsIgnoreCase("pur_item")) {
%>

<%
ItemService ser = new ItemService();
ArrayList<ItemDto> list = ser.getItemInfo(config, request);
for (ItemDto dto : list) {
%>
<option data-id="<%=dto.getId()%>"
	data-category="<%=dto.getCat_id_fk()%>"
	data-cat_name="<%=dto.getCategory_name()%>"
	data-measure="<%=dto.getMeasure_id_fk()%>"
	data-measure_name="<%=dto.getMeasure_name()%>"
	data-item_name="<%=dto.getName()%>"
	data-gst_per="<%=dto.getGst_per()%>"
	data-pur_base_price="<%=dto.getPur_price()%>"
	data-hsn_code="<%=dto.getHsn_code()%>"
	data-pur_item_status="<%=dto.getStatus()%>"
	value="<%=dto.getItem_code()%>" />
<%
}
%>
<%
} else if (list_type.equalsIgnoreCase("dealer")) {
%>

<%
DealerService service1 = new DealerService();
ArrayList<DealerDto> list3 = service1.getDealerInfo(config, request);
for (DealerDto dto_path : list3) {
%>
<option data-id="<%=dto_path.getId()%>" value="<%=dto_path.getName()%>" />
<%
}
%>
<%
} else if (list_type.equalsIgnoreCase("other_dealer")) {
%>

<%
DealerOtherService service1 = new DealerOtherService();
ArrayList<PurchaseOtherDto> list3 = service1.getActiveDealerOtherInfo(config, request);
for (PurchaseOtherDto dto_deal : list3) {
%>
<option data-id="<%=dto_deal.getId()%>" value="<%=dto_deal.getName()%>" />
<%
}
%>
<%-- <%
} else if (list_type.equalsIgnoreCase("section")) {
%>

<%
DealerOtherService service1 = new DealerOtherService();
											ArrayList<PurchaseOtherDto> list3 = service1.getActiveDealerOtherInfo(config, request);
											for (PurchaseOtherDto dto_deal : list3) {
											%>
<option data-id="<%=ro_dto.getId()%>" value="<%=ro_dto.getName()%>" />
<%
}
%>


<%
}
if (list_type.equalsIgnoreCase("category")) {
%>
<%
BookCategoryService fo_service = new BookCategoryService();

ArrayList<BookCategoryDto> ho_list = fo_service.getActiveBookCategoryInfo(config, request);

for (BookCategoryDto ho_dto : ho_list) {
%>
<option data-id="<%=ho_dto.getId()%>" value="<%=ho_dto.getName()%>" />
<%
}
%>


<%
} else if (list_type.equalsIgnoreCase("sub_category")) {
%>

<%
SubCategoryService room_ser = new SubCategoryService();

ArrayList<SubCategoryDto> room_list = room_ser.getSubCategoryInfoByCatId(parent_id, config, request);

for (SubCategoryDto ro_dto : room_list) {
%>
<option data-id="<%=ro_dto.getId()%>" value="<%=ro_dto.getName()%>" />
<%
}
%>


<%
}

else if (list_type.equalsIgnoreCase("stationary_item")) {
%>

<%
StationaryItemService room_ser = new StationaryItemService();

ArrayList<StationaryItemDto> room_list = room_ser.getActiveStationaryItemInfo(config, request);

for (StationaryItemDto ro_dto : room_list) {
%>
<option data-id="<%=ro_dto.getId()%>" value="<%=ro_dto.getName()%>" />
<%
}
%>


<%
} else if (list_type.equalsIgnoreCase("assets_item")) {
%>

<%
AssetsItemService room_ser = new AssetsItemService();

ArrayList<AssetsItemDto> room_list = room_ser.getActiveAssetsItemInfo(config, request);

for (AssetsItemDto ro_dto : room_list) {
%>
<option data-id="<%=ro_dto.getId()%>"
	data-price="<%=ro_dto.getPur_price()%>" value="<%=ro_dto.getName()%>" />
<%
}
%>

<%
} else if (list_type.equalsIgnoreCase("father_occupation")) {
%>

<%
FatherOccupationService room_ser = new FatherOccupationService();

ArrayList<FatherOccupationDto> room_list = room_ser.getActiveFatherOccupationInfo(config, request);

for (FatherOccupationDto ro_dto : room_list) {
%>
<option data-id="<%=ro_dto.getId()%>" value="<%=ro_dto.getName()%>" />
<%
}
%>


<%
} else if (list_type.equalsIgnoreCase("city")) {
%>

<%
CityService room_ser = new CityService();

ArrayList<CityDto> room_list = room_ser.getActiveCityInfo(config, request);

for (CityDto ro_dto : room_list) {
%>
<option data-id="<%=ro_dto.getId()%>" value="<%=ro_dto.getName()%>" />
<%
}
%>


<%
} else if (list_type.equalsIgnoreCase("religion")) {
%>

<%
StudentReligionService room_ser = new StudentReligionService();

ArrayList<StudentReligionDto> room_list = room_ser.getActiveStudentReligionInfo(config, request);

for (StudentReligionDto ro_dto : room_list) {
%>
<option data-id="<%=ro_dto.getId()%>" value="<%=ro_dto.getName()%>" />
<%
}
%>


<%
} else if (list_type.equalsIgnoreCase("bus_route")) {
%>

<%
BusRouteService room_ser = new BusRouteService();

ArrayList<BusRouteDto> room_list = room_ser.getActiveBusRouteInfo(config, request);

for (BusRouteDto ro_dto : room_list) {
%>
<option data-id="<%=ro_dto.getId()%>" value="<%=ro_dto.getName()%>" />
<%
}
%>


<%
} else if (list_type.equalsIgnoreCase("bank")) {
%>

<%
BankService bo_ser = new BankService();

ArrayList<BankDto> bo_list = bo_ser.getActiveBankInfo(config, request);

for (BankDto bo_dto : bo_list) {
%>
<option data-id="<%=bo_dto.getId()%>" value="<%=bo_dto.getName()%>" />
<%
}
%>


<%
} else if (list_type.equalsIgnoreCase("spend_head")) {
%>

<%
SpendHeadService bo_ser = new SpendHeadService();

ArrayList<SpendHeadDto> bo_list = bo_ser.getActiveSpendHeadInfo(config, request);

for (SpendHeadDto bo_dto : bo_list) {
%>
<option data-id="<%=bo_dto.getId()%>" value="<%=bo_dto.getName()%>" />
<%
}
%>


<%
} else if (list_type.equalsIgnoreCase("income_head")) {
%>

<%
IncomeHeadService bo_ser = new IncomeHeadService();

ArrayList<IncomeHeadDto> bo_list = bo_ser.getActiveIncomeHeadInfo(config, request);

for (IncomeHeadDto bo_dto : bo_list) {
%>
<option data-id="<%=bo_dto.getId()%>" value="<%=bo_dto.getName()%>" />
<%
}
%>


<%
} else if (list_type.equalsIgnoreCase("uniform_item")) {
%>

<%
UniformItemService bo_ser = new UniformItemService();

ArrayList<UniformItemDto> bo_list = bo_ser.getActiveUniformItemInfo(config, request);

for (UniformItemDto bo_dto : bo_list) {
%>
<option data-id="<%=bo_dto.getId()%>"
	data-price="<%=bo_dto.getFees()%>" value="<%=bo_dto.getNAME()%>" />
<%
}
%> --%>


<%
}
%>


