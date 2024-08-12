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
						if (user_sidebar_dto_nav.getSell_return_module().equalsIgnoreCase("Yes")) {
						%>
				<li><a href="sell_bill_return.jsp">Sell Return </a></li>
				
						
						<%}
						if (user_sidebar_dto_nav.getSell_return_report().equalsIgnoreCase("Yes")) {
						%>
						
				<li><a href="manage_sell_bill_return.jsp">Sell Return Report</a></li>
				
						
							
						<%}
						if (user_sidebar_dto_nav.getSell_item_return_report().equalsIgnoreCase("Yes")) {
						%>
						
				<li><a href="manage_sell_bill_return_item.jsp">Sell Return Item  </a></li>
				
		
						<%}
					
						%>
				
				
			</ol>
		</div>
	
	</div>
