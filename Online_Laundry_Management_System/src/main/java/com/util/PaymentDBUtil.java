package com.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Payment;

public class PaymentDBUtil {
	private static Connection con = null;
	private static Statement invoice = null;
	private static ResultSet ResSet = null;
	
/*AddPayment*/
	
	public static boolean addPayment(String Fname, String ServiceCategory, double Amount, String Number, String PaymentMethod, double Pendingamount) {
		
		boolean isSuccess = false;
		
		try {
			
			con = PayDBConnect.getConnection();
			invoice = con.createStatement();
			
			String sql = "INSERT INTO Payment (0, '"+Fname+"', '"+ServiceCategory+"', '+Amount+', '"+Number+"', '"+PaymentMethod+"','+Pendingamount+')";
			boolean ResSet = invoice.execute(sql);
			
			if (ResSet) {
				
				isSuccess = true;
			}
			else {
				
				isSuccess = false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static boolean UpdatePayment(int PaymentID, String Fname, String ServiceCategory, double Amount, String Number, String PaymentMethod, double Pendingamount) {
		
		boolean isSuccess = false;
		
		try {
			
			con = PayDBConnect.getConnection();
			invoice = con.createStatement();
			
			String sql = "UPDATE Payment set Fname = '"+Fname+"', ServiceCategory = '"+ServiceCategory+"', Amount = '+Amount+', Number= '"+Number+"', PaymentMethod = '"+PaymentMethod+"', Pendingamount = '+Pendingamount+'";
			
			int ResSet = invoice.executeUpdate(sql);
			
			if (ResSet > 0) {
				
				isSuccess = true;
			}
			else {
				 
				isSuccess = false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}

	public static List<Payment> getPaymentDetails(String PaymentID){
			
			int convertedID = Integer.parseInt(PaymentID);
			ArrayList<Payment> Pay = new ArrayList<>();
			
			try {
				con = PayDBConnect.getConnection();
				invoice = con.createStatement();
				
				String sql = "SELECT * FROM Material WHERE material_id = '"+convertedID+"'";
				ResSet = invoice.executeQuery(sql);
				
				while(ResSet.next()) {
					int PaymentID1 = ResSet.getInt(1);
					String Fname = ResSet.getString(15);
					String ServiceCategory = ResSet.getNString(10);
					double Amount = ResSet.getDouble(6);
					String Number = ResSet.getString(10);
					String PaymentMethod = ResSet.getString(10);
					double Pendingamount = ResSet.getDouble(6);
					
					Payment p = new Payment(PaymentID1, Fname, ServiceCategory, Amount, Number, PaymentMethod , Pendingamount);
					Pay .add(p);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return Pay;
		
	}

	public static boolean deletePayment(String PaymentID) {
		
		int convertedID = Integer.parseInt(PaymentID);
		
		boolean isSuccess = false;
		
		try {
			con = PayDBConnect.getConnection();
			invoice = con.createStatement();
			
			String sql = "DELETE FROM Payment WHERE PaymentID = '"+convertedID+"'";
			ResSet = invoice.executeQuery(sql);
			int r = invoice.executeUpdate(sql);
			
			if(r > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
}


}
