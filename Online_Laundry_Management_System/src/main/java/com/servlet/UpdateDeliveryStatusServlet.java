package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DeliveryDAO;

@WebServlet("/updateDeliveryStatus")
public class UpdateDeliveryStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private DeliveryDAO deliveryDAO;

    @Override
    public void init() throws ServletException {
        deliveryDAO = new DeliveryDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int deliveryId = Integer.parseInt(request.getParameter("deliveryId"));
        String newStatus = request.getParameter("deliveryStatus");
        

        boolean isUpdated = deliveryDAO.updateDeliveryStatus(deliveryId, newStatus);

        if (isUpdated) {
            response.sendRedirect("manageDeliveries?orderId=" + request.getParameter("orderId") + "&success=status_updated");
        } else {
            response.sendRedirect("manageDeliveries?orderId=" + request.getParameter("orderId") + "&error=update_failed");
        }
    }
}
