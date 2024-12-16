package com.laundryservice.model;

import java.util.Date;

public class Order {
    private int id;
    private String customerName;
    private String orderAddress;
    private String status;
    private Date orderDate;

    // Getters and setters
    public int getId() { 
    	return id; 
    }
    public void setId(int id) { 
    	this.id = id; 
    }
    public String getCustomerName() { 
    	return customerName; 
    }
    public void setCustomerName(String customerName) { 
    	this.customerName = customerName; 
    }
    public String getOrderAddress() { 
    	return orderAddress; 
    }
    public void setOrderAddress(String orderAddress) { 
    	this.orderAddress = orderAddress; 
    }
    public String getStatus() { 
    	return status; 
    }
    public void setStatus(String status) { 
    	this.status = status; 
    }
    public Date getOrderDate() { 
    	return orderDate; 
    }
    public void setOrderDate(Date orderDate) {
    	this.orderDate = orderDate; 
    }
}
