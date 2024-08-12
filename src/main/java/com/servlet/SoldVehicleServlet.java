package com.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dto.VehicleInfoDto;
import com.service.VehicleInfoService;

/**
 * Servlet implementation class SliderServlet
 */
@WebServlet("/SoldVehicleServlet")
public class SoldVehicleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ServletConfig config;
	String Name = "";
	String path = "";

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;

		path = config.getServletContext().getRealPath("/");
		System.out.println(path);
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SoldVehicleServlet() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		VehicleInfoDto dto = new VehicleInfoDto();
		VehicleInfoService ser = new VehicleInfoService();

		File savesFile = null;
		FileItem item = null;

		if (ServletFileUpload.isMultipartContent(request)) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> items = null;
			try {

				items = upload.parseRequest(request);

			} catch (Exception e) {
			}

			Iterator<FileItem> itr = items.iterator();

			while (itr.hasNext()) {
				item = itr.next();

				if (item.isFormField()) {

					String name = item.getFieldName();
					/*
					 *  = ?,
					 *  = ?
					 * 
					 */

					if (name.equals("Id"))
						dto.setId(Integer.parseInt(item.getString() == null ? "0" : item.getString().trim()));

					if (name.equals("City_id_fk"))
						dto.setCity_id_fk(Integer.parseInt(item.getString() == null ? "0" : item.getString().trim()));

					if (name.equals("Sold_status"))
						dto.setSold_status(item.getString() == null ? "" : item.getString().trim());
					
					if (name.equals("Customer_name"))
						dto.setCustomer_name(item.getString() == null ? "" : item.getString().trim());
					
					if (name.equals("Customer_mobile_no"))
						dto.setCustomer_mobile_no(item.getString() == null ? "" : item.getString().trim());
					
					if (name.equals("Customer_address"))
						dto.setCustomer_address(item.getString() == null ? "" : item.getString().trim());

					if (name.equals("Sold_date"))
						dto.setSold_date(item.getString() == null ? "" : item.getString().trim());

					if (name.equals("Id_proof_status"))
						dto.setId_proof_status(item.getString() == null ? "" : item.getString().trim());
					
					if (name.equals("Photo_status"))
						dto.setPhoto_status(item.getString() == null ? "" : item.getString().trim());

					if (name.equals("Sale_price"))
						dto.setSale_price(Float.parseFloat(item.getString() == null || item.getString() == "" ? "0.0" : item.getString().trim()));

					if (name.equals("Due_sale_price"))
						dto.setDue_sale_price(Float.parseFloat(item.getString() == null || item.getString() == "" ? "0.0" : item.getString().trim()));

					if (name.equals("Finance_amount"))
						dto.setFinance_amount(Float.parseFloat(item.getString() == null || item.getString() == "" ? "0.0" : item.getString().trim()));

					
					
					
				} else {

					if (item.getSize() != 0) {
						if (item.getSize() < 3000000) {
							if (dto.getId() == 0) {

								int j = ser.maxId(request);
								savesFile = new File(path + "VehicleCustomerImage/" + j + ".jpg");

								try {
									item.write(savesFile);

									System.out.println(savesFile);
								} catch (Exception e2) {
								}

							} else {

								savesFile = new File(path + "VehicleCustomerImage/" + dto.getId() + ".jpg");
								try {
									item.write(savesFile);

								} catch (Exception e2) {
								}
							}

						}

					}

				}
			}
		}

		if (dto.getId() == 0) {

			/*
			 * boolean b = ser.insertSlider(dto, request, config);
			 * 
			 * if (b) {
			 * 
			 * response.sendRedirect("add_slider.jsp?msg=Done successfull"); } else {
			 * 
			 * response.sendRedirect("add_slider.jsp?msg=NotDone");
			 * 
			 * }
			 */
		}

		else {
			boolean b = ser.SoldVehicle(dto, request, config);

			if (b) {

				response.sendRedirect("manage_sold_vehicle.jsp?msg=YesUp");
			} else {

				response.sendRedirect("manage_vehicle.jsp?msg=NoUp");

			}
		}

	}

}
