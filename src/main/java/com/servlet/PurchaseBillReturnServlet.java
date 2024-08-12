package com.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.PurchaseBillDto;
import com.service.PurchaseBillReturnService;

/**
 * Servlet implementation class PathologyBillServlet
 */
@WebServlet("/PurchaseBillReturnServlet")
public class PurchaseBillReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ServletConfig config;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PurchaseBillReturnServlet() {
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

		PurchaseBillDto dto = new PurchaseBillDto();
		PurchaseBillReturnService ser = new PurchaseBillReturnService();

		// Integer
		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));

		dto.setUser_id_fk(Integer
				.parseInt(request.getParameter("User_id_fk") == null ? "0" : request.getParameter("User_id_fk")));

		dto.setDealer_id_fk(Integer
				.parseInt(request.getParameter("Dealer_id_fk") == null ? "0" : request.getParameter("Dealer_id_fk")));

	

		// String
		dto.setInvoice_no(request.getParameter("Invoice_no") == null ? "" : request.getParameter("Invoice_no"));

		dto.setC_y_session(request.getParameter("C_y_session") == null ? "" : request.getParameter("C_y_session"));

		dto.setBill_date(request.getParameter("Bill_date") == null ? "" : request.getParameter("Bill_date"));

		dto.setIgst_status(request.getParameter("Igst_status") == null ? "No" : request.getParameter("Igst_status"));

		dto.setCurrent_in_date(
				request.getParameter("Current_in_date") == null ? "" : request.getParameter("Current_in_date"));

		dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));

		dto.setRemark(request.getParameter("Remark") == null ? "N/A" : request.getParameter("Remark"));

		// Float
		dto.setTotal_basic_amount(Float.parseFloat(
				request.getParameter("Total_basic_amount") == null ? "0" : request.getParameter("Total_basic_amount")));

		dto.setTotal_gst_amount(Float.parseFloat(
				request.getParameter("Total_gst_amount") == null ? "0" : request.getParameter("Total_gst_amount")));

		dto.setTotal_amount_with_gst(Float.parseFloat(request.getParameter("Total_amount_with_gst") == null ? "0"
				: request.getParameter("Total_amount_with_gst")));

		dto.setTaxable_value_0(Float.parseFloat(
				request.getParameter("Taxable_value_0") == null ? "0" : request.getParameter("Taxable_value_0")));

		dto.setGst_amount_5(Float
				.parseFloat(request.getParameter("Gst_amount_5") == null ? "0" : request.getParameter("Gst_amount_5")));

		dto.setTaxable_value_5(Float.parseFloat(
				request.getParameter("Taxable_value_5") == null ? "0" : request.getParameter("Taxable_value_5")));

		dto.setGst_amount_12(Float.parseFloat(
				request.getParameter("Gst_amount_12") == null ? "0" : request.getParameter("Gst_amount_12")));

		dto.setTaxable_value_12(Float.parseFloat(
				request.getParameter("Taxable_value_12") == null ? "0" : request.getParameter("Taxable_value_12")));

		dto.setGst_amount_18(Float.parseFloat(
				request.getParameter("Gst_amount_18") == null ? "0" : request.getParameter("Gst_amount_18")));

		dto.setTaxable_value_18(Float.parseFloat(
				request.getParameter("Taxable_value_18") == null ? "0" : request.getParameter("Taxable_value_18")));

		dto.setGst_amount_28(Float.parseFloat(
				request.getParameter("Gst_amount_28") == null ? "0" : request.getParameter("Gst_amount_28")));

		dto.setTaxable_value_28(Float.parseFloat(
				request.getParameter("Taxable_value_28") == null ? "0" : request.getParameter("Taxable_value_28")));

		System.out.println("Item_id");

		String Pur_base_price[] = request.getParameterValues("Pur_base_price");
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

		String Pur_discount_price[] = request.getParameterValues("Pur_discount_price");
		String Pur_item_status[] = request.getParameterValues("Pur_item_status");

		int id = 0;

		// condition for insert

		if (dto.getId() == 0) {

			id = ser.insertPurchaseBillReturnInfo(dto, request, config);

			boolean b = ser.insertPurchaseBillReturnItem(Pur_base_price, Item_id, Cat_id, Measure_id, Cat_name, Measure_name,
					Hsn_code, Gst_per, Item_name, Item_code, Qty, Tot_amt, Dis_per, Dis_amt, Pur_discount_price,
					Pur_item_status, dto, id, request, config);
			if (id > 0) {

				response.sendRedirect("manage_purchase_bill_return.jsp?msg=YesUp");

			} else {

				response.sendRedirect("purchase_bill_return.jsp?msg=NoUp");
			}
		}

		// condition for updating

		else {
			boolean b = ser.updatePurchaseBillReturnInfoById(dto, request, config);

			if (b) {

				response.sendRedirect("manage_purchase_bill_return.jsp?msg=YesUp");

			} else {

				response.sendRedirect("purchase_bill_return.jsp?msg=NoUp");

			}

		}

	}
}
