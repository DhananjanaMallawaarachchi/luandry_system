package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionUtilOrder extends CommonUtilOrder {
	private static Connection connection;

	
	private DBConnectionUtilOrder() {
	}

	public static Connection getDBConnection() throws ClassNotFoundException, SQLException {
		
		if (connection == null || connection.isClosed()) {

			Class.forName(properties.getProperty(CommonConstantsOrder.DRIVER_NAME));
			connection = DriverManager.getConnection(properties.getProperty(CommonConstantsOrder.URL),
					properties.getProperty(CommonConstantsOrder.USERNAME), properties.getProperty(CommonConstantsOrder.PASSWORD));
		}
		return connection;
	}
}
