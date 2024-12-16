package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionDBUtilMaterial;

@WebServlet("/MaterialUpdateServlet")
public class MaterialUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public MaterialUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int material_id = Integer.parseInt(request.getParameter("material_id"));
		String name = request.getParameter("name");
		double quantity = Double.parseDouble(request.getParameter("quantity"));
		String unit = request.getParameter("unit");
		String description = request.getParameter("description");
		String expiryDate = request.getParameter("expiryDate");
		String supplier = request.getParameter("supplier");
		
		boolean isTrue;
		
		isTrue = ConnectionDBUtilMaterial.updateMaterials(material_id, name, quantity, unit, description, expiryDate, supplier);
		
		if (isTrue) {
			RequestDispatcher dis1 = request.getRequestDispatcher("WEB-INF/View/success.jsp");
			dis1.forward(request, response);
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("WEB-INF/View/unsuccess.jsp");
			dis2.forward(request, response);
		}
		
	}

}
