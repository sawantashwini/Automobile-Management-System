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

import com.dto.PurchaseOtherDto;
import com.service.PurchaeOtherService;

/**
 * Servlet implementation class PurchaeOtherServlet
 */
@WebServlet("/PurchaeOtherServlet")
public class PurchaeOtherServlet extends HttpServlet {
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
	public PurchaeOtherServlet() {
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

		PurchaseOtherDto dto = new PurchaseOtherDto();
		PurchaeOtherService ser = new PurchaeOtherService();
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

					// Integer
					if (name.equals("Id"))
						dto.setId(Integer.parseInt(item.getString() == null ? "0" : item.getString().trim()));

					if (name.equals("User_id_fk"))
						dto.setUser_id_fk(Integer.parseInt(item.getString() == null ? "0" : item.getString().trim()));

					if (name.equals("Dealer_id_fk"))
						dto.setDealer_id_fk(Integer.parseInt(item.getString() == null ? "0" : item.getString().trim()));

					// float
					if (name.equals("Old_due"))
						dto.setOld_due(Float.parseFloat(item.getString() == null ? "0.0" : item.getString().trim()));

					if (name.equals("Total_amount"))
						dto.setTotal_amount(
								Float.parseFloat(item.getString() == null ? "0.0" : item.getString().trim()));

					// String
					if (name.equals("Name"))
						dto.setName(item.getString() == null ? "" : item.getString().trim());

					if (name.equals("Remark"))
						dto.setRemark(item.getString() == null ? "" : item.getString().trim());

					if (name.equals("C_y_session"))
						dto.setC_y_session(item.getString() == null ? "" : item.getString().trim());

					if (name.equals("Status"))
						dto.setStatus(item.getString() == null ? "Active" : item.getString().trim());

					if (name.equals("Bill_date"))
						dto.setBill_date(item.getString() == null ? "" : item.getString().trim());
					
					if (name.equals("Flag"))
						dto.setFlag(item.getString() == null ? "" : item.getString().trim());

				} else {

					if (item.getSize() != 0) {
						if (item.getSize() < 3000000) {
							if (dto.getId() == 0) {

								int j = ser.maxId(request);
								savesFile = new File(path + "PurchaseOtherImage/" + j + ".jpg");

								try {
									item.write(savesFile);

									System.out.println(savesFile);
								} catch (Exception e2) {
								}

							} else {

								savesFile = new File(path + "PurchaseOtherImage/" + dto.getId() + ".jpg");
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

		boolean b = false;
		int id = 0;

		// condition for insert
		if (dto.getId() == 0) {

			id = ser.insertPurchaeOther(dto, request, config);

			if (id > 0) {

				response.sendRedirect("add_purchase_other_bill.jsp?msg=Yes");
			} else {
				response.sendRedirect("add_purchase_other_bill.jsp?msg=No");
			}
		}
		// condition for updating
		else {

			b = ser.updatePurchaeOther(dto, request, config);

			if (b) {
				if (dto.getFlag().equals("Bill")) {
					response.sendRedirect("manage_purchase_other_bill.jsp?msg=YesUp&flag=Bill");
				} else if (dto.getFlag().equals("All")) {
					response.sendRedirect(
							"manage_dealer_other_bills.jsp?msg=YesUp&id=" + dto.getDealer_id_fk() + "&flag=All");
				}
			} else {
				response.sendRedirect("manage_purchase_other_bill.jsp?msg=NoUp");
			}
		}

	}
}


