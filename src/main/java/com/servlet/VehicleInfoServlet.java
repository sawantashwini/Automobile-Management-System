package com.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.VehicleInfoDto;
import com.service.VehicleInfoService;

/**
 * Servlet implementation class VehicleInfoServlet
 */
@WebServlet("/VehicleInfoServlet")
public class VehicleInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ServletConfig config;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VehicleInfoServlet() {
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

		VehicleInfoDto dto = new VehicleInfoDto();
		VehicleInfoService ser = new VehicleInfoService();

		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));

		dto.setUser_id_fk(Integer.parseInt(request.getParameter("User_id_fk") == null ? "0" : request.getParameter("User_id_fk")));

		dto.setBike_company_id_fk(Integer.parseInt(
				request.getParameter("Bike_company_id_fk") == null ? "0" : request.getParameter("Bike_company_id_fk")));

		dto.setService_count(Integer
				.parseInt(request.getParameter("Service_count") == null ? "0" : request.getParameter("Service_count")));

		dto.setDone_service_count(Integer.parseInt(
				request.getParameter("Done_service_count") == null ? "0" : request.getParameter("Done_service_count")));

		dto.setColor_id_fk(Integer
				.parseInt(request.getParameter("Color_id_fk") == null ? "0" : request.getParameter("Color_id_fk")));

		/* int end */

		dto.setBase_price(Float
				.parseFloat(request.getParameter("Base_price") == null || request.getParameter("Base_price") == "" ? "0.0" : request.getParameter("Base_price")));

		dto.setPurchase_price(Float.parseFloat(
				request.getParameter("Purchase_price") == null || request.getParameter("Purchase_price") == "" ? "0.0" : request.getParameter("Purchase_price")));

		/* Float end */

		dto.setModel_name(request.getParameter("Model_name") == null ? "" : request.getParameter("Model_name"));

		dto.setChassis_no(request.getParameter("Chassis_no") == null ? "" : request.getParameter("Chassis_no"));

		dto.setEngine_no(request.getParameter("Engine_no") == null ? "" : request.getParameter("Engine_no"));

		dto.setService_book_no(
				request.getParameter("Service_book_no") == null ? "" : request.getParameter("Service_book_no"));

		dto.setController_no(
				request.getParameter("Controller_no") == null ? "" : request.getParameter("Controller_no"));

		dto.setConverter_no(request.getParameter("Converter_no") == null ? "" : request.getParameter("Converter_no"));

		dto.setRemote_no(request.getParameter("Remote_no") == null ? "" : request.getParameter("Remote_no"));

		dto.setBattery1_no(request.getParameter("Battery1_no") == null ? "" : request.getParameter("Battery1_no"));

		dto.setBattery2_no(request.getParameter("Battery2_no") == null ? "" : request.getParameter("Battery2_no"));

		dto.setBattery3_no(request.getParameter("Battery3_no") == null ? "" : request.getParameter("Battery3_no"));

		dto.setBattery4_no(request.getParameter("Battery4_no") == null ? "" : request.getParameter("Battery4_no"));

		dto.setBattery5_no(request.getParameter("Battery5_no") == null ? "" : request.getParameter("Battery5_no"));

		dto.setBattery6_no(request.getParameter("Battery6_no") == null ? "" : request.getParameter("Battery6_no"));

		dto.setPurchase_date(
				request.getParameter("Purchase_date") == null ? "" : request.getParameter("Purchase_date"));

		dto.setInvoice_no(request.getParameter("Invoice_no") == null ? "" : request.getParameter("Invoice_no"));

		dto.setKey_number(request.getParameter("Key_number") == null ? "" : request.getParameter("Key_number"));

		dto.setCharger_number(request.getParameter("Charger_number") == null ? "" : request.getParameter("Charger_number"));

		dto.setVehicle_no(request.getParameter("Vehicle_no") == null ? "" : request.getParameter("Vehicle_no"));

		dto.setStatus(request.getParameter("Status") == null ? "" : request.getParameter("Status"));

		dto.setSold_status(request.getParameter("Sold_status") == null ? "" : request.getParameter("Sold_status"));

		if (dto.getId() == 0) {

			boolean b = ser.insertVehicleInfo(dto, request, config);

			if (b) {

				response.sendRedirect("add_vehicle.jsp?msg=Yes");
			} else {

				response.sendRedirect("add_vehicle.jsp?msg=No");

			}
		}

		else {
			boolean b = ser.updateVehicleInfo(dto, request, config);

			if (b) {

				response.sendRedirect("manage_stock_vehicle.jsp?msg=YesUp");
			} else {

				response.sendRedirect("manage_stock_vehicle.jsp?msg=NoUp");

			}
		}

	}

}
