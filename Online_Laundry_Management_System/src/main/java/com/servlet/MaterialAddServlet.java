package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionDBUtilMaterial;

@WebServlet("/MaterialAddServlet")
public class MaterialAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MaterialAddServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		String name = request.getParameter("name");
		double quantity = Double.parseDouble(request.getParameter("quantity"));
		String unit = request.getParameter("unit");
		String description = request.getParameter("description");
		String expiryDate = request.getParameter("expiryDate");
		String supplier = request.getParameter("supplier");
		
		boolean isTrue;
		
		isTrue = ConnectionDBUtilMaterial.addMaterials(name, quantity, unit, description, expiryDate, supplier);
		
		if (isTrue == true) {
			RequestDispatcher dis1 = request.getRequestDispatcher("WEB-INF/View/success.jsp");
			dis1.forward(request, response);
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("WEB-INF/View/unsuccess.jsp");
			dis2.forward(request, response);
		}
	}

}
