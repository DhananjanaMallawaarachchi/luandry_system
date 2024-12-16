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


@WebServlet("/AddOrder")
public class AddOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AddOrderServlet() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");

		Order order = new Order();

		order.setServices(request.getParameter("service"));
		order.setStainRemoval(request.getParameter("stain_removal"));
		order.setClothesCollection(request.getParameter("collection"));
		order.setCollectionDropOffTime(request.getParameter("collection_time"));
		order.setDeliveryMethod(request.getParameter("delivery"));
		order.setDeliveryDuration(Integer.parseInt(request.getParameter("delivery_time")));
		order.setDeliveryAddress(request.getParameter("address"));
		order.setPaymentMethod(request.getParameter("payment"));
		order.setAdditionalRequirements(request.getParameter("requirements"));
		
		OrderInterface orderInterface = new OrderImplementation();
		orderInterface.addOrder(order);

		request.setAttribute("order", order);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/View/OrderList.jsp");
		dispatcher.forward(request, response);
	}

}
