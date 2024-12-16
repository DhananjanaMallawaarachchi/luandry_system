package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Order;
import com.service.OrderImplementation;
import com.service.OrderInterface;

@WebServlet("/GetOrder")
public class GetOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public GetOrderServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		String orderId = request.getParameter("orderId");
		OrderInterface orderInterface = new OrderImplementation();
		Order order = orderInterface.getOrderById(orderId);

		request.setAttribute("order", order);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/View/GetOrder.jsp");
		dispatcher.forward(request, response);
	}

}
