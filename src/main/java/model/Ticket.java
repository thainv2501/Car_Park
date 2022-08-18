package model;

public class Ticket {
	private int id;
	private String bookingTime;
	private String  customerName;
	private Car car;
	private Trip trip;
	
	public Ticket() {
		// TODO Auto-generated constructor stub
	}

	public Ticket(int id, String bookingTime, String customerName, Car car, Trip trip) {
		super();
		this.id = id;
		this.bookingTime = bookingTime;
		this.customerName = customerName;
		this.car = car;
		this.trip = trip;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(String bookingTime) {
		this.bookingTime = bookingTime;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public Trip getTrip() {
		return trip;
	}

	public void setTrip(Trip trip) {
		this.trip = trip;
	}

	@Override
	public String toString() {
		return "Ticket [id=" + id + ", bookingTime=" + bookingTime + ", customerName=" + customerName + ", car=" + car
				+ ", trip=" + trip + "]";
	}

	
	

}
