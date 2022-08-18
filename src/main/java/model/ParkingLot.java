package model;

public class ParkingLot {
	private int id;
	private int area;
	private String name;
	private String place;
	private float price;
	private String status;
	
	public ParkingLot() {
		// TODO Auto-generated constructor stub
	}

	public ParkingLot(int id, int area, String name, String place, float price, String status) {
		super();
		this.id = id;
		this.area = area;
		this.name = name;
		this.place = place;
		this.price = price;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ParkingLot [id=" + id + ", area=" + area + ", name=" + name + ", place=" + place + ", price=" + price
				+ ", status=" + status + "]";
	}
	
	
	

}
