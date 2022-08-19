package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.utils.ConnectionDB;
import com.jdbc.utils.Mapper;

import model.*;

public class BookingOfficeDAO {
	public List<BookingOffice> getAllBookingOffice() {
		String getAllBookingOffice = "select b.*, t.destination AS tripDestination\r\n"
				+ "from bookingoffice b join trip t \r\n"
				+ "on b.tripId = t.tripId";
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(getAllBookingOffice)){
			ResultSet resultSet =  preparedStatement.executeQuery();
			return Mapper.mapToBookingOffices(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args) {
		BookingOfficeDAO parklot = new BookingOfficeDAO();
		List<BookingOffice> employees = parklot.getAllBookingOffice();
		for (BookingOffice p : employees) {
			System.out.println(p.toString());
		}
	}
	public BookingOffice getBookingOffice(int id) {
		String sql = "SELECT b.*\r\n"
				+ "	  ,t.destination AS tripDestination\r\n"
				+ "  FROM [bookingoffice] b join trip t \r\n"
				+ "  on b.tripId= t.tripId\r\n"
				+ "  where b.officeId=?";
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){
			preparedStatement.setInt(1, id);
			
			ResultSet resultSet =  preparedStatement.executeQuery();
			return Mapper.mapToABookOffice(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	public void insert(BookingOffice bo) {
		String sql = "INSERT INTO [bookingoffice]\r\n"
				+ "           ([endContractDeadline]\r\n"
				+ "           ,[officeName]\r\n"
				+ "           ,[officePhone]\r\n"
				+ "           ,[officePlace]\r\n"
				+ "           ,[officePrice]\r\n"
				+ "           ,[startContractDeadline]\r\n"
				+ "           ,[tripId])\r\n"
				+ "     VALUES\r\n"
				+ "           (?,?,?,?,?,?,?)";
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){
			
			preparedStatement.setString(1, bo.getEndContactDeadline());
			preparedStatement.setString(2, bo.getName());
			preparedStatement.setString(3, bo.getPhone());
			preparedStatement.setString(4, bo.getPlace());
			preparedStatement.setFloat(5, bo.getPrice());
			preparedStatement.setString(6, bo.getStartContactDeadline());
			preparedStatement.setInt(7, bo.getTrip().getId());
			
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public List<BookingOffice> searchBookingOffice(String key, String by, int pageNumber, int elementPerPage) {
		String sql = "";
		if(by.equalsIgnoreCase("Name")) {
			sql = " SELECT b.*, t.destination AS tripDestination "
					+ "FROM bookingoffice b "
					+ "JOIN trip t ON b.tripId = t.tripId "
					+ "WHERE b.officeName LIKE ? ORDER BY b.officeId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
		} else {
			sql = " SELECT b.*, t.destination AS tripDestination "
					+ "FROM bookingoffice b "
					+ "JOIN trip t ON b.tripId = t.tripId "
					+ "WHERE t.destination LIKE ? ORDER BY b.officeId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
		}
		
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){	
			preparedStatement.setString(1, "%" + key + "%");
			preparedStatement.setInt(2, (pageNumber-1) * elementPerPage);
			preparedStatement.setInt(3, elementPerPage);
			ResultSet resultSet = preparedStatement.executeQuery();
			return Mapper.mapToBookingOffices(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int searchTotalPage(String key, String by) {
		String sql = "";
		if(by.equalsIgnoreCase("Name")) {
			sql = "\" SELECT COUNT(*) AS COUNT FROM bookingoffice b \"\r\n"
					+ " JOIN trip t ON b.tripId = t.tripId WHERE b.officeName LIKE ?\"";
		} else {
			sql = " SELECT COUNT(*) AS COUNT FROM bookingoffice b "
					+ " JOIN trip t ON b.tripId = t.tripId WHERE t.destination LIKE ?";
		}
		
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){	
			preparedStatement.setString(1, "%" + key + "%");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				return resultSet.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
}
