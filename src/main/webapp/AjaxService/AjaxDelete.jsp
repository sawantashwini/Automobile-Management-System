<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="com.service.DeleteService "%>
<%
DeleteService service = new DeleteService();
boolean delstatus = false;

int return_id = Integer.parseInt(request.getParameter("return_id") == null ? "0" : request.getParameter("return_id"));
int id = Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id"));

//Delete Spend
int spend_id = Integer.parseInt(request.getParameter("spend_id") == null ? "0" : request.getParameter("spend_id"));

if (spend_id > 0) {
	delstatus = service.deleteSpend(spend_id, request, config);
	if (delstatus == true) {
		response.sendRedirect("../manage_spend.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_spend.jsp?msg=NoDel");
	}
}



//Delete income
int income_id = Integer.parseInt(request.getParameter("income_id") == null ? "0" : request.getParameter("income_id"));

if (income_id > 0) {
	delstatus =  service.deleteIncome(income_id, request, config);
	if (delstatus == true) {
		response.sendRedirect("../manage_income.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_income.jsp?msg=NoDel");
	}
}


//Delete customer_id
int customer_id = Integer.parseInt(request.getParameter("customer_id") == null ? "0" : request.getParameter("customer_id"));

if (customer_id > 0) {
	delstatus = service.deleteCustomer(customer_id, request,config);
	if (delstatus == true) {
		response.sendRedirect("../manage_customer.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_customer.jsp?msg=NoDel");
	}
}


//Delete customer_due_id
int customer_due_id = Integer.parseInt(request.getParameter("customer_due_id") == null ? "0" : request.getParameter("customer_due_id"));

if (customer_due_id > 0) {
	delstatus = service.deleteCustomerDue(customer_due_id, request, config);
	if (delstatus == true) {
		response.sendRedirect("../manage_customer_due.jsp?msg=YesDel&id="+return_id);
	} else {
		response.sendRedirect("../manage_customer_due.jsp?msg=NoDel&id="+return_id);
	}
}
// Delete service_due_id
int service_due_id = Integer.parseInt(request.getParameter("service_due_id") == null ? "0" : request.getParameter("service_due_id"));

if (service_due_id > 0) {
	delstatus = service.deleteServiceDue(service_due_id, request, config);
	if (delstatus == true) {
		response.sendRedirect("../manage_service_due.jsp?msg=YesDel&id="+return_id);
	} else {
		response.sendRedirect("../manage_service_due.jsp?msg=NoDel&id="+return_id);
	}
}
//Delete dealer_id
int dealer_id = Integer.parseInt(request.getParameter("dealer_id") == null ? "0" : request.getParameter("dealer_id"));

if (dealer_id > 0) {
	delstatus = service.deleteDealerInfo(dealer_id, request, config);
	if (delstatus == true) {
		response.sendRedirect("../manage_dealer.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_dealer.jsp?msg=NoDel");
	}
}


//Delete dealer_due_id
int dealer_due_id = Integer.parseInt(request.getParameter("dealer_due_id") == null ? "0" : request.getParameter("dealer_due_id"));

if (dealer_due_id > 0) {
	delstatus = service.deleteDealerDue(dealer_due_id, request, config);
	if (delstatus == true) {
		response.sendRedirect("../manage_dealer_due.jsp?msg=YesDel&id="+return_id);
	} else {
		response.sendRedirect("../manage_dealer_due.jsp?msg=NoDel&id="+return_id);
	}
}

//Delete purchase_id
int purchase_id = Integer.parseInt(request.getParameter("purchase_id") == null ? "0" : request.getParameter("purchase_id"));

if (purchase_id > 0) {
	delstatus = service.deletepurchaseBill(purchase_id, request, config);
	
	if(return_id>0){
	if (delstatus == true) {
		
			response.sendRedirect("../manage_dealer_all_bill.jsp?msg=YesDel&id="+return_id);
		}else{
			response.sendRedirect("../manage_purchase_bill.jsp?msg=YesDel");
		}
		
	} else {
		if (delstatus == true) {
			response.sendRedirect("../manage_purchase_bill.jsp?msg=YesDel");
		} else {
			response.sendRedirect("../manage_purchasse_bill.jsp?msg=NoDel");
		}
	}
}

