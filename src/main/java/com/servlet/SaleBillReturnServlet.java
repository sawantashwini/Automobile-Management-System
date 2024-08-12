package com.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.PaymentDto;
import com.dto.SaleBillDto;
import com.service.SaleBillReturnService;

/**
 * Servlet implementation class SellBillServlet
 */
@WebServlet("/SaleBillReturnServlet")
public class SaleBillReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletConfig config;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaleBillReturnServlet() {
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

		SaleBillDto dto = new SaleBillDto();
		SaleBillReturnService ser = new SaleBillReturnService();

		// Integer
		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));

		dto.setBank_id_fk(Integer
				.parseInt(request.getParameter("Bank_id_fk") == null ? "0" : request.getParameter("Bank_id_fk")));

		dto.setUser_id_fk(Integer
				.parseInt(request.getParameter("User_id_fk") == null ? "0" : request.getParameter("User_id_fk")));

		

		// String
		dto.setInvoice_no(request.getParameter("Invoice_no") == null ? "" : request.getParameter("Invoice_no"));

		dto.setBill_date(request.getParameter("Bill_date") == null ? "" : request.getParameter("Bill_date"));

		dto.setC_y_session(request.getParameter("C_y_session") == null ? "" : request.getParameter("C_y_session"));

		dto.setGst_status(request.getParameter("Gst_status") == null ? "No" : request.getParameter("Gst_status"));

		dto.setIgst_status(request.getParameter("Igst_status") == null ? "No" : request.getParameter("Igst_status"));

		dto.setCurrent_in_date(
				request.getParameter("Current_in_date") == null ? "" : request.getParameter("Current_in_date"));

		dto.setRemark(request.getParameter("Remark") == null ? "" : request.getParameter("Remark"));

		dto.setPayment_mode(request.getParameter("Payment_mode") == null ? "" : request.getParameter("Payment_mode"));

		dto.setOnline_way(request.getParameter("Online_way") == null ? "" : request.getParameter("Online_way"));

		dto.setOnline_remark(
				request.getParameter("Online_remark") == null ? "N/A" : request.getParameter("Online_remark"));

		dto.setOnline_date(request.getParameter("Online_date") == null ? "" : request.getParameter("Online_date"));

		dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));
		// Float
		dto.setTotal_basic_amt(Float.parseFloat(
				request.getParameter("Total_basic_amt") == null ? "0.0" : request.getParameter("Total_basic_amt")));

		dto.setDiscount_per(Float.parseFloat(
				request.getParameter("Discount_per") == null ? "0.0" : request.getParameter("Discount_per")));

		dto.setPaid_amount(Float
				.parseFloat(request.getParameter("Paid_amount") == null ? "0.0" : request.getParameter("Paid_amount")));

		dto.setCash_amount(Float
				.parseFloat(request.getParameter("Cash_amount") == null || request.getParameter("Cash_amount") == "" ? "0.0" : request.getParameter("Cash_amount")));


		dto.setOnline_amount(Float.parseFloat(
				request.getParameter("Online_amount") == null || request.getParameter("Online_amount") == "" ? "0.0"
						: request.getParameter("Online_amount")));

		dto.setTotal_gst_amt(Float.parseFloat(
				request.getParameter("Total_gst_amt") == null ? "0.0" : request.getParameter("Total_gst_amt")));

		dto.setTotal_amt_with_gst(Float.parseFloat(request.getParameter("Total_amt_with_gst") == null ? "0.0"
				: request.getParameter("Total_amt_with_gst")));

		dto.setDiscount_amount(Float.parseFloat(
				request.getParameter("Discount_amount") == null ? "0.0" : request.getParameter("Discount_amount")));

		dto.setFinal_amount(Float.parseFloat(
				request.getParameter("Final_amount") == null ? "0.0" : request.getParameter("Final_amount")));

		dto.setTaxable_value_0(Float.parseFloat(
				request.getParameter("Taxable_value_0") == null ? "0.0" : request.getParameter("Taxable_value_0")));
		dto.setGst_amount_5(Float.parseFloat(
				request.getParameter("Gst_amount_5") == null ? "0.0" : request.getParameter("Gst_amount_5")));

		dto.setTaxable_value_5(Float.parseFloat(
				request.getParameter("Taxable_value_5") == null ? "0.0" : request.getParameter("Taxable_value_5")));

		dto.setGst_amount_12(Float.parseFloat(
				request.getParameter("Gst_amount_12") == null ? "0.0" : request.getParameter("Gst_amount_12")));

		dto.setTaxable_value_12(Float.parseFloat(
				request.getParameter("Taxable_value_12") == null ? "0.0" : request.getParameter("Taxable_value_12")));

		dto.setGst_amount_18(Float.parseFloat(
				request.getParameter("Gst_amount_18") == null ? "0.0" : request.getParameter("Gst_amount_18")));
		dto.setTaxable_value_18(Float.parseFloat(
				request.getParameter("Taxable_value_18") == null ? "0.0" : request.getParameter("Taxable_value_18")));

		dto.setGst_amount_28(Float.parseFloat(
				request.getParameter("Gst_amount_28") == null ? "0.0" : request.getParameter("Gst_amount_28")));

		dto.setTaxable_value_28(Float.parseFloat(
				request.getParameter("Taxable_value_28") == null ? "0.0" : request.getParameter("Taxable_value_28")));

		// customer details

		dto.setCustomer_id_fk(Integer.parseInt(
				request.getParameter("Customer_id_fk") == null ? "0" : request.getParameter("Customer_id_fk")));

		dto.setCust_name(request.getParameter("Name") == null ? "" : request.getParameter("Name"));

		dto.setCust_mobile_no(request.getParameter("Mobile_no") == null ? "" : request.getParameter("Mobile_no"));

		dto.setCust_address(request.getParameter("Address") == null ? "" : request.getParameter("Address"));

		dto.setCust_gst_no(request.getParameter("Gst_no") == null ? "" : request.getParameter("Gst_no"));

		dto.setRegular(request.getParameter("Regular") == null ? "" : request.getParameter("Regular"));

		// ************PAYMENT DTO VALUES***********
		PaymentDto pay_dto = new PaymentDto();

		// Integer
		pay_dto.setBill_id_fk(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));
		pay_dto.setBank_id_fk(Integer
				.parseInt(request.getParameter("Bank_id_fk") == null ? "0" : request.getParameter("Bank_id_fk")));
		// Float
		pay_dto.setOnline_amount(Float.parseFloat(
				request.getParameter("Online_amount") == null || request.getParameter("Online_amount") == "" ? "0.0" : request.getParameter("Online_amount")));
		pay_dto.setCash_amount(Float
				.parseFloat(request.getParameter("Cash_amount") == null || request.getParameter("Cash_amount") == "" ? "0.0" : request.getParameter("Cash_amount")));
		// String
		pay_dto.setRemark(request.getParameter("Remark") == null ? "0" : request.getParameter("Remark"));
		pay_dto.setOnline_remark(
				request.getParameter("Online_remark") == null ? "0" : request.getParameter("Online_remark"));
		pay_dto.setOnline_date(request.getParameter("Online_date") == null ? "" : request.getParameter("Online_date"));
		pay_dto.setOnline_way(request.getParameter("Online_way") == null ? "" : request.getParameter("Online_way"));
		pay_dto.setIn_date(request.getParameter("Bill_date") == null ? "" : request.getParameter("Bill_date"));
		pay_dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));
		pay_dto.setType("Sell Return");

		// ************Bill Item Dto Values***********
		String Sell_base_price[] = request.getParameterValues("Sell_base_price");
		String Item_id[] = request.getParameterValues("Item_id");
		String Cat_id[] = request.getParameterValues("Cat_id");
		String Measure_id[] = request.getParameterValues("Measure_id");
		String Cat_name[] = request.getParameterValues("Cat_name");
		String Measure_name[] = request.getParameterValues("Measure_name");
		String Hsn_code[] = request.getParameterValues("Hsn_code");
		String Gst_per[] = request.getParameterValues("Gst_per");
		String Item_name[] = request.getParameterValues("Item_name");
		String Item_code[] = request.getParameterValues("Item_code");
		String Qty[] = request.getParameterValues("Qty");
		String Tot_amt[] = request.getParameterValues("Tot_amt");
		String Dis_per[] = request.getParameterValues("Dis_per");
		String Dis_amt[] = request.getParameterValues("Dis_amt");
		String Discount_sell_gst_price[] = request.getParameterValues("Discount_sell_gst_price");
		String Sell_item_status[] = request.getParameterValues("Sell_item_status");

		int id = 0;

		// condition for insert

		if (dto.getId() == 0) {

			id = ser.insertSaleBillReturnInfo(pay_dto, dto, request, config);

			boolean b = ser.insertSaleBillItemReturn(Sell_base_price, Item_id, Cat_id, Measure_id, Cat_name, Measure_name,
					Hsn_code, Gst_per, Item_name, Item_code, Qty, Tot_amt, Dis_per, Dis_amt, Discount_sell_gst_price,
					Sell_item_status, dto, id, request, config);
			if (b) {

				response.sendRedirect("sell_bill_return.jsp?msg=Yes");

			} else {

				response.sendRedirect("sell_bill_return.jsp?msg=No");
			}
		}

		// condition for updating

		else {
			// System.out.println(dto.getId());
			boolean b = ser.updateSaleBillReturnInfoById(dto, pay_dto, request, config);

			if (b == true) {

				response.sendRedirect("manage_sell_bill_return.jsp?msg=YesUp");
			} else {

				response.sendRedirect("manage_sell_bill_retun.jsp?msg=NoUp");

			}

		}

	}

}
