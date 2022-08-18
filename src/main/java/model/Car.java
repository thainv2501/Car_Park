package model;

public class Car {
	private String licensePlate;
	private String color;
	private String type;
	private String company;
	private ParkingLot parkingLot;
	
	public Car() {
		// TODO Auto-generated constructor stub
	}
	
	public Car(String licensePlate, String color, String type, String company, ParkingLot parkingLot) {
		super();
		this.licensePlate = licensePlate;
		this.color = color;
		this.type = type;
		this.company = company;
		this.parkingLot = parkingLot;
	}

	public String getLicensePlate() {
		return licensePlate;
	}

	public void setLicensePlate(String licensePlate) {
		this.licensePlate = licensePlate;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public ParkingLot getParkingLot() {
		return parkingLot;
	}

	public void setParkingLot(ParkingLot parkingLot) {
		this.parkingLot = parkingLot;
	}

	@Override
	public String toString() {
		return "Car [licensePlate=" + licensePlate + ", color=" + color + ", type=" + type + ", company=" + company
				+ ", parkingLot=" + parkingLot + "]";
	}
	
	
	
	

}
