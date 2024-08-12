package com.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dto.ServiceBillDto;
import com.dto.PaymentDto;
import com.service.ServiceDueService;

/**
 * Servlet implementation class ServiceDueServlet
 */
@WebServlet("/ServiceDueServlet")
public class ServiceDueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletConfig config;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServiceDueServlet() {
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
		ServiceBillDto dto = new ServiceBillDto();
		PaymentDto pay_dto = new PaymentDto();

		ServiceDueService ser = new ServiceDueService();

		// Integer
		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));

		dto.setBank_id_fk(Integer
				.parseInt(request.getParameter("Bank_id_fk") == null ? "0" : request.getParameter("Bank_id_fk")));

		dto.setService_id_fk(Integer
				.parseInt(request.getParameter("Service_id_fk") == null ? "0" : request.getParameter("Service_id_fk")));

		dto.setUser_id_fk(Integer
				.parseInt(request.getParameter("User_id_fk") == null ? "0" : request.getParameter("User_id_fk")));

		// Float
		dto.setPaid_amount(Float.parseFloat(
				request.getParameter("Paid_amount") == null || request.getParameter("Paid_amount") == "" ? "0"
						: request.getParameter("Paid_amount")));

		dto.setCash_amount(Float.parseFloat(
				request.getParameter("Cash_amount") == null || request.getParameter("Cash_amount") == "" ? "0"
						: request.getParameter("Cash_amount")));

		dto.setOnline_amount(Float.parseFloat(
				request.getParameter("Online_amount") == null || request.getParameter("Online_amount") == "" ? "0"
						: request.getParameter("Online_amount")));

		// String

		dto.setPay_date(request.getParameter("Pay_date") == null ? "" : request.getParameter("Pay_date"));

		dto.setC_y_session(request.getParameter("C_y_session") == null ? "" : request.getParameter("C_y_session"));

		dto.setRemark(request.getParameter("Remark") == null ? "0" : request.getParameter("Remark"));

		dto.setPayment_mode(request.getParameter("Payment_mode") == null ? "0" : request.getParameter("Payment_mode"));

		dto.setOnline_way(request.getParameter("Online_way") == null ? "0" : request.getParameter("Online_way"));

		dto.setOnline_remark(
				request.getParameter("Online_remark") == null ? "0" : request.getParameter("Online_remark"));

		dto.setOnline_date(request.getParameter("Online_date") == null ? "0" : request.getParameter("Online_date"));

		dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));

		dto.setUpcoming_remark(
				request.getParameter("Upcoming_remark") == null ? "N/A" : request.getParameter("Upcoming_remark"));

		dto.setUpcoming_date(
				request.getParameter("Upcoming_date") == null ? "" : request.getParameter("Upcoming_date"));

		// ************PAYMENT DTO VALUES***********
		// Integer

		pay_dto.setBill_id_fk(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));
		pay_dto.setBank_id_fk(Integer
				.parseInt(request.getParameter("Bank_id_fk") == null ? "0" : request.getParameter("Bank_id_fk")));
		// Float
		pay_dto.setOnline_amount(Float.parseFloat(
				request.getParameter("Online_amount") == null ? "0" : request.getParameter("Online_amount")));
		pay_dto.setCash_amount(Float
				.parseFloat(request.getParameter("Cash_amount") == null ? "0" : request.getParameter("Cash_amount")));
		// String
		String remark = request.getParameter("Remark") == null ? "0" : request.getParameter("Remark");

		pay_dto.setOnline_remark(
				request.getParameter("Online_remark") == null ? "0" : request.getParameter("Online_remark"));
		pay_dto.setOnline_date(request.getParameter("Online_date") == null ? "" : request.getParameter("Online_date"));
		pay_dto.setOnline_way(request.getParameter("Online_way") == null ? "" : request.getParameter("Online_way"));
		pay_dto.setIn_date(request.getParameter("Pay_date") == null ? "" : request.getParameter("Pay_date"));
		pay_dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));
		pay_dto.setType("Service Due");

		int b = 0;

		boolean c = false;

		// condition for insert
		if (dto.getId() == 0) {

			b = ser.insertServiceDue(dto, pay_dto, request, config);

			if (b > 0) {
				response.sendRedirect("print_service_due_receipt.jsp?id=" + b);
			} else {

				response.sendRedirect("pay_service_due.jsp?msg=NoUp");

			}
		}

		else {

			b = dto.getService_id_fk();

			c = ser.updateServiceDue(dto, pay_dto, request, config);

			if (c) {
				response.sendRedirect("print_service_due_receipt.jsp?msg=YesUp&id=" + dto.getId());
			} else {
				response.sendRedirect("manage_service_due.jsp?msg=NoUp&id=" + b);
			}
		}
	}

}