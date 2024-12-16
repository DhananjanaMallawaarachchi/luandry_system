package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.OrderImplementation;
import com.service.OrderInterface;

@WebServlet("/ApproveOrder")
public class ApproveOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");
		 
		String orderId = request.getParameter("orderId");

        String action = request.getParameter("action"); // action can be 'approve' or 'reject'
        
        OrderInterface orderInterface = new OrderImplementation();
		
        boolean isSuccessful;
        
        if ("approve".equals(action)) {
            isSuccessful = orderInterface.approveOrder(orderId);;
        } else {
            isSuccessful = orderInterface.rejectOrder(orderId);
        }

        if (isSuccessful) {
            response.getWriter().write("Request " + action + "d successfully!");
        } else {
            response.getWriter().write("Failed to " + action + " the request.");
        }
    }
}


