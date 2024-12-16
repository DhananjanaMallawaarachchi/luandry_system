package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class PayDBConnect {
	
	private static String url = "";
	private static String username = "";
	private static String password = "";
	
	private static Connection con;
	
public static Connection getConnection() {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, username, password);
			
		}
		catch(Exception e) {
			System.out.println("Database connection is not success..!");
		}
		
		return con;
	}
	
	
}	
