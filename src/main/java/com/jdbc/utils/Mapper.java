package com.jdbc.utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.*;

public class Mapper {
	
	public static List<Employee> mapToEmployees(ResultSet resultSet) throws SQLException {
		List<Employee> employees = new ArrayList<Employee>();
		while(resultSet.next()) {
			int id = resultSet.getInt("employeeId");
			String account = resultSet.getString("account");
			String department = resultSet.getString("department");
			String address = resultSet.getString("employeeAddress");
			String dob = resultSet.getString("employeeBirthdate");
			String email = resultSet.getString("employeeEmail");
			String name = resultSet.getString("employeeName");
			String phone = resultSet.getString("employeePhone");
			String password = resultSet.getString("password");
			String sex = resultSet.getString("sex");
			Employee employee = new Employee();
			employee.setAccount(account);
			employee.setId(id);
			employee.setAddress(address);
			employee.setDepartment(department);
			employee.setDob(dob);
			employee.setEmail(email);
			employee.setName(name);
			employee.setPassword(password);
			employee.setPhone(phone);;
			employee.setSex(sex);
			employees.add(employee);
		}
		return employees;
	}
	
	
	public static List<Trip> mapToTrips(ResultSet resultSet) throws SQLException {
		List<Trip> trips = new ArrayList<Trip>();
		while(resultSet.next()) {
			int id = resultSet.getInt("tripId");
			int bookedTicketNumber = resultSet.getInt("bookedTicketNumber");
			String carType = resultSet.getString("carType");
			String departureDate = resultSet.getString("departureDate");
			String departureTime = resultSet.getString("departureTime");
			String destination = resultSet.getString("destination");
			String driver = resultSet.getString("driver");
			int maximumTiketOnlineNumber = resultSet.getInt("maximumOnlineTicketNumber");
			Trip trip = new Trip();
			trip.setBookedTicketNumber(bookedTicketNumber);
			trip.setCarType(carType);
			trip.setDepartureDate(departureDate);
			trip.setDepartureTime(departureTime);
			trip.setDestination(destination);
			trip.setDriver(driver);
			trip.setId(id);
			trip.setMaximumOnlineTicketNumber(maximumTiketOnlineNumber);
			trips.add(trip);
		}
		return trips;
	}

	public static List<BookingOffice> mapToBookingOffices(ResultSet resultSet) throws SQLException {
		
		List<BookingOffice> bookingOffices = new ArrayList<BookingOffice>();
		while(resultSet.next()) {
			
			BookingOffice bookingoffice = new BookingOffice();
			bookingoffice.setId(resultSet.getInt("officeId"));		
			bookingoffice.setName(resultSet.getString("officeName"));
			bookingoffice.setEndContactDeadline(resultSet.getString("endContractDeadline"));
			bookingoffice.setStartContactDeadline(resultSet.getString("startContractDeadline"));
			bookingoffice.setPhone(resultSet.getString("officePhone"));
			bookingoffice.setPlace(resultSet.getString("officePlace"));
			bookingoffice.setPrice(resultSet.getFloat("officePrice"));
			
			
			Trip trip = new Trip();
			trip.setId(resultSet.getInt("tripId"));
			trip.setDestination(resultSet.getString("tripDestination"));
			
			bookingoffice.setTrip(trip);
			
			bookingOffices.add(bookingoffice);		
		}
		return bookingOffices;
	}
		
		public static List<ParkingLot> mapToParkLot(ResultSet resultSet) throws SQLException {
			
			List<ParkingLot> parkinglots = new ArrayList<ParkingLot>();
			while(resultSet.next()) {
							
				ParkingLot parklot= new ParkingLot();
				parklot.setId(resultSet.getInt(1));
				parklot.setName(resultSet.getString(3));
				parklot.setPlace(resultSet.getString(4));
				parklot.setArea(resultSet.getInt(2));
				parklot.setPrice(resultSet.getFloat(5));
				parklot.setStatus(resultSet.getString(6));
				parkinglots.add(parklot);
				
			}
			return parkinglots;
		}
		
		public static ParkingLot mapToAParkLot(ResultSet resultSet) throws SQLException {
			
			ParkingLot parkinglot = new ParkingLot();
			while(resultSet.next()) {
							
				parkinglot.setId(resultSet.getInt(1));
				parkinglot.setName(resultSet.getString(3));
				parkinglot.setPlace(resultSet.getString(4));
				parkinglot.setArea(resultSet.getInt(2));
				parkinglot.setPrice(resultSet.getFloat(5));
				parkinglot.setStatus(resultSet.getString(6));						
			}
			return parkinglot;
		}

		public static BookingOffice mapToABookOffice(ResultSet resultSet) throws SQLException {
			
			BookingOffice bookingoffice= new BookingOffice();
			while(resultSet.next()) {
							
				bookingoffice.setId(resultSet.getInt(1));
				bookingoffice.setEndContactDeadline(resultSet.getString(2));
				bookingoffice.setName(resultSet.getString(3));
				bookingoffice.setPhone(resultSet.getString(4));
				bookingoffice.setPlace(resultSet.getString(5));
				bookingoffice.setPrice(resultSet.getFloat(6));
				bookingoffice.setStartContactDeadline(resultSet.getString(7));
				
				Trip trip = new Trip();
				trip.setId(resultSet.getInt(8));
				trip.setDestination(resultSet.getString(9));
				bookingoffice.setTrip(trip);
				
			}
			return bookingoffice;
		}
}
