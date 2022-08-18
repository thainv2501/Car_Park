package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.jdbc.utils.ConnectionDB;
import com.jdbc.utils.Mapper;

import model.Car;
import model.Ticket;
import model.Trip;

public class TripDAO {
	private PreparedStatement ps;
	private ResultSet rs;
	private Connection connection = new ConnectionDB().getConnection();
	
	public Trip getOne(Trip t) {
        String sql = "select * from trip where tripId = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, t.getId());
            rs = ps.executeQuery();
            while (rs.next()) {
                Trip trip = new Trip(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8));
                return trip;
            }
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return null;
    }
	
	public ArrayList<Trip> getAll() {
		ArrayList<Trip> list = new ArrayList<>();
		try {
			String sql = "select * from Trip";
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
			Trip a = new Trip(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8));
				list.add(a);
			}
			return list;
		} catch (SQLException ex) {
			Logger.getLogger(TripDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}
	
	public List<Trip> getAllTrip() {
		String sql = "SELECT * FROM [trip]";
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){
			ResultSet resultSet =  preparedStatement.executeQuery();
			return Mapper.mapToTrips(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<Trip> searchAllTrip(String text) {
		String sql = "select * from trip \r\n"
				+ "where destination like '%"+ text + "%' ";
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){
			ResultSet resultSet =  preparedStatement.executeQuery();
			return Mapper.mapToTrips(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void addTrip(Trip b) {
		String sql = "INSERT INTO dbo.trip( destination, departureTime, driver, carType, maximumOnlineTicketNumber, departureDate) VALUES (?, ?, ?, ?, ?, ?)";
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
			preparedStatement.setString(1, b.getDestination());
			preparedStatement.setString(2, b.getDepartureTime());
			preparedStatement.setString(3, b.getDriver());
			preparedStatement.setString(4, b.getCarType());
			preparedStatement.setInt(5, b.getMaximumOnlineTicketNumber());
			preparedStatement.setString(6, b.getDepartureDate());
			preparedStatement.executeUpdate();
		} catch (Exception ex) {
		}
		return;
	}

	public void deleteTicketbytripId(String id) {
		String sql = "delete from [ticket] where tripId=?";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, id);
			st.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	public void deleteTripId(String id) {

		String sql = "delete from [trip] where tripId=?";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, id);
			st.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	
    
	public Trip getTripById(int id) {
		ResultSet rs = null;
		String sql = "SELECT * FROM dbo.trip WHERE TripId = ?";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, id);
			rs = st.executeQuery();

			while (rs.next()) {			
				String a = rs.getString("departureTime");		
				Trip b = new Trip();
				b.setId(id);			
				b.setDestination(rs.getString("destination"));
				b.setDepartureTime(a);
				b.setDriver(rs.getString("driver"));
				b.setCarType(rs.getString("carType"));
				b.setBookedTicketNumber(rs.getInt("bookedTicketNumber"));
				b.setDepartureDate(rs.getString("departureDate"));
				return b;
			}

		} catch (SQLException e) {
		}
		return null;
	}
	
	 public List<Trip> getlistTripByPage(List<Trip> list, int start, int end){
		ArrayList<Trip> arr = new ArrayList<>();
		 for(int i = start; i<end; i++) {
			 arr.add(list.get(i));
		 }
		 return arr; 
	 }
	 
	 public void updateTrip(Trip b) {
			/* Prepared statement for executing sql queries */
			try {
				String sql = "UPDATE dbo.trip SET destination = ?, departureTime = ?, driver = ?, carType = ?, bookedTicketNumber = ?, departureDate = ? WHERE tripId = ?";
				PreparedStatement pre = connection.prepareStatement(sql);
				pre.setString(1, b.getDestination());
				pre.setString(2, b.getDepartureTime());
				pre.setString(3, b.getDriver());
				pre.setString(4, b.getCarType());
				pre.setInt(5, b.getBookedTicketNumber());
				pre.setString(6, b.getDepartureDate());
				pre.setInt(7, b.getId());
				pre.executeQuery();
			} catch (SQLException ex) {
				Logger.getLogger(TripDAO.class.getName()).log(Level.SEVERE, null, ex);
			}		
		}
	 
	 
	public static void main(String[] args) {
		TripDAO tripDAO = new TripDAO();
		List<Trip> trips= tripDAO.getAllTrip();
		for (Trip trip : trips) {
			System.out.println(trip.toString());
		}	
	}
}
