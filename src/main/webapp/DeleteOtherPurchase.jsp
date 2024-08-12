<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="com.service.DeletePurchaseOtherService"%>


<%
int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));
int main_id = Integer.parseInt(request.getParameter("main_id") == null ? "0" : request.getParameter("main_id"));
String flag = request.getParameter("flag") == null ? "" : request.getParameter("flag");

DeletePurchaseOtherService service = new DeletePurchaseOtherService();

boolean delstatus = false;

if (flag.equals("Due")) {
	delstatus = service.deletePurchaseOtherDue(id, request, config);
	if (delstatus == true) {
		response.sendRedirect("manage_dealer_other_due.jsp?msg=YesDel&id="+main_id);
	} else {
		response.sendRedirect("manage_dealer_other_due.jsp?msg=NoDel&id="+main_id);
	}
} else if (flag.equals("Bill")) {
	delstatus = service.deletePurchaseOtherBIll(id, request, config);
	if (delstatus == true) {
		response.sendRedirect("manage_purchase_other_bill.jsp?msg=YesDel");
	} else {
		response.sendRedirect("manage_purchase_other_bill.jsp?msg=NoDel");
	}
} else if (flag.equals("All")) {
	delstatus = service.deletePurchaseOtherBIll(id, request, config);
	if (delstatus == true) {
		response.sendRedirect("manage_dealer_other_bills.jsp?msg=YesDel&id="+main_id);
	} else {
		response.sendRedirect("manage_dealer_other_bills.jsp?msg=NoDel&id="+main_id);
	}
}

System.out.println(delstatus);
%>

<input type="hidden" id="delstatus" value="<%=delstatus%>" />