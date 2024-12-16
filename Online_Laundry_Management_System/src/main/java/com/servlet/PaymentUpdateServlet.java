package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.PaymentDBUtil;

@WebServlet("/PaymentUpdate")
public class PaymentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public PaymentUpdateServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
		int PaymentID = Integer.parseInt("PaymetnID");
		String Fname = request.getParameter("Fname");
    	String ServiceCategory = request.getParameter("ServiceCategory");
    	double Amount = Double.parseDouble(request.getParameter("Amount"));
    	String Number = request.getParameter("Number");
    	String PaymentMethod = request.getParameter("PaymetMethod");
    	double Pendingamount = Double.parseDouble(request.getParameter("Pendingamount"));
    	
    	boolean istrue;

    	istrue = PaymentDBUtil.UpdatePayment(PaymentID, Fname, ServiceCategory, Amount, Number, PaymentMethod, Pendingamount);
    	
    	if (istrue == true) {
			RequestDispatcher dis1 = request.getRequestDispatcher("PaymentList.jsp");
			dis1.forward(request, response);
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("PaymentList.jsp");
			dis2.forward(request, response);
		}
	}

}
