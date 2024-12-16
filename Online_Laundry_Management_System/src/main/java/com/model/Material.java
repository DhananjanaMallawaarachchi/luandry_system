package com.model;

public class Material {

	private int materialId;
    private String name;
    private double quantity;
    private String unit;
    private String description;
    private String expiryDate;
    private String supplier;
    
    public Material(int materialId, String name, double quantity, String unit, String description, String expiryDate,
			String supplier) {
		super();
		this.materialId = materialId;
		this.name = name;
		this.quantity = quantity;
		this.unit = unit;
		this.description = description;
		this.expiryDate = expiryDate;
		this.supplier = supplier;
	}
    public Material() {
    	this.materialId = 0;
		this.name = "";
		this.quantity = 0;
		this.unit = "";
		this.description = "";
		this.expiryDate = "";
		this.supplier = "";
    }

    // Getters and Setters
    public int getMaterialId() {
        return materialId;
    }

    public void setMaterialId(int materialId) {
        this.materialId = materialId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }
    
    @Override
	public String toString() {
		
		return "Material ID = " + materialId + "\n" + "Meterial Name = " + name + "\n" + "Quantity = " + quantity + "\n"
				+ "Units = " + unit + "\n" + "Item Description = " + description + "\n" + "Expiry Date = "
				+ expiryDate + "\n" + "Supplier Name = " + supplier;
	}
}
