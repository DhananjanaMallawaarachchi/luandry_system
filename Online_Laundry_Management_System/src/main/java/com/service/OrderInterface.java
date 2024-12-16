package com.service;

import com.model.Order;
import java.util.ArrayList;
import java.util.logging.Logger;

public interface OrderInterface {
	public static final Logger log = Logger.getLogger(OrderInterface.class.getName());

	public void addOrder(Order order);
	
	public Order getOrderById(String orderId);
		
	public void removeOrder(String orderId);
	
	public Order updateOrder(String orderId, Order order);
	
	public ArrayList<Order> getOrders();
	
	public boolean loginUser(String username, String password);
	
//	public boolean approveOrder(String orderId);
//	
//	public boolean rejectOrder(String orderId);

	
}
