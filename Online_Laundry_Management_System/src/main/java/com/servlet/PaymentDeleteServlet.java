package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.PaymentDBUtil;

@WebServlet("/PaymentDeleteServlet")
public class PaymentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public PaymentDeleteServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
		String PaymentID = request.getParameter("PaymentID");
		
		boolean isTrue;
		
		isTrue = PaymentDBUtil.deletePayment(PaymentID);
		
		if (isTrue == true) {
			RequestDispatcher dis1 = request.getRequestDispatcher("PaymentList.jsp");
			dis1.forward(request, response);
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("PaymentList.jsp");
			dis2.forward(request, response);
		}
	}

}
