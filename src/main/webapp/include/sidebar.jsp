<%@page import="com.dto.UserDto"%>
<%@page import="com.service.UserService"%>

<%
UserService user_sidebar_ser1 = new UserService();
UserDto user_sidebar_dto1 = user_sidebar_ser1.getuserInfoById(user_id, config, request);
%>

<%
if (user_id > 0) {
%>


<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">
	<ul class="sidebar-nav" id="sidebar-nav">

		<li class="nav-item"><a class="nav-link collapsed"
			href="index.jsp"> <i class="fa fa-home" aria-hidden="true"></i> <span>HOME</span>
		</a></li>



		<!-- End Home Nav -->
		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#vehicle" data-bs-toggle="collapse" href="#"> <i
				class="fas fa-user-graduate"></i><span>VEHICLES </span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="vehicle" class="collapse " data-bs-parent="#sidebar-nav">
				<%
				if (user_sidebar_dto1.getVehicle_module().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="add_vehicle.jsp"> <i
						class="fa fa-sign-out" aria-hidden="true"></i> <span>
							    VEHICLES</span>
				</a></li>
				<%
				}
				%>
				<%
				if (user_sidebar_dto1.getStock_vehicle_module().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_stock_vehicle.jsp"> <i
						class="fa fa-sign-out" aria-hidden="true"></i> <span> STOCK
							VEHICLES </span>
				</a></li>
				<%
				}
				%>
				<%
				if (user_sidebar_dto1.getSold_vehicle_module().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_sold_vehicle.jsp"> <i
						class="fa fa-sign-out" aria-hidden="true"></i> <span> SOLD
							VEHICLES </span>
				</a></li>
				<%
				}
				%>
				<%
				if (user_sidebar_dto1.getFinance_module().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_vehicle_finance.jsp"> <i
						class="fa fa-wrench" aria-hidden="true"></i> <span>FINANCE
							</span>
				</a></li>
				<!-- End Finance Nav -->
				<%
				}
				%>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_city.jsp"> <i
						class="fa fa-wrench" aria-hidden="true"></i> <span> CITY </span>
				</a></li>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_company.jsp"> <i
						class="fa fa-wrench" aria-hidden="true"></i> <span> COMPANY </span>
				</a></li>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_color.jsp"> <i
						class="fa fa-wrench" aria-hidden="true"></i> <span> COLOR </span>
				</a></li>
			</ul></li>
		<!-- End vehicle Nav -->

		<!-- <li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#oldvehicle" data-bs-toggle="collapse" href="#">
					<i class="fas fa-user-graduate"></i><span>Old Vehicles </span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="oldvehicle" class="collapse " data-bs-parent="#sidebar-nav">

					<li class="nav-item" style="margin-top: 5px;"><a
						class="nav-link collapsed" href="add_old_vehicle.jsp"> <i
							class="fa fa-sign-out" aria-hidden="true"></i> <span>Add
								Vehicles </span>
					</a></li>

					<li class="nav-item" style="margin-top: 5px;"><a
						class="nav-link collapsed" href="manage_stock_old_vehicle.jsp">
							<i class="fa fa-sign-out" aria-hidden="true"></i> <span>
								Stock Vehicles </span>
					</a></li>

					<li class="nav-item" style="margin-top: 5px;"><a
						class="nav-link collapsed" href="manage_sold_old_vehicle.jsp">
							<i class="fa fa-sign-out" aria-hidden="true"></i> <span>
								Sold Vehicles </span>
					</a></li>

				</ul></li> -->



		<!-- End Old Vehicle Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#job_card" data-bs-toggle="collapse" href="#"> <i
				class="fas fa-cart-plus"></i><span>JOB CARD</span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="job_card" class="collapse " data-bs-parent="#sidebar-nav">
				 <%
				if (user_sidebar_dto1.getJob_card_module().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="add_job_card_paid.jsp"> <i
						class="fa fa-sign-out" aria-hidden="true"></i> <span>JOB CARD</span>
				</a></li>
				<%
				}
				%> 
				<%
				if (user_sidebar_dto1.getJob_card_report().equalsIgnoreCase("Yes")) {
				%>

				<li class="nav-item" style="margin-top: 5px;"><a class="nav-link collapsed"
					href="manage_job_card.jsp"> <i class="fa fa-sign-out"
						aria-hidden="true"></i> <span>JOB CARD REPORT</span>
				</a></li>
				<%
				}
				%>
			</ul></li>
		<!-- End Job card Nav -->
	
<%
		if (user_sidebar_dto1.getService_report().equalsIgnoreCase("Yes")) {
		%>
<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#service" data-bs-toggle="collapse" href="#"> <i
				class="fas fa-cart-plus"></i><span>SERVICING</span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="service" class="collapse " data-bs-parent="#sidebar-nav">
				
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_service_bill.jsp"> <i
						class="fa fa-sign-out" aria-hidden="true"></i> <span>SERVICING REPORT</span>
				</a></li>
			

				<li class="nav-item" style="margin-top: 5px;"><a class="nav-link collapsed"
					href="manage_service_bill_item.jsp"> <i class="fa fa-sign-out"
						aria-hidden="true"></i> <span>SERVICING ITEM REPORT</span>
				</a></li>
				
			</ul></li>

<%
				}
				%>







		<!--  -->
		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#inventory" data-bs-toggle="collapse" href="#"> <i
				class="fas fa-user-graduate"></i><span>INVENTORY </span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="inventory" class="collapse " data-bs-parent="#sidebar-nav">

				<%
				if (user_sidebar_dto1.getSell_module().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="sell_bill.jsp"> <i
						class="fa fa-star" aria-hidden="true"></i> <span>SELL</span>
				</a></li>
				<%
				}
				%>
				<!-- End sell Nav -->
<%
				if (user_sidebar_dto1.getSell_report().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_sell_bill.jsp"> <i
						class="fa fa-clipboard" aria-hidden="true"></i> <span>SELL BILLS</span>
				</a></li>
				<%
				}
				%>
<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_stock_item.jsp"> <i
						class="fa fa-clipboard" aria-hidden="true"></i> <span>STOCK REPORT</span>
				</a></li>
				<%
				if (user_sidebar_dto1.getPurchase_module().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="purchase_bill.jsp"> <i
						class="fa fa-cart-shopping" aria-hidden="true"></i> <span>PURCHASE</span>
				</a></li>
				<%
				}
				%>
				<!-- End Purchase Nav -->
				
	<%
				if (user_sidebar_dto1.getCustomer_report().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item"><a class="nav-link collapsed"
					href="manage_customer.jsp"> <i class="fa fa-user"
						aria-hidden="true"></i> <span>CUSTOMER</span>
				</a></li>
				<%
				}
				%>
				<!-- End Customer report Nav -->
				<%
				if (user_sidebar_dto1.getDealer_report().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item"><a class="nav-link collapsed"
					href="manage_dealer.jsp"> <i class="fa fa-handshake"
						aria-hidden="true"></i> <span>DEALER</span>
				</a></li>
				<%
				}
				%>


				<!-- End Dealer  Nav -->

				<!-- End stock report Nav -->
				
				<!-- End Purchase report Nav -->
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" data-bs-target="#sell_bill"
					data-bs-toggle="collapse" href="#" data-bs-parent="#sidebar-nav">
						<i class="fas fa-list"></i><span>PURCHASE REPORTS</span><i
						class="bi bi-chevron-down ms-auto"></i>
				</a>
					<ul id="sell_bill" class="collapse " data-bs-parent="#sell_bill">
					<%
						if (user_sidebar_dto1.getPurchase_report().equalsIgnoreCase("Yes")) {
						%>
						<li class="nav-item" style="margin-top: 5px;"><a class="nav-link collapsed"
							href="manage_purchase_bill.jsp"> <i class="fa fa-clipboard"
								aria-hidden="true"></i> <span>  BILLS</span>
						</a></li>
						<%
						}
						%>
						<%
						if (user_sidebar_dto1.getPur_item_report().equalsIgnoreCase("Yes")) {
						%>
						<li class="nav-item" style="margin-top: 5px;"><a
							class="nav-link collapsed" href="manage_purchase_bill_item.jsp">
								<i class="fa fa-clipboard" aria-hidden="true"></i> <span> ITEM</span>
						</a></li>
						<%
						}
						%>
						<%
						if (user_sidebar_dto1.getPurchase_return_module().equalsIgnoreCase("Yes")) {
						%>
						<li class="nav-item" style="margin-top: 5px;"><a
							class="nav-link collapsed" href="purchase_bill_return.jsp"> <i
								class="fa fa-star" aria-hidden="true"></i> <span> RETURN</span>
						</a></li>
						<%
						}
						%>
						<%
						if (user_sidebar_dto1.getPurchase_return_report().equalsIgnoreCase("Yes")) {
						%>
						<li class="nav-item" style="margin-top: 5px;"><a
							class="nav-link collapsed" href="manage_purchase_bill_return.jsp">
								<i class="fa fa-star" aria-hidden="true"></i> <span> RETURN REPORTS</span>
						</a></li>
						<%
						}
						%>
						<%
						if (user_sidebar_dto1.getPur_item_return_report().equalsIgnoreCase("Yes")) {
						%>
						<li class="nav-item" style="margin-top: 5px;"><a
							class="nav-link collapsed"
							href="manage_purchase_bill_return_item.jsp"> <i
								class="fa fa-star" aria-hidden="true"></i> <span> ITEM RETURN</span>
						</a></li>
						<%
						}
						%>
						<%
						if (user_sidebar_dto1.getRequired_item_report().equalsIgnoreCase("Yes")) {
						%>
						<li class="nav-item" style="margin-top: 5px;"><a
							class="nav-link collapsed" href="manage_required_item.jsp"> <i
								class="fa fa-clipboard" aria-hidden="true"></i> <span>LOW STOCK </span>
						</a></li>
						<%
						}
						%>
						
						<!-- End Purchase report Nav -->
					</ul></li>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" data-bs-target="#return_bill"
					data-bs-toggle="collapse" href="#" data-bs-parent="#sidebar-nav">
						<i class="fas fa-list"></i><span>SELL REPORTS</span><i
						class="bi bi-chevron-down ms-auto"></i>
				</a>
					<ul id="return_bill" class="collapse" data-bs-parent="#return_bill">
					<%
						if (user_sidebar_dto1.getSell_item_report().equalsIgnoreCase("Yes")) {
						%>
						<li class="nav-item" style="margin-top: 5px;"><a
							class="nav-link collapsed" href="manage_sell_bill_item.jsp">
								<i class="fa fa-clipboard" aria-hidden="true"></i> <span> ITEM</span>
						</a></li>
						<%
						}
						%>
						<%
						if (user_sidebar_dto1.getSell_return_module().equalsIgnoreCase("Yes")) {
						%>
						<li class="nav-item" style="margin-top: 5px;"><a
							class="nav-link collapsed" href="sell_bill_return.jsp"> <i
								class="fa fa-star" aria-hidden="true"></i> <span> RETURN</span>
						</a></li>
						<%
						}
						%>
						<%
						if (user_sidebar_dto1.getSell_return_report().equalsIgnoreCase("Yes")) {
						%>
						<li class="nav-item" style="margin-top: 5px;"><a
							class="nav-link collapsed" href="manage_sell_bill_return.jsp">
								<i class="fa fa-star" aria-hidden="true"></i> <span> RETURN REPORTS</span>
						</a></li>
						<%
						}
						%>
						<%
						if (user_sidebar_dto1.getSell_item_return_report().equalsIgnoreCase("Yes")) {
						%>
						<li class="nav-item" style="margin-top: 5px;"><a
							class="nav-link collapsed"
							href="manage_sell_bill_return_item.jsp"> <i
								class="fa fa-star" aria-hidden="true"></i> <span> ITEM RETURN</span>
						</a></li>
						<%
						}
						%>
						<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_customer_upcoming_due.jsp"> <i
						class="fa fa-clipboard" aria-hidden="true"></i> <span>CUSTOMER DUE</span>
				</a></li>
				
						<!-- End Purchase report Nav -->
					</ul></li>

			
			</ul></li>
		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#other" data-bs-toggle="collapse" href="#"> <i
				class="fas fa-user-graduate"></i><span>OTHER DEALER </span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="other" class="collapse " data-bs-parent="#sidebar-nav">
				<%
				if (user_sidebar_dto1.getOther_purchase_module().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="add_purchase_other_bill.jsp">
						<i class="fa fa-cart-shopping" aria-hidden="true"></i> <span>OTHER PURHASE</span>
				</a></li>
				<%
				}
				%>
				<!-- End Purchase Nav -->






				<%
				if (user_sidebar_dto1.getOther_purchase_report().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_purchase_other_bill.jsp">
						<i class="fa fa-clipboard" aria-hidden="true"></i> <span>OTHER PURCHASE BILLS</span>
				</a></li>
				<%
				}
				%>
				<!-- End Other Purchase report Nav -->


				<%
				if (user_sidebar_dto1.getOther_dealer_report().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_dealer_other.jsp"> <i
						class="fa fa-user" aria-hidden="true"></i> <span> OTHER DEALER</span>
				</a></li>
				<%
				}
				%>
					
				<!-- End Dealer Other Nav -->


			</ul></li>
		<!-- End vehicle Nav -->




		<!-- End Sell Nav -->


		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#spent" data-bs-toggle="collapse" href="#"> <i
				class="fa-solid fa-coins"></i><span>SPEND </span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="spent" class="collapse " data-bs-parent="#spent">
				<%
				if (user_sidebar_dto1.getSpend_module().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="add_spend.jsp"> <i
						class="fa fa-sign-out" aria-hidden="true"></i> <span>SPEND</span>
				</a></li>
				<%
				}
				%>
				<%
				if (user_sidebar_dto1.getSpend_report().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_spend.jsp"> <i
						class="fa fa-sign-out" aria-hidden="true"></i> <span>SPEND REPORTS</span>
				</a></li>
				<%
				}
				%>
				
						<%
						if (user_sidebar_dto1.getSpend_head_module().equalsIgnoreCase("Yes")) {
						%>
					
						<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_spend_head.jsp"> <i
						class="fa fa-sign-out" aria-hidden="true"></i> <span>SPEND HEAD REPORTS</span>
				</a></li>
						<%
						}
						%>
				
			</ul></li>
		<!-- End spend Nav -->
		<!-- Start Income Nav -->
		<%
		if (user_sidebar_dto1.getIncome_module().equalsIgnoreCase("Yes")) {
		%>
		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#income_nav" data-bs-toggle="collapse" href="#"><i
				class="fa-solid fa-hand-holding-dollar"></i><span>INCOME</span><i
				class="bi bi-chevron-down ms-auto"></i> </a>
			<ul id="income_nav" class="collapse " data-bs-parent="#sidebar-nav">

				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="add_income.jsp"> <i
						class="fa fa-sign-out" aria-hidden="true"></i><span>INCOME</span>
				</a></li>
				<%
				if (user_sidebar_dto1.getIncome_report().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_income.jsp"> <i
						class="fa fa-sign-out" aria-hidden="true"></i> <span>INCOME REPORTS</span>
				</a></li>
				<%
				}
				%>
					<%
						if (user_sidebar_dto1.getIncome_head_module().equalsIgnoreCase("Yes")) {
						%>
						
<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_income_head.jsp"> <i
						class="fa fa-sign-out" aria-hidden="true"></i> <span>INCOME HEAD REPORTS</span>
				</a></li>
					

						<%
						}
						%>
			</ul></li>

		<%
		}
		%>
		<!-- End Income Nav -->

		<%
		if (user_sidebar_dto1.getEmployee_module().equals("Yes")) {
		%>
		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#employee" data-bs-toggle="collapse" href="#"> <i
				class="fas fa-users"></i><span>EMPLOYEE</span><i
				class="bi bi-chevron-down ms-auto"></i></a>

			<ul id="employee" class="collapse " data-bs-parent="#sidebar-nav">

				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="add_employee.jsp"> <i
						class="fa fa-sign-out" aria-hidden="true"></i> <span>EMPLOYEE</span>
				</a></li>

				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_employee.jsp"> <i
						class="fa fa-sign-out" aria-hidden="true"></i> <span>
							EMPLOYEE REPORTS</span>
				</a></li>

				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="pay_all_employee_salary.jsp">
						<i class="fa fa-sign-out" aria-hidden="true"></i> <span>PAY SALARY</span>
				</a></li>

				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_all_employee_salary.jsp">
						<i class="fa fa-sign-out" aria-hidden="true"></i> <span>
							SALARY REPORTS</span>
				</a></li>

				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="employee_attendence_entry.jsp">
						<i class="fa fa-sign-out" aria-hidden="true"></i> <span>ENTER ATTENDANCE</span>
				</a></li>

				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="view_employee_attendance.jsp">
						<i class="fa fa-sign-out" aria-hidden="true"></i> <span>ATTENDANCE
							REPORT</span>
				</a></li>
			</ul></li>
		<%
		}
		%>
		<!-- End Employee Nav -->



		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#payment_nav" data-bs-toggle="collapse" href="#">
				<i class="fa-solid fa-indian-rupee-sign"></i><span>PAYMENT REPORTS</span><i class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="payment_nav" class="collapse " data-bs-parent="#sidebar-nav">

				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_cash_payment.jsp"> <i
						class="fa fa-clipboard" aria-hidden="true"></i> <span>CASH REPORTS</span>
				</a></li>

				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_online_payment.jsp"> <i
						class="fa fa-clipboard" aria-hidden="true"></i> <span>ONLINE REPORTS</span>
				</a></li>
			</ul></li>
		<!-- End Payment Nav -->
<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#payment_navi" data-bs-toggle="collapse" href="#">
				<i class="fa-solid fa-indian-rupee-sign"></i><span>UPCOMING PAYMENTS
					</span><i class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="payment_navi" class="collapse " data-bs-parent="#sidebar-nav">

				

				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_sold_vehicle_upcoming_due.jsp"> <i
						class="fa fa-clipboard" aria-hidden="true"></i> <span>VEHICLE DUE</span>
				</a></li>
				<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_service_bill_upcoming_due.jsp"> <i
						class="fa fa-clipboard" aria-hidden="true"></i> <span>SERVICING DUE</span>
				</a></li>
			</ul></li>
		<!-- End Payment Nav -->
		
		
		<li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" data-bs-target="#addmaster"
					data-bs-toggle="collapse" href="#"> <i class="fa fa-plus"
						aria-hidden="true"></i><span>ITEM MODULE</span><i
						class="bi bi-chevron-down ms-auto"></i>
				</a>
					<ul id="addmaster" class="nav-content collapse"
						data-bs-parent="#master">
						



				
						<li><a href="manage_measurement.jsp"> <i
								class="bi bi-circle"></i><span>MEASUREMENT </span>
						</a></li>

						<li><a href="manage_item_category.jsp"> <i
								class="bi bi-circle"></i><span>CATEGORY</span>
						</a></li>

						<li><a href="add_item.jsp"> <i class="bi bi-circle"></i><span>ITEM</span>
						</a></li>

						

						


					


					</ul></li>
					
					
					<!-- Bank Start -->
<li class="nav-item" style="margin-top: 5px;"><a
	class="nav-link collapsed" data-bs-target="#bank_nav"
	data-bs-toggle="collapse" href="#"> <i
		class="fa-solid fa-award"></i> <span>BANK</span> <i
		class="bi bi-chevron-down ms-auto"></i>
</a>
	<ul id="bank_nav" class="nav-content collapse"
		data-bs-parent="#master">
		<li><a href="add_bank.jsp"> <i class="bi bi-circle"></i>
				<span>BANK</span>
		</a></li>
		<li><a href="manage_bank.jsp"> <i class="bi bi-circle"></i>
				<span>BANK REPORT</span>
		</a></li>
		
		<li><a href="add_bank_cash_credit.jsp"> <i class="bi bi-circle"></i>
				<span>CASH CREDIT</span>
		</a></li>
		<li><a href="manage_bank_cash_credit.jsp"> <i class="bi bi-circle"></i>
				<span>CASH CREDIT REPORT</span>
		</a></li>
		<li><a href="add_bank_transaction.jsp"> <i class="bi bi-circle"></i>
				<span>TRANSACTION</span>
		</a></li>
		<li><a href="manage_bank_transaction.jsp"> <i class="bi bi-circle"></i>
				<span>TRANSACTION REPORT</span>
		</a></li>
		
		
	</ul></li>
<!-- End Bank -->

<!-- <li class="nav-item" style="margin-top: 5px;"><a
					class="nav-link collapsed" href="manage_msg.jsp"> <i
						class="fa fa-sign-out" aria-hidden="true"></i> <span>MESSAGE
							</span>
				</a></li> -->
				<%
				if (user_sidebar_dto1.getUser_module().equalsIgnoreCase("Yes")) {
				%>
				<li class="nav-item"><a class="nav-link collapsed"
					data-bs-target="#user" data-bs-toggle="collapse" href="#"> <i
						class="fa fa-user" aria-hidden="true"></i><span>USER</span><i
						class="bi bi-chevron-down ms-auto"></i>
				</a>
					<ul id="user" class="nav-content collapse" data-bs-parent="#master">
						<li><a href="add_user.jsp"> <i class="bi bi-circle"></i><span>USER</span>
						</a></li>
						<li><a href="manage_user.jsp"> <i class="bi bi-circle"></i><span>USER REPORTS</span>
						</a></li>
					</ul></li>

				<%
				}
				%>

				<!-- End Project Nav -->
			
		<!-- End city Nav -->
		<%
		}
		%>


		<li class="nav-item" style="margin-top: 5px;"><a
			class="nav-link collapsed" href="logout.jsp"> <i
				class="fa fa-sign-out" aria-hidden="true"></i> <span>LOGOUT</span>
		</a></li>
		<!-- End Logout Page Nav -->
	</ul>
</aside>
<!-- End Sidebar-->



<div id="name_avail_resposnse" class="col-12" style="display: none;"></div>