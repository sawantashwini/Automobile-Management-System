package com.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.ItemDto;
import com.service.ItemService;

/**
 * Servlet implementation class ItemServlet
 */
@WebServlet("/ItemServlet")
public class ItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletConfig config;
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemServlet() {
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
		ItemDto dto = new ItemDto();
		ItemService ser = new ItemService();
		
		//Integer
		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));
		
		dto.setCat_id_fk(Integer.parseInt(request.getParameter("Cat_id_fk") == null ? "0" : request.getParameter("Cat_id_fk")));
		
		dto.setMeasure_id_fk(Integer.parseInt(request.getParameter("Measure_id_fk") == null ? "0" : request.getParameter("Measure_id_fk")));
		
		dto.setUser_id_fk(Integer.parseInt(request.getParameter("User_id_fk") == null ? "0" : request.getParameter("User_id_fk")));
		
		//String
		dto.setName(request.getParameter("Name") == null ? "" : request.getParameter("Name"));
		
		dto.setStatus(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));
		
		dto.setHsn_code(request.getParameter("Hsn_code") == null ? "" : request.getParameter("Hsn_code"));
		
		dto.setItem_code(request.getParameter("Item_code") == null ? "" : request.getParameter("Item_code"));
		
		dto.setUser_name(request.getParameter("User_name") == null ? "" : request.getParameter("User_name"));
		
		dto.setCategory_name(request.getParameter("Category_name") == null ? "" : request.getParameter("Category_name"));
		
		dto.setMeasure_name(request.getParameter("Measure_name") == null ? "" : request.getParameter("Measure_name"));
		
		//float
		dto.setOpening_qty(Float.parseFloat(request.getParameter("Opening_qty") == null ? "0.00" : request.getParameter("Opening_qty")));

		dto.setQuantity(Float.parseFloat(request.getParameter("Quantity") == null ? "0.00" : request.getParameter("Quantity")));
		
		dto.setPur_price(Float.parseFloat(request.getParameter("Pur_price") == null|| request.getParameter("Pur_price") == "" ? "0.00" : request.getParameter("Pur_price")));
		
		dto.setSale_price(Float.parseFloat(request.getParameter("Sale_price") == null || request.getParameter("Sale_price") == ""? "0.00" : request.getParameter("Sale_price")));
		
		dto.setGst_per(Float.parseFloat(request.getParameter("Gst_per") == null ? "0.00" : request.getParameter("Gst_per")));
		
		dto.setMin_qty(Float.parseFloat(request.getParameter("Min_qty") == null ? "0.00" : request.getParameter("Min_qty")));
		
		boolean b = false;
		
		// condition for insert
		if(dto.getId()==0) {
			
			b = ser.insertItem(dto, request, config);
			
			if(b) {
				response.sendRedirect("add_item.jsp?msg=Yes");
			}
			else {
				response.sendRedirect("add_item.jsp?msg=No");
			}
		}
		//condition for updating
		else {
			
			b = ser.updateItem(dto, request, config);
			
			if(b) {
				response.sendRedirect("manage_stock_item.jsp?msg=YesUp");
			}
			else {
				response.sendRedirect("manage_stock_item.jsp?msg=NoUp");
			}
		}
	}

}
