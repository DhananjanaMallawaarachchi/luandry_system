package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.OrderImplementation;
import com.service.OrderInterface;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

  
    private static final long serialVersionUID = 1L;

    
    public LoginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	response.setContentType("text/html");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        OrderInterface orderInterface = new OrderImplementation();

        if (orderInterface.loginUser(username, password)){
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("password", password);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Index.jsp");
            dispatcher.forward(request, response);
        }else{
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
            response.getWriter().append("Invalid username or password");
            dispatcher.forward(request, response);
        }

        
    }
    
}
