package com.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Material;
import com.mysql.jdbc.PreparedStatement;

public class ConnectionDBUtilMaterial {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean addMaterials(String name, double quantity, String unit, String description, String expiryDate, String supplier){
		
		boolean isSuccess = false;

		try {
			con = DBConnectMaterial.getConnection();
						
			
			String sql = "INSERT INTO Material(name, quantity, unit, description, expiryDate, supplier) VALUES(?, ?, ?, ?, ?, ?)";
			java.sql.PreparedStatement preparedStatement = con.prepareStatement(sql);
			
			preparedStatement.setString(1, name);
			preparedStatement.setDouble(2, quantity);  // Assuming quantity is an integer
			preparedStatement.setString(3, unit);
			preparedStatement.setString(4, description);
			preparedStatement.setString(5, expiryDate);  // Assuming expiryDate is a string in the correct format
			preparedStatement.setString(6, supplier);
			preparedStatement.execute();

			
			isSuccess=true;
			
		}catch(Exception e) {
			e.printStackTrace();
			isSuccess=false;
		}
		
		return isSuccess;
	}
	
	public static boolean updateMaterials(int material_id, String name, double quantity, String unit, String description, String expiryDate, String supplier) {
		
		boolean isSuccess = false;
		
		try {
			con = DBConnectMaterial.getConnection();
			stmt = con.createStatement();
			
			String sql = "UPDATE Material set name='"+name+"', quantity= '"+quantity+"', unit= '"+unit+"', description='"+description+"', expiryDate= '"+expiryDate+"', supplier= '"+supplier+"'" + "WHERE material_id='"+material_id+"'" ;
			rs = stmt.executeQuery(sql);
			int rowsAffected = stmt.executeUpdate(sql);

            // Check if the deletion was successful (rowsAffected > 0 means success)
            isSuccess = rowsAffected > 0;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static List<Material> getMaterialDetails(String material_id){
		
		int convertedID = Integer.parseInt(material_id);
		ArrayList<Material> mat = new ArrayList<>();
		
		//boolean isSuccess = false;
		
		try {
			con = DBConnectMaterial.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT * FROM Material WHERE material_id = '"+convertedID+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int material_id1 = rs.getInt(1);
				String name = rs.getString(2);
				double quantity = rs.getDouble(3);
				String unit = rs.getNString(4);
				String description = rs.getString(5);
				String expiryDate = rs.getString(6);
				String supplier = rs.getString(7);
				
				Material m = new Material(material_id1, name, quantity, unit, description, expiryDate, supplier);
				mat .add(m);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mat;
		
	}
	
	public static boolean deleteMaterials(String material_id) {
		
		int convertedID = Integer.parseInt(material_id);
		
		boolean isSuccess = false;
		
		try {
			con = DBConnectMaterial.getConnection();
			stmt = con.createStatement();
			
			String sql = "DELETE FROM Material WHERE material_id = '"+convertedID+"'";
			
			int rowsAffected = stmt.executeUpdate(sql);

            // Check if the deletion was successful (rowsAffected > 0 means success)
            isSuccess = rowsAffected > 0;
			
		}
		catch(Exception e) {
			e.printStackTrace();
			 
		}
		
		return isSuccess;
	}
	
}
