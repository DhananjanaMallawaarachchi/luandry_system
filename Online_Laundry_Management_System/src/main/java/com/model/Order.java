package com.model;

public class Order {
	private String orderId;
    private String services;
    private String stainRemoval;
    private String clothesCollection;
    private String collectionDropOffTime;
    private String deliveryMethod;
    private int deliveryDuration;
    private String deliveryAddress;
    private String paymentMethod;
    private String additionalRequirements;
    private String status;
    
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOrderId() {
		return orderId;
	}
	
	public void setOrderId(String orderId2) {
		this.orderId = orderId2;
	}
	
	public String getServices() {
		return services;
	}
	
	public void setServices(String services) {
		this.services = services;
	}
	
	public String getStainRemoval() {
		return stainRemoval;
	}
	
	public void setStainRemoval(String stainRemoval) {
		this.stainRemoval = stainRemoval;
	}
	
	public String getClothesCollection() {
		return clothesCollection;
	}
	
	public void setClothesCollection(String clothesCollection) {
		this.clothesCollection = clothesCollection;
	}
	
	public String getCollectionDropOffTime() {
		return collectionDropOffTime;
	}
	
	public void setCollectionDropOffTime(String collectionDropOffTime) {
		this.collectionDropOffTime = collectionDropOffTime;
	}
	
	public String getDeliveryMethod() {
		return deliveryMethod;
	}
	
	public void setDeliveryMethod(String deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}
	
	public int getDeliveryDuration() {
		return deliveryDuration;
	}
	
	public void setDeliveryDuration(int deliveryDuration) {
		this.deliveryDuration = deliveryDuration;
	}
	
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	
	public String getPaymentMethod() {
		return paymentMethod;
	}
	
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	
	public String getAdditionalRequirements() {
		return additionalRequirements;
	}
	
	public void setAdditionalRequirements(String additionalRequirements) {
		this.additionalRequirements = additionalRequirements;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", services=" + services + ", stainRemoval=" + stainRemoval
				+ ", clothesCollection=" + clothesCollection + ", collectionDropOffTime=" + collectionDropOffTime
				+ ", deliveryMethod=" + deliveryMethod + ", deliveryDuration=" + deliveryDuration + ", deliveryAddress="
				+ deliveryAddress + ", paymentMethod=" + paymentMethod + ", additionalRequirements="
				+ additionalRequirements + ", status=" + status + ", getStatus()=" + getStatus() + ", getOrderId()="
				+ getOrderId() + ", getServices()=" + getServices() + ", getStainRemoval()=" + getStainRemoval()
				+ ", getClothesCollection()=" + getClothesCollection() + ", getCollectionDropOffTime()="
				+ getCollectionDropOffTime() + ", getDeliveryMethod()=" + getDeliveryMethod()
				+ ", getDeliveryDuration()=" + getDeliveryDuration() + ", getDeliveryAddress()=" + getDeliveryAddress()
				+ ", getPaymentMethod()=" + getPaymentMethod() + ", getAdditionalRequirements()="
				+ getAdditionalRequirements() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	
	

}
