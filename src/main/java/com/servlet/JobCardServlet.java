package com.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.JobCardDto;
import com.service.JobCardService;

/**
 * Servlet implementation class JobCardServlet
 */
@WebServlet("/JobCardServlet")
public class JobCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ServletConfig config;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobCardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		JobCardDto dto = new JobCardDto();
		JobCardService ser = new JobCardService();

		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));

		dto.setUser_id_fk(Integer.parseInt(request.getParameter("User_id_fk") == null ? "0" : request.getParameter("User_id_fk")));

		
		dto.setVehicle_id_fk(Integer.parseInt(request.getParameter("Vehicle_id_fk") == null ? "0" : request.getParameter("Vehicle_id_fk")));
		dto.setModel_name(request.getParameter("Model_name") == null ? "" : request.getParameter("Model_name"));

		dto.setChassis_no(request.getParameter("Chassis_no") == null ? "" : request.getParameter("Chassis_no"));

		dto.setEngine_no(request.getParameter("Engine_no") == null ? "" : request.getParameter("Engine_no"));

		dto.setIn_date(
				request.getParameter("In_date") == null ? "" : request.getParameter("In_date"));

		dto.setOut_date(
				request.getParameter("Out_date") == null ? "" : request.getParameter("Out_date"));

		dto.setType(
				request.getParameter("Type") == null ? "" : request.getParameter("Type"));
		
		dto.setWorking(request.getParameter("Working") == null ? "" : request.getParameter("Working"));

		dto.setCustomer_name(request.getParameter("Customer_name") == null ? "" : request.getParameter("Customer_name"));

		dto.setCustomer_mobile_no(request.getParameter("Customer_mobile_no") == null ? "" : request.getParameter("Customer_mobile_no"));

		dto.setCustomer_address(request.getParameter("Customer_address") == null ? "" : request.getParameter("Customer_address"));
		dto.setJob_card_no(request.getParameter("Job_card_no") == null ? "" : request.getParameter("Job_card_no"));
		dto.setSales_person_name(request.getParameter("Sales_person_name") == null ? "" : request.getParameter("Sales_person_name"));

		dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));

		dto.setRemark(request.getParameter("Remark") == null ? "" : request.getParameter("Remark"));

		

		if (dto.getId() == 0) {

			int id = ser.insertJobCardInfo(dto, request, config);

			if (id>0) {

				response.sendRedirect("print_job_card_reciept.jsp?id="+id);
			} else {

				response.sendRedirect("add_job_card.jsp?msg=No");

			}
		}

		else {
			boolean b = ser.updateJobCard(dto, request, config);

			if (b) {

				response.sendRedirect("print_job_card_reciept.jsp?id="+dto.getId());
			} else {

				response.sendRedirect("manage_job_card.jsp?msg=NoUp");

			}
		}
	}

}
