package com.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.model.Order;

import com.model.User;
import com.service.OrderImplementation;
import com.util.CommonConstantsOrder;
import com.util.CommonUtilOrder;
import com.util.DBConnectionUtilOrder;
import com.util.QueryUtilOrder;


public class OrderImplementation implements OrderInterface {

	
	public static final Logger log = Logger.getLogger(OrderImplementation.class.getName());

	private static Connection connection;

	private static Statement statement;

	static {
		
		createServiceBookingTable();
	}

	private PreparedStatement preparedStatement;

	
	public static void createServiceBookingTable() {

		try {
			connection = DBConnectionUtilOrder.getDBConnection();
			statement = connection.createStatement();
			
			statement.executeUpdate(QueryUtilOrder.queryByID(CommonConstantsOrder.QUERY_ID_DROP_TABLE));
			
			statement.executeUpdate(QueryUtilOrder.queryByID(CommonConstantsOrder.QUERY_ID_CREATE_TABLE));

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
	}

	
	@Override
	public void addOrder(Order order) {
		String orderId = CommonUtilOrder.generateIDs(getOrderId());
		
		try {
			connection = DBConnectionUtilOrder.getDBConnection();
			
			preparedStatement = connection.prepareStatement(QueryUtilOrder.queryByID(CommonConstantsOrder.QUERY_ID_INSERT_ORDERS));
			
			connection.setAutoCommit(false);
			
			order.setOrderId(orderId);
			preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_ONE, order.getOrderId());
			preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_TWO, order.getServices());
			preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_THREE, order.getStainRemoval());
			preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_FOUR, order.getClothesCollection());
			preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_FIVE, order.getCollectionDropOffTime());
			preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_SIX, order.getDeliveryMethod());
			preparedStatement.setInt(CommonConstantsOrder.COLUMN_INDEX_SEVEN, order.getDeliveryDuration());
			preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_EIGHT, order.getDeliveryAddress());
			preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_NINE, order.getPaymentMethod());
			preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_TEN, order.getAdditionalRequirements());
			
			preparedStatement.execute();
			connection.commit();
			
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();					
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
	}

	@Override
	public Order getOrderById(String orderId) {

		return actionOnOrder(orderId).get(0);
	}
	
	@Override
	public ArrayList<Order> getOrders() {
		
		return actionOnOrder(null);
	}

	@Override
	public void removeOrder(String orderId) {
		if (orderId != null && !orderId.isEmpty()){
			try {
				connection = DBConnectionUtilOrder.getDBConnection();
				preparedStatement = connection.prepareStatement(QueryUtilOrder.queryByID(CommonConstantsOrder.QUERY_ID_REMOVE_ORDER));
				preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_ONE, orderId);
				preparedStatement.executeUpdate();
			} catch (SQLException | SAXException | IOException | ParserConfigurationException| ClassNotFoundException e) {
				log.log(Level.SEVERE, e.getMessage());
			}finally {
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					log.log(Level.SEVERE, e.getMessage());
				}
			}
		}
		
	}

	
	
	private ArrayList<Order> actionOnOrder(String orderId){
		ArrayList<Order> orderList = new ArrayList<Order>();
		try {
			connection = DBConnectionUtilOrder.getDBConnection();
			if (orderId != null && !orderId.isEmpty()) {
				preparedStatement = connection.prepareStatement(QueryUtilOrder.queryByID(CommonConstantsOrder.QUERY_ID_GET_ORDER));
				preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_ONE, orderId);
			}else {
				preparedStatement = connection.prepareStatement(QueryUtilOrder.queryByID(CommonConstantsOrder.QUERY_ID_ALL_ORDERS));
			}
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				Order order = new Order();
				order.setOrderId(resultSet.getString(CommonConstantsOrder.COLUMN_INDEX_ONE));
				order.setServices(resultSet.getString(CommonConstantsOrder.COLUMN_INDEX_TWO));
				order.setStainRemoval(resultSet.getString(CommonConstantsOrder.COLUMN_INDEX_THREE));
				order.setClothesCollection(resultSet.getString(CommonConstantsOrder.COLUMN_INDEX_FOUR));
				order.setCollectionDropOffTime(resultSet.getString(CommonConstantsOrder.COLUMN_INDEX_FIVE));
				order.setDeliveryMethod(resultSet.getString(CommonConstantsOrder.COLUMN_INDEX_SIX));
				order.setDeliveryDuration(resultSet.getInt(CommonConstantsOrder.COLUMN_INDEX_SEVEN));
				order.setDeliveryAddress(resultSet.getString(CommonConstantsOrder.COLUMN_INDEX_EIGHT));
				order.setPaymentMethod(resultSet.getString(CommonConstantsOrder.COLUMN_INDEX_NINE));
				order.setAdditionalRequirements(resultSet.getString(CommonConstantsOrder.COLUMN_INDEX_TEN));
				orderList.add(order);
			}
		}catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		return orderList;
	}

	
	@Override
	public Order updateOrder(String orderId, Order order) {
	    if (orderId != null && !orderId.isEmpty()) {
	        try {
	            // Get database connection
	            connection = DBConnectionUtilOrder.getDBConnection();
	            
	            // Prepare the SQL query for updating the order
	            preparedStatement = connection.prepareStatement(QueryUtilOrder.queryByID(CommonConstantsOrder.QUERY_ID_UPDATE_ORDER));
	            //connection.setAutoCommit(false);
	            // Set parameters for the PreparedStatement
	            preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_ONE, order.getServices());
	            preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_TWO, order.getStainRemoval());
	            preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_THREE, order.getClothesCollection());
	            preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_FOUR, order.getCollectionDropOffTime());
	            preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_FIVE, order.getDeliveryMethod());
	            preparedStatement.setInt(CommonConstantsOrder.COLUMN_INDEX_SIX, order.getDeliveryDuration());
	            preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_SEVEN, order.getDeliveryAddress());
	            preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_EIGHT, order.getPaymentMethod());
	            preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_NINE, order.getAdditionalRequirements());
	            
	            // Set the 'WHERE' clause parameter (orderId)
	            preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_TEN, orderId);

	            // Execute the update
	            preparedStatement.execute();
				//connection.commit();

	            // Optionally, log the successful update
	            log.log(Level.INFO, "Order with ID: " + orderId + " successfully updated.");

	        } catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
	            log.log(Level.SEVERE, "Error updating order with ID: " + orderId, e);
	        } finally {
	            // Close resources
	            try {
	                if (preparedStatement != null) {
	                    preparedStatement.close();
	                }
	                if (connection != null) {
	                    connection.close();
	                }
	            } catch (SQLException e) {
	                log.log(Level.SEVERE, "Error closing resources after updating order with ID: " + orderId, e);
	            }
	        }
	    } else {
	        log.log(Level.WARNING, "Order ID is null or empty.");
	    }
	    return getOrderById(orderId);  // Return the updated order, or null if update fails
	}
	
	private ArrayList<String> getOrderId() {

		ArrayList<String> arrayList = new ArrayList<String>();
		
		try {
			connection = DBConnectionUtilOrder.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtilOrder.queryByID(CommonConstantsOrder.QUERY_ID_GET_ORDER_IDS));
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				arrayList.add(resultSet.getString(CommonConstantsOrder.COLUMN_INDEX_ONE));
			}
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		return arrayList;
	}
	public static void main(String[] args) {
        OrderImplementation orderService = new OrderImplementation();
        Boolean isValidated = orderService.loginUser("username", "password");
        System.out.println(isValidated);
    }
	public boolean loginUser(String username, String password){
		try {
			if (username != null || password != null) {
				
				connection = DBConnectionUtilOrder.getDBConnection();	
				preparedStatement = connection
						.prepareStatement(QueryUtilOrder.queryByID(CommonConstantsOrder.QUERY_ID_GET_USER_UNAME));
				preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_ONE, username);
				ResultSet result = preparedStatement.executeQuery();

				
				com.model.User user = new User();
				while (result.next()) {
					user.setUserName(result.getString(CommonConstantsOrder.COLUMN_INDEX_TWO));
					user.setPassword(result.getString(CommonConstantsOrder.COLUMN_INDEX_SIX));
				}
				if (user.getPassword().equals(password)) {
					return true;
				} else {
					return false;
				}
			} else {
				return false;
			}
		}
		catch (Exception e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		finally{
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}
		return false;
	}
	
//	@Override
//	 public boolean approveOrder(String orderId) {
//		 if (orderId != null && !orderId.isEmpty()){
//				try {
//					connection = DBConnectionUtilOrder.getDBConnection();
//					preparedStatement = connection.prepareStatement(QueryUtilOrder.queryByID(CommonConstantsOrder.QUERY_APPROVE_ORDER));
//					preparedStatement.setString(CommonConstantsOrder.COLUMN_INDEX_ONE, orderId);
//					int rowsAffected = preparedStatement.executeUpdate();
//		            return rowsAffected > 0;
//		   
//				} catch (SQLException | SAXException | IOException | ParserConfigurationException| ClassNotFoundException e) {
//					log.log(Level.SEVERE, e.getMessage());
//					return false;
//				}
//			}
//		return false;
//		}
}		
	    

