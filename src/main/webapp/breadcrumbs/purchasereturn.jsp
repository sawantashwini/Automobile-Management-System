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
						
						if (user_sidebar_dto_nav.getPurchase_return_module().equalsIgnoreCase("Yes")) {
						%>
						
				<li><a href="purchase_bill_return.jsp">Purchase Return</a></li>
					
						<%}
						if (user_sidebar_dto_nav.getPurchase_return_report().equalsIgnoreCase("Yes")) {
						%>
						
				<li><a href="manage_purchase_bill_return.jsp">Purchase Return Bills</a></li>
					
						<%}
						if (user_sidebar_dto_nav.getPur_item_return_report().equalsIgnoreCase("Yes")) {
						%>
						
				<li><a href="manage_purchase_bill_return_item.jsp">Purchase Return Item </a></li>
		
						<%}
					
						%>
				
				
			</ol>
		</div>
	
	</div>
