package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.OrderImplementation;
import com.service.OrderInterface;

@WebServlet("/DeleteOrder")
public class DeleteOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		String orderId = request.getParameter("orderId");

		OrderInterface orderInterface = new OrderImplementation();
		orderInterface.removeOrder(orderId);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/View/OrderList.jsp");
		dispatcher.forward(request, response);
	}

}
