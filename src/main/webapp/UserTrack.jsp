
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	int user_id = (Integer) (session.getAttribute("user_id") == null ? 0
			: session.getAttribute("user_id"));
	

	String session_year = (String) (session.getAttribute("session") == null ? "" : session.getAttribute("session"));
	
	String current_session = (String) (session.getAttribute("currentSession") == null ? ""
			: session.getAttribute("currentSession"));

	if (user_id==0) {

		response.sendRedirect("login.jsp?msg=Session TimeOut");

	}
%>