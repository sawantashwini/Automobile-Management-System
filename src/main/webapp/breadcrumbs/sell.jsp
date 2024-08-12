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
				<%if (user_id > 0) {
						if (user_sidebar_dto_nav.getSell_module().equalsIgnoreCase("Yes")) {
						%>
				<li><a href="sell_bill.jsp">Sell  </a></li>
							<%
						}if (user_sidebar_dto_nav.getSell_report().equalsIgnoreCase("Yes")) {
						%>
				<li><a href="manage_sell_bill.jsp">Sell Report</a></li>
				
					<%
						}if (user_sidebar_dto_nav.getSell_item_report().equalsIgnoreCase("Yes")) {
						%>
				<li><a href="manage_sell_bill_item.jsp">Sell Item </a></li>
				
				<%
						}if (user_sidebar_dto_nav.getCustomer_report().equalsIgnoreCase("Yes")) {
						%>
					<li><a href="manage_customer.jsp">Customer</a></li>
					<%
						}}
						%>
				
				
				
			</ol>
		</div>
	
	</div>
