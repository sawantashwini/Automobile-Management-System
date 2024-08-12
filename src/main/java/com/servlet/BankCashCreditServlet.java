package com.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.BankDto;
import com.service.BankCashCreditService;

/**
 * Servlet implementation class BankCashCreditServlet
 */
@WebServlet("/BankCashCreditServlet")
public class BankCashCreditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletConfig config;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BankCashCreditServlet() {
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
		BankDto dto = new BankDto();
		BankCashCreditService ser = new BankCashCreditService();
		// Integer
		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));
		dto.setCash_id_fk(Integer.parseInt(request.getParameter("Cash_id_fk") == null ? "0" : request.getParameter("Cash_id_fk")));
		dto.setOnline_id_fk(Integer.parseInt(request.getParameter("Online_id_fk") == null ? "0" : request.getParameter("Online_id_fk")));
		dto.setUser_id_fk(Integer
				.parseInt(request.getParameter("User_id_fk") == null ? "0" : request.getParameter("User_id_fk")));
		dto.setDebit_bank_id_fk(Integer.parseInt(
				request.getParameter("Debit_bank_id_fk") == null ? "0" : request.getParameter("Debit_bank_id_fk")));
		dto.setCredit_bank_id_fk(Integer.parseInt(
				request.getParameter("Credit_bank_id_fk") == null ? "0" : request.getParameter("Credit_bank_id_fk")));

		// String
		dto.setIn_date(request.getParameter("In_date") == null ? "" : request.getParameter("In_date"));
		dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));
		dto.setRemark(request.getParameter("Remark") == null ? "" : request.getParameter("Remark"));

		// float
		dto.setCredit_amount(Float.parseFloat(
				request.getParameter("Credit_amount") == null || request.getParameter("Credit_amount") == "" ? "0.00" : request.getParameter("Credit_amount")));

		boolean b = false;
		int i = 0;

		// condition for insert
		if (dto.getId() == 0) {
			i = ser.insertCashCredit(dto, request, config);

			if (i > 0) {
				response.sendRedirect("add_bank_cash_credit.jsp?msg=Yes");
			} else {
				response.sendRedirect("add_bank_cash_credit.jsp?msg=No");
			}
		}
		
		// condition for updating
		else {

			b = ser.updateCashCredit(dto, request, config);

			if (b) {
				response.sendRedirect("manage_bank_cash_credit.jsp?msg=YesUp");
			} else {
				response.sendRedirect("manage_bank_cash_credit.jsp?msg=NoUp");
			}
		}

	}
}
