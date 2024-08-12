
<div class="pagetitle" style="text-align: right;">
	<%
	// Define the list of breadcrumb items and their corresponding href values
	String[][] addItemHrefs = { { "manage_item_category.jsp" }, { "manage_city.jsp" }, { "manage_company.jsp" },
			{ "manage_color.jsp" }, { "manage_measurement.jsp" }, { "manage_stock_item.jsp" }, { "manage_spend_head.jsp" },
			{ "manage_income_head.jsp" }, { "manage_msg.jsp" }, { "manage_job_card.jsp" }, { "manage_sell_bill.jsp" },
			{ "manage_purchase_bill.jsp" }, { "manage_customer.jsp" }, { "manage_dealer.jsp" },
			{ "manage_purchase_other_bill.jsp" }, { "manage_dealer_other.jsp" }, { "manage_spend.jsp" }, { "manage_income.jsp" },{ "manage_stock_vehicle.jsp" } };
	String[] addRichItemHrefs = { "add_item_category.jsp", "add_city.jsp", "add_company.jsp", "add_color.jsp",
			"add_measurement.jsp", "add_item.jsp", "add_spend_head.jsp", "add_income_head.jsp", "add_msg.jsp",
			"add_job_card_paid.jsp", "sell_bill.jsp", "purchase_bill.jsp", "add_customer.jsp", "add_dealer.jsp",
			"add_purchase_other_bill.jsp", "add_dealer_other.jsp", "add_spend.jsp", "add_income.jsp","add_vehicle.jsp" };// Get the current URL
	String[] addTitle = { "Item Category", "City", "Company", "Color", "Measurement", "Item", "Spend Head", "Income Head",
			"Msg", "Job Card ", "Sell Bill", "Purchase Bill", "Customer", "Dealer", "Purchase Other Bill",
			"Dealer Other", "Spend", "Income", "Vehicle" };
	String currentURL = request.getRequestURI(); // You may need to adjust this based on your servlet container

	for (int j = 0; j < addItemHrefs.length; j++) {
		String addRichsItemHref = addRichItemHrefs[j];
		String addTitles = addTitle[j];
		String[] currentAddItemHrefs = addItemHrefs[j];

		for (String addItemHref : currentAddItemHrefs) {
			if (currentURL.contains(addItemHref)) {
		String fullURL = request.getContextPath() + "/" + addRichsItemHref;
	%>
	<button style="font-weight: 1000; border: 1px solid #f03f02;" onclick="window.location.href = '<%=fullURL%>';" type="submit" class="submit-btn btn4"><i class="fa-solid fa-circle-plus"></i>  <%=addTitles%></button>
	<%
	}
	}
	}
	%>


</div>

<style>
.btn4:hover {
	 border: 1px solid #f03f02; 
	background-color: #fff;
	color: #f03f02;
}
</style>

