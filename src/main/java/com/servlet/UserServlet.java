package com.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.UserDto;
import com.service.UserService;

/**
 * Servlet implementation class userservlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ServletConfig config;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}

	/**
	 * Default constructor.
	 */
	public UserServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		UserDto dto = new UserDto();
		UserService ser = new UserService();

		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));

		dto.setName(request.getParameter("Name") == null ? "" : request.getParameter("Name"));
		dto.setMobile_no(request.getParameter("Mobile_no") == null ? "" : request.getParameter("Mobile_no"));

		dto.setPassword(request.getParameter("Password") == null ? "" : request.getParameter("Password"));
		
		dto.setAddress(request.getParameter("Address") == null ? "" : request.getParameter("Address"));

		dto.setStatus(request.getParameter("Status") == null ? "" : request.getParameter("Status"));

		dto.setDelete_module(
				request.getParameter("Delete_module") == null ? "" : request.getParameter("Delete_module"));
		dto.setUser_module(request.getParameter("User_module") == null ? "" : request.getParameter("User_module"));
		dto.setUpdate_module(
				request.getParameter("Update_module") == null ? "" : request.getParameter("Update_module"));

		dto.setMaster_module(
				request.getParameter("Master_module") == null ? "" : request.getParameter("Master_module"));
		dto.setSell_module(
				request.getParameter("Sell_module") == null ? "" : request.getParameter("Sell_module"));
		dto.setPurchase_module(
				request.getParameter("Purchase_module") == null ? "" : request.getParameter("Purchase_module"));
		dto.setSell_report(
				request.getParameter("Sell_report") == null ? "" : request.getParameter("Sell_report"));
		dto.setPurchase_report(
				request.getParameter("Purchase_report") == null ? "" : request.getParameter("Purchase_report"));
		dto.setSell_return_module(
				request.getParameter("Sell_return_module") == null ? "" : request.getParameter("Sell_return_module"));
		dto.setPurchase_return_module(
				request.getParameter("Purchase_return_module") == null ? "" : request.getParameter("Purchase_return_module"));
		dto.setSell_return_report(
				request.getParameter("Sell_return_report") == null ? "" : request.getParameter("Sell_return_report"));
		dto.setPurchase_return_report(
				request.getParameter("Purchase_return_report") == null ? "" : request.getParameter("Purchase_return_report"));
		dto.setSpend_head_module(
				request.getParameter("Spend_head_module") == null ? "" : request.getParameter("Spend_head_module"));
		dto.setSpend_module(
				request.getParameter("Spend_module") == null ? "" : request.getParameter("Spend_module"));
		dto.setSpend_report(
				request.getParameter("Spend_report") == null ? "" : request.getParameter("Spend_report"));
		dto.setDealer_report(
				request.getParameter("Dealer_report") == null ? "" : request.getParameter("Dealer_report"));
		dto.setCustomer_report(
				request.getParameter("Customer_report") == null ? "" : request.getParameter("Customer_report"));
		dto.setSell_item_report(
				request.getParameter("Sell_item_report") == null ? "" : request.getParameter("Sell_item_report"));
		dto.setPur_item_report(
				request.getParameter("Pur_item_report") == null ? "" : request.getParameter("Pur_item_report"));
		dto.setSell_item_return_report(
				request.getParameter("Sell_item_return_report") == null ? "" : request.getParameter("Sell_item_return_report"));
		dto.setPur_item_return_report(
				request.getParameter("Pur_item_return_report") == null ? "" : request.getParameter("Pur_item_return_report"));
		dto.setRequired_item_report(
				request.getParameter("Required_item_report") == null ? "" : request.getParameter("Required_item_report"));
		dto.setIncome_head_module(
				request.getParameter("Income_head_module") == null ? "" : request.getParameter("Income_head_module"));
		dto.setIncome_module(
				request.getParameter("Income_module") == null ? "" : request.getParameter("Income_module"));
		dto.setIncome_report(
				request.getParameter("Income_report") == null ? "" : request.getParameter("Income_report"));
		dto.setEmployee_module(
				request.getParameter("Employee_module") == null ? "" : request.getParameter("Employee_module"));
		dto.setVehicle_module(
				request.getParameter("Vehicle_module") == null ? "" : request.getParameter("Vehicle_module"));
		dto.setStock_vehicle_module(
				request.getParameter("Stock_vehicle_module") == null ? "" : request.getParameter("Stock_vehicle_module"));
		dto.setSold_vehicle_module(
				request.getParameter("Sold_vehicle_module") == null ? "" : request.getParameter("Sold_vehicle_module"));
		dto.setFinance_module(
				request.getParameter("Finance_module") == null ? "" : request.getParameter("Finance_module"));
		dto.setJob_card_module(
				request.getParameter("Job_card_module") == null ? "" : request.getParameter("Job_card_module"));
		dto.setJob_card_report(
				request.getParameter("Job_card_report") == null ? "" : request.getParameter("Job_card_report"));
				dto.setService_report(
						request.getParameter("Service_report") == null ? "" : request.getParameter("Service_report"));
				dto.setOther_dealer_report(
						request.getParameter("Other_dealer_report") == null ? "" : request.getParameter("Other_dealer_report"));
				dto.setOther_purchase_module(
						request.getParameter("Other_purchase_module") == null ? "" : request.getParameter("Other_purchase_module"));
				dto.setOther_purchase_report(
						request.getParameter("Other_purchase_report") == null ? "" : request.getParameter("Other_purchase_report"));
			

		int flag = (Integer.parseInt(request.getParameter("flag") == null ? "0" : request.getParameter("flag")));

		boolean b = false;

		if (dto.getId() == 0) {

			b = ser.insertUser(dto, request, config);

			if (b) {

				response.sendRedirect("add_user.jsp?msg=Yes");
			} else {

				response.sendRedirect("add_user.jsp?msg=No");

			}
		}

		else {

			if (flag == 2) {

				b = ser.UpdateUserById(dto, request, config);

			} 
			else if (flag == 1) {

				b = ser.updateUserInfoById(dto, request, config);

			} else if (flag == 3) {

				b = ser.updateUserPasswordById(dto, request, config);

			} else  {
				b = ser.UpdateUser(dto, request, config);
			}

			if (b) {
				
				if(flag==1 || flag==3) {
					response.sendRedirect("user_profile.jsp?msg=YesUp");
				}
				else {
				response.sendRedirect("manage_user.jsp?msg=YesUp");
				}

			} else { if(flag==1 || flag==3) {
				response.sendRedirect("user_profile.jsp?msg=NoUp");
			}
			else {

				response.sendRedirect("manage_user.jsp?msg=NoUp");

				}

			}

		}
	}
}
