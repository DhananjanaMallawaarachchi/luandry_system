package com.model;

public class Payment {

	
	private int PaymentID;
	private String Fname;
	private String ServiceCategory;
	private double Amount;
	private String Number;
	private String PaymentMethod;
	private double Pendingamount;
	
	public Payment (int PaymentID, String Fname, String ServiceCategory, double Amount,
			String Number, String PaymentMethod, double Pendingamount) {
		
		super();
		this.PaymentID = PaymentID;
		this.Fname = Fname;
		this.ServiceCategory = ServiceCategory;
		this.Amount = Amount;
		this.Number = Number;
		this.PaymentMethod = PaymentMethod;
		this.Pendingamount = Pendingamount;
	}

	public int getPaymentID() {
		return PaymentID;
	}

	public void setPaymentID(int paymentID) {
		PaymentID = paymentID;
	}

	public String getFname() {
		return Fname;
	}

	public void setFname(String fname) {
		Fname = fname;
	}

	public String getServiceCategory() {
		return ServiceCategory;
	}

	public void setServiceCategory(String serviceCategory) {
		ServiceCategory = serviceCategory;
	}

	public double getAmount() {
		return Amount;
	}

	public void setAmount(double amount) {
		Amount = amount;
	}

	public String getNumber() {
		return Number;
	}

	public void setNumber(String number) {
		Number = number;
	}

	public String getPaymentMethod() {
		return PaymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		PaymentMethod = paymentMethod;
	}

	public double getPendingamount() {
		return Pendingamount;
	}

	public void setPendingamount(double pendingamount) {
		Pendingamount = pendingamount;
	}
	
	@Override
	public String toString() {
		return "Payment ID : " + PaymentID + "\n" + "First Name : " + Fname + "\n" + "Serivice Category : " + ServiceCategory + "\n" + "Amount : " + Amount + 
				"\n" + "Contact Number : " + Number + "\n" + "Payment Method : " + PaymentMethod + "\n" + "Pending Amount : " + Pendingamount;
 	}
	
	
}
