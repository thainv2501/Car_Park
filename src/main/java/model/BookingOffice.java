package model;

public class BookingOffice {
	private int id;
	private String endContactDeadline;
	private String name;
	private String phone;
	private String place;
	private float price;
	private String startContactDeadline;
	private Trip trip;
	
	public BookingOffice() {
		// TODO Auto-generated constructor stub
	}

	public BookingOffice(int id, String endContactDeadline, String name, String phone, String place, float price,
			String startContactDeadline, Trip trip) {
		super();
		this.id = id;
		this.endContactDeadline = endContactDeadline;
		this.name = name;
		this.phone = phone;
		this.place = place;
		this.price = price;
		this.startContactDeadline = startContactDeadline;
		this.trip = trip;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEndContactDeadline() {
		return endContactDeadline;
	}

	public void setEndContactDeadline(String endContactDeadline) {
		this.endContactDeadline = endContactDeadline;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public String getStartContactDeadline() {
		return startContactDeadline;
	}

	public void setStartContactDeadline(String startContactDeadline) {
		this.startContactDeadline = startContactDeadline;
	}

	public Trip getTrip() {
		return trip;
	}

	public void setTrip(Trip trip) {
		this.trip = trip;
	}

	@Override
	public String toString() {
		return "BookingOffice [id=" + id + ", endContactDeadline=" + endContactDeadline + ", name=" + name + ", phone="
				+ phone + ", place=" + place + ", price=" + price + ", startContactDeadline=" + startContactDeadline
				+ ", trip=" + trip + "]";
	}
	
	

}