//Delete purchase_return_id
int purchase_return_id = Integer.parseInt(request.getParameter("purchase_return_id") == null ? "0" : request.getParameter("purchase_return_id"));

if (purchase_return_id > 0) {
	delstatus = service.deletepurchaseBillReturn(purchase_return_id, request, config);
	if (delstatus == true) {
		response.sendRedirect("../manage_purchase_bill_return.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_purchase_bill_return.jsp?msg=NoDel");
	}
	
	
}


//Delete sell_id
int sell_id = Integer.parseInt(request.getParameter("sell_id") == null ? "0" : request.getParameter("sell_id"));

if (sell_id > 0) {
	delstatus = service.deleteSaleBill(sell_id, request, config);
	if (delstatus == true) {
		if(return_id>0){
			response.sendRedirect("../manage_customer_sell_bill.jsp?msg=YesDel&id="+return_id);
		}else{
			response.sendRedirect("../manage_sell_bill.jsp?msg=YesDel");
		}
		
	} else {
		if(return_id>0){
			response.sendRedirect("../manage_customer_sell_bill.jsp?msg=NoDel&id="+return_id);
		}else{
			response.sendRedirect("../manage_sell_bill.jsp?msg=NoDel");
		}
	}
}

//Delete sell_return_id
int sell_return_id = Integer.parseInt(request.getParameter("sell_return_id") == null ? "0" : request.getParameter("sell_return_id"));

if (sell_return_id > 0) {
	delstatus = service.deleteSaleBillReturn(sell_return_id, request, config);
	if (delstatus == true) {
		
			response.sendRedirect("../manage_sell_bill_return.jsp?msg=YesDel");
	}else{
			response.sendRedirect("../manage_sell_bill_return.jsp?msg=NoDel");
		}
		
	}







/* Delete Master  */

//Delete city
int city_id = Integer.parseInt(request.getParameter("city_id") == null ? "0" : request.getParameter("city_id"));

if (city_id > 0) {
	delstatus = service.deleteCity(city_id, request,config);
	if (delstatus == true) {
		System.out.println("Ajax Delete : "+delstatus);
		
		response.sendRedirect("../manage_city.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_city.jsp?msg=NoDel");
	}
}



//Delete measurement
int measurement_id = Integer.parseInt(request.getParameter("measurement_id") == null ? "0" : request.getParameter("measurement_id"));

if (measurement_id > 0) {
	delstatus = service.deleteMeasurement(measurement_id, request,config);
	if (delstatus == true) {
		response.sendRedirect("../manage_measurement.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_measurement.jsp?msg=NoDel");
	}
}

//Delete Category
int item_category_id = Integer.parseInt(request.getParameter("item_category_id") == null ? "0" : request.getParameter("item_category_id"));

if (item_category_id > 0) {
	delstatus = service.deleteItemCategory(item_category_id, request,config);
	if (delstatus == true) {
		response.sendRedirect("../manage_item_category.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_item_category.jsp?msg=NoDel");
	}
}

//Delete Company
int company_id = Integer
		.parseInt(request.getParameter("company_id") == null ? "0" : request.getParameter("company_id"));

if (company_id > 0) {
	delstatus = service.deleteCompany(company_id, request, config);
	if (delstatus == true) {
		response.sendRedirect("../manage_company.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_company.jsp?msg=NoDel");
	}
}

//Delete Color
int color_id = Integer.parseInt(request.getParameter("color_id") == null ? "0" : request.getParameter("color_id"));

if (color_id > 0) {
	delstatus = service.deleteColor(color_id, request, config);
	if (delstatus == true) {
		response.sendRedirect("../manage_color.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_color.jsp?msg=NoDel");
	}
}

//Delete msg
int msg_id = Integer.parseInt(request.getParameter("msg_id") == null ? "0" : request.getParameter("msg_id"));

if (msg_id > 0) {
	delstatus = service.deleteMsg(msg_id, request,config);
	if (delstatus == true) {
		response.sendRedirect("../manage_msg.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_msg.jsp?msg=NoDel");
	}
}


