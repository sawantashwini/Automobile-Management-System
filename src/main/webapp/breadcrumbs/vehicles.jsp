<%@page import="com.dto.UserDto"%>
<%@page import="com.service.UserService"%>
<link href="assets/css/style.css" rel="stylesheet">

<div class="horizontal">
	<div class="verticals ten offset-by-one">
			<ol class="breadcrumb breadcrumb-fill2 style4">
			<%
		
UserService user_sidebar_service = new UserService();
UserDto user_sidebar_dto_nav = user_sidebar_service.getuserInfoById(user_id, config, request);
%>
				<li><a href="index.jsp"><i class="fa fa-home"></i></a></li>
				<%
						if (user_sidebar_dto_nav.getVehicle_module().equalsIgnoreCase("Yes")) {
						%>
				<li><a href="add_vehicle.jsp">Vehicle</a></li>
					<%
						}if (user_sidebar_dto_nav.getStock_vehicle_module().equalsIgnoreCase("Yes")) {
						%>
				<li><a href="manage_stock_vehicle.jsp">Stock Report</a></li>
						<%
						}if (user_sidebar_dto_nav.getSold_vehicle_module().equalsIgnoreCase("Yes")) {
						%>
				<li><a href="manage_sold_vehicle.jsp">Sold Report</a></li>
						<%
						}if (user_sidebar_dto_nav.getFinance_module().equalsIgnoreCase("Yes")) {
						%>
				<li><a href="manage_vehicle_finance.jsp">Finance  Report</a></li>
						<%
						}
						%>
				
				<li><a href="manage_city.jsp">City</a></li>
				<li><a href="manage_company.jsp">Company</a></li>
					<li><a href="manage_color.jsp">Color</a></li>
				
			</ol>
		</div>
	
	</div>
