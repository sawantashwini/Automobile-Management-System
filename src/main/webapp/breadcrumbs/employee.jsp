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
						if (user_sidebar_dto_nav.getEmployee_module().equalsIgnoreCase("Yes")) {
						%>
				<li><a href="add_employee.jsp">Employee</a></li>
				<li><a href="manage_employee.jsp">Employee Report</a></li>
				<li><a href="pay_all_employee_salary.jsp">Salary</a></li>
				<li><a href="manage_all_employee_salary.jsp">Salary Report</a></li>
				<li><a href="employee_attendence_entry.jsp">Attendance</a></li>
				<li><a href="view_employee_attendance.jsp">Attendance Report</a></li>
				
					<%}
						
						%>
			</ol>
		</div>
	
	</div>
