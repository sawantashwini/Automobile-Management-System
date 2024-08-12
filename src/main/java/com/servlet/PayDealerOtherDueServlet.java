package com.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.PaymentDto;
import com.dto.PurchaseOtherDto;
import com.service.DealerOtherService;

/**
 * Servlet implementation class PayDealerOtherDueServlet
 */
@WebServlet("/PayDealerOtherDueServlet")
public class PayDealerOtherDueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ServletConfig config;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PayDealerOtherDueServlet() {
		super();
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
		doGet(request, response);

		PurchaseOtherDto dto = new PurchaseOtherDto();
		PaymentDto pay_dto = new PaymentDto();
		DealerOtherService ser = new DealerOtherService();
		// Integer
		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));

		dto.setBank_id_fk(Integer
				.parseInt(request.getParameter("Bank_id_fk") == null ? "0" : request.getParameter("Bank_id_fk")));

		dto.setUser_id_fk(Integer
				.parseInt(request.getParameter("User_id_fk") == null ? "0" : request.getParameter("User_id_fk")));

		dto.setDealer_id_fk(Integer.parseInt(request.getParameter("Dealer_id_fk") == null ? "0" : request.getParameter("Dealer_id_fk")));

		dto.setBill_id_fk(Integer.parseInt(request.getParameter("Bill_id_fk") == null ? "0" : request.getParameter("Bill_id_fk")));

		dto.setDealer_account_id_fk(Integer.parseInt(request.getParameter("Dealer_account_id_fk") == null ? "0" : request.getParameter("Dealer_account_id_fk")));

		// String

		dto.setType(request.getParameter("Type") == null ? "" : request.getParameter("Type"));

		dto.setIn_date(request.getParameter("In_date") == null ? "" : request.getParameter("In_date"));

		dto.setPay_date(request.getParameter("Pay_date") == null ? "" : request.getParameter("Pay_date"));

		dto.setC_y_session(request.getParameter("C_y_session") == null ? "" : request.getParameter("C_y_session"));

		dto.setCurrent_in_date(
				request.getParameter("Current_in_date") == null ? "" : request.getParameter("Current_in_date"));

		dto.setRemark(request.getParameter("Remark") == null ? "" : request.getParameter("Remark"));

		dto.setPayment_mode(request.getParameter("Payment_mode") == null ? "" : request.getParameter("Payment_mode"));

		dto.setOnline_way(request.getParameter("Online_way") == null ? "" : request.getParameter("Online_way"));

		dto.setOnline_remark(
				request.getParameter("Online_remark") == null ? "" : request.getParameter("Online_remark"));

		dto.setOnline_date(request.getParameter("Online_date") == null ? "" : request.getParameter("Online_date"));

		dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));
		// Float

		dto.setCash_amount(Float.parseFloat(
				request.getParameter("Cash_amount") == null || request.getParameter("Cash_amount") == "" ? "0.0"
						: request.getParameter("Cash_amount")));

		dto.setOnline_amount(Float.parseFloat(
				request.getParameter("Online_amount") == null || request.getParameter("Online_amount") == "" ? "0.0"
						: request.getParameter("Online_amount")));

		dto.setDebit_amt(Float
				.parseFloat(request.getParameter("Debit_amt") == null || request.getParameter("Debit_amt") == "" ? "0.0"
						: request.getParameter("Debit_amt")));

		dto.setCredit_amt(Float.parseFloat(
				request.getParameter("Credit_amt") == null || request.getParameter("Credit_amt") == "" ? "0.0"
						: request.getParameter("Credit_amt")));

		dto.setPay_amount(Float.parseFloat(
				request.getParameter("Pay_amount") == null || request.getParameter("Pay_amount") == "" ? "0.0"
						: request.getParameter("Pay_amount")));

		// ************PAYMENT DTO VALUES***********

		// Integer
		pay_dto.setBill_id_fk(Integer.parseInt(request.getParameter("Id") == null ?  "0" : request.getParameter("Id")));
		pay_dto.setBank_id_fk(Integer.parseInt(request.getParameter("Bank_id_fk") == null ? "0" : request.getParameter("Bank_id_fk")));
		// Float
		pay_dto.setDebit_online_amount(Float.parseFloat(request.getParameter("Online_amount") == null ||request.getParameter("Online_amount") == "" ? "0.0" : request.getParameter("Online_amount")));
		pay_dto.setDebit_cash_amount(Float.parseFloat(request.getParameter("Cash_amount") == null ||request.getParameter("Cash_amount") == "" ? "0.0" : request.getParameter("Cash_amount")));
	
		// String
		pay_dto.setRemark(request.getParameter("Remark") == null ? "" : request.getParameter("Remark"));
		pay_dto.setOnline_remark(request.getParameter("Online_remark") == null ? "" : request.getParameter("Online_remark"));
		pay_dto.setOnline_date(request.getParameter("Online_date") == null ? "" : request.getParameter("Online_date"));
		pay_dto.setOnline_way(request.getParameter("Online_way") == null ? "" : request.getParameter("Online_way"));
		pay_dto.setIn_date(request.getParameter("Pay_date") == null ? "" : request.getParameter("Pay_date"));
		pay_dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));
		pay_dto.setType("Due");

		// condition for insert
		int id = 0;
		int b = 0;
		if (dto.getId() == 0) {

			id = ser.insertDealerOtherDue(pay_dto, dto, request, config);
			if (id > 0) {

				response.sendRedirect("manage_dealer_other.jsp?msg=Yes&id=" + id);

			} else {

				response.sendRedirect("manage_dealer_other.jsp?msg=No");
			}
		}

		// condition for updating
		else {

			b = ser.updateDealerOtherDue(pay_dto, dto, request, config);

			if (b!=0) {

				response.sendRedirect("manage_dealer_other_due.jsp?msg=YesUp&id=" + dto.getDealer_id_fk());
			} else {

				response.sendRedirect("manage_dealer_other_due.jsp?msg=NoUp&id=" + dto.getDealer_id_fk());

			}

		}

	}

}
