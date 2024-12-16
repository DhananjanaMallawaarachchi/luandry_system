package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionDBUtilMaterial;

@WebServlet("/MaterialDeleteServlet")
public class MaterialDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("material_id");
		
		boolean isTrue;
		
		isTrue = ConnectionDBUtilMaterial.deleteMaterials(id);
		
		if (isTrue) {
			RequestDispatcher dis1 = request.getRequestDispatcher("WEB-INF/View/success.jsp");
			dis1.forward(request, response);
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("WEB-INF/View/unsuccess.jsp");
			dis2.forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