//Delete Bank
int bank_id = Integer.parseInt(request.getParameter("bank_id") == null ? "0" : request.getParameter("bank_id"));

if (bank_id > 0) {
	delstatus = service.deleteBank(bank_id, request,config);
	if (delstatus == true) {
		response.sendRedirect("../manage_bank.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_bank.jsp?msg=NoDel");
	}
}

//Delete User
int user_id = Integer.parseInt(request.getParameter("user_id") == null ? "0" : request.getParameter("user_id"));

if (user_id > 0) {
	delstatus = service.deleteUser(user_id, request,config);
	if (delstatus == true) {
		response.sendRedirect("../manage_user.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_user.jsp?msg=NoDel");
	}
}

//Delete income_head
int income_head_id = Integer.parseInt(request.getParameter("income_head_id") == null ? "0" : request.getParameter("income_head_id"));

if (income_head_id > 0) {
	delstatus = service.deleteIncomeHead(income_head_id, request, config);
	if (delstatus == true) {
		response.sendRedirect("../manage_income_head.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_income_head.jsp?msg=NoDel");
	}
}

//Delete Spend Head
int spend_head_id = Integer.parseInt(request.getParameter("spend_head_id") == null ? "0" : request.getParameter("spend_head_id"));

if (spend_head_id > 0) {
	delstatus = service.deleteSpendHead(spend_head_id, request, config);
	if (delstatus == true) {
		response.sendRedirect("../manage_spend_head.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_spend_head.jsp?msg=NoDel");
	}
}


//Delete Vehicle

int vehicle_id = Integer
		.parseInt(request.getParameter("vehicle_id") == null ? "0" : request.getParameter("vehicle_id"));
String flag = request.getParameter("flag") == null ? "" : request.getParameter("flag");

if (vehicle_id > 0) {
	delstatus = service.deleteVehicleInfo(vehicle_id, request, config);
	if (delstatus == true) {
		if (flag.equals("sold")) {
	response.sendRedirect("../manage_sold_vehicle.jsp?msg=YesDel");
		} else {
	response.sendRedirect("../manage_stock_vehicle.jsp?msg=YesDel");
		}
	} else {
		if (flag.equals("sold")) {
	response.sendRedirect("../manage_sold_vehicle.jsp?msg=YesDel");
		} else {
	response.sendRedirect("../manage_stock_vehicle.jsp?msg=YesDel");
		}
	}
}

int vehicle_due_id = Integer
		.parseInt(request.getParameter("vehicle_due_id") == null ? "0" : request.getParameter("vehicle_due_id"));
float paid_amt = Float
.parseFloat(request.getParameter("paid_amt") == null ? "0" : request.getParameter("paid_amt"));

if (vehicle_due_id > 0) {
	delstatus = service.deleteVehicleDue(return_id,vehicle_due_id,paid_amt, request, config);
	if (delstatus == true) {
		response.sendRedirect("../manage_vehicle_due.jsp?msg=YesDel&id=" + return_id);
	} else {
		response.sendRedirect("../manage_vehicle_due.jsp?msg=NoDel&id=" + return_id);
	}
}

int job_card_id = Integer
		.parseInt(request.getParameter("job_card_id") == null ? "0" : request.getParameter("job_card_id"));

if (job_card_id > 0) {
	delstatus = service.deleteJobCard(job_card_id, request, config);
	if (delstatus == true) {
		response.sendRedirect("../manage_job_card.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_job_card.jsp?msg=NoDel");
	}
}

int service_id = Integer
		.parseInt(request.getParameter("service_id") == null ? "0" : request.getParameter("service_id"));

if (service_id > 0) {
	delstatus = service.deleteServiceBill(service_id, request, config);
	if (delstatus == true) {
		response.sendRedirect("../manage_service_bill.jsp?msg=YesDel");
	} else {
		response.sendRedirect("../manage_service_bill.jsp?msg=NoDel");
	}
}


System.out.println(delstatus);
%>
<input type="hidden" id="delstatus" value="<%=delstatus%>" />
