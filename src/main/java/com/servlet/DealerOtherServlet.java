package com.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.PurchaseOtherDto;
import com.service.DealerOtherService;

/**
 * Servlet implementation class DealerOtherServlet
 */
@WebServlet("/DealerOtherServlet")
public class DealerOtherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletConfig config;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DealerOtherServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
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
		DealerOtherService ser = new DealerOtherService();

		//Integer
		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));
		dto.setUser_id_fk(Integer.parseInt(request.getParameter("User_id_fk") == null ? "0" : request.getParameter("User_id_fk")));
		//String
		dto.setName(request.getParameter("Name") == null ? "" : request.getParameter("Name"));
		dto.setMobile_no(request.getParameter("Mobile_no") == null ? "" : request.getParameter("Mobile_no"));
		dto.setAddress(request.getParameter("Address") == null ? "" : request.getParameter("Address"));
		dto.setGst_no(request.getParameter("Gst_no") == null ? "" : request.getParameter("Gst_no"));
		dto.setIn_date(request.getParameter("In_date") == null ? "" : request.getParameter("In_date"));
		dto.setC_y_session(request.getParameter("C_y_session") == null ? "" : request.getParameter("C_y_session"));
		dto.setType(request.getParameter("Type") == null ? "" : request.getParameter("Type"));
		dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));
		
		//Float
		dto.setOld_due(Float.parseFloat(request.getParameter("Old_due") == null || request.getParameter("Old_due") == "" ? "0.00" : request.getParameter("Old_due")));
		dto.setOpening_due(Float.parseFloat(request.getParameter("Opening_due") == null || request.getParameter("Old_due") == "" ? "0.00" : request.getParameter("Opening_due")));
		
		
		boolean b = false;

		// condition for insert
		if (dto.getId() == 0) {

			b = ser.insertDealerOther(dto, request, config);

			if (b) {
				response.sendRedirect("add_dealer_other.jsp?msg=Yes");
			} else {
				response.sendRedirect("add_dealer_other.jsp?msg=No");
			}
		}
		// condition for updating
		else {

			if (dto.getType().equals("Opening Due")) {

				b = ser.updateOpeningDue(dto, request, config);

			} else {

				b = ser.updateDealerOther(dto, request, config);
			}
			if (b) {
				response.sendRedirect("manage_dealer_other.jsp?msg=YesUp");
			} else {
				response.sendRedirect("manage_dealer_other.jsp?msg=NoUp");
			}
		}

	}

}
