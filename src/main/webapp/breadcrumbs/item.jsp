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


				<li><a href="index.jsp"><i class="fa fa-home" ></i></a></li>
				<%
						if (user_sidebar_dto_nav.getMaster_module().equalsIgnoreCase("Yes")) {
						%>
			<!-- <li><a href="manage_city.jsp">City</a></li>
			<li><a href="manage_company.jsp">Company</a></li>
			<li><a href="manage_color.jsp">Color</a></li> -->
			<li><a href="manage_measurement.jsp">Measure</a></li>
			<li><a href="manage_item_category.jsp">Category</a></li>
			<li><a href="add_item.jsp">Item</a></li>
			<li><a href="manage_stock_item.jsp">Stock Report</a></li>
			<li><a href="manage_required_item.jsp">Low Qty Report</a></li>
			<!-- <li><a href="manage_spend_head.jsp">Spend</a></li>
			<li><a href="manage_income_head.jsp">Income</a></li>
			<li><a href="manage_msg.jsp">Msg</a></li> -->
			<%}
						
						%>
		</ol>
	</div>

</div>



