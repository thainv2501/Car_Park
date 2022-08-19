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
import model.ParkingLot;
import model.Ticket;
import model.Trip;

public class ParkingLotDAO {
	private PreparedStatement ps;
	private ResultSet rs;
	private Connection connection = new ConnectionDB().getConnection();
	public ParkingLot getOne(ParkingLot p) {
        String sql = "select * from parkinglot where parkId = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, p.getId());
            rs = ps.executeQuery();
            while (rs.next()) {            	
                ParkingLot parkingLot = new ParkingLot(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getString(6));
                return parkingLot;
            }
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return null;
    }
	
	public ArrayList<ParkingLot> getAll() {
		ArrayList<ParkingLot> list = new ArrayList<>();
		try {
			String sql = "select * from ParkingLot";
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				ParkingLot parkingLot = new ParkingLot(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getString(6));
				list.add(parkingLot);
			}
			return list;
		} catch (SQLException ex) {
			Logger.getLogger(ParkingLotDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}
	
	public List<ParkingLot> getAllParkingLot() {
		String getAllParkingLot = "select * from parkinglot";
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(getAllParkingLot)){
			ResultSet resultSet =  preparedStatement.executeQuery();
			return Mapper.mapToParkLot(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void delete(int id) {
		String sql = "DELETE FROM [parkinglot]\r\n"
				+ "      WHERE parkId=?";
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){
			
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
//	public static void main(String[] args) {
//		ParkingLotDAO parklot = new ParkingLotDAO();
//		ArrayList<ParkingLot> employees = parklot.getAllParkingLot();
//		for (ParkingLot p : employees) {
//			System.out.println(p.toString());
//		}
//	}

	public void insert(ParkingLot pl) {
		String sql = "INSERT INTO [parkinglot]\r\n"
				+ "           ([parkArea]\r\n"
				+ "           ,[parkName]\r\n"
				+ "           ,[parkPlace]\r\n"
				+ "           ,[parkPrice]\r\n"
				+ "           ,[parkStatus])\r\n"
				+ "     VALUES\r\n"
				+ "           (?,?,?,?,?)";
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){
			
			preparedStatement.setInt(1, pl.getArea());
			preparedStatement.setString(2, pl.getName());
			preparedStatement.setString(3, pl.getPlace());
			preparedStatement.setFloat(4, pl.getPrice());
			preparedStatement.setString(5, pl.getStatus());
			
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	public ParkingLot getParkingLot(int id) {
		String sql = "SELECT *\r\n"
				+ "  FROM [parkinglot]\r\n"
				+ "  where parkId=?";
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){
			preparedStatement.setInt(1, id);
			
			ResultSet resultSet =  preparedStatement.executeQuery();
			return Mapper.mapToAParkLot(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void update(ParkingLot pl) {
		String sql = "UPDATE [parkinglot]\r\n"
				+ "   SET [parkArea] = ?\r\n"
				+ "      ,[parkName] = ?\r\n"
				+ "      ,[parkPlace] = ?\r\n"
				+ "      ,[parkPrice] = ?\r\n"
				+ "      ,[parkStatus] = ?\r\n"
				+ " WHERE parkId=?";
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){
			
			preparedStatement.setInt(1, pl.getArea());
			preparedStatement.setString(2, pl.getName());
			preparedStatement.setString(3, pl.getPlace());
			preparedStatement.setFloat(4, pl.getPrice());
			preparedStatement.setString(5, pl.getStatus());
			preparedStatement.setInt(6, pl.getId());
			
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	
	public List<ParkingLot> searchParkingLot(String key, String by, int pageNumber, int elementPerPage) {
		String sql = "";
		if(by.equalsIgnoreCase("Name")) {
			sql = " SELECT * FROM parkinglot\r\n"
					+ "	where  parkName LIKE ? \r\n"
					+ "	ORDER BY parkId\r\n"
					+ "	OFFSET ? ROWS\r\n"
					+ "	FETCH first ? ROWS ONLY;";
			
		} else if(by.equalsIgnoreCase("Place")) {
			sql =" SELECT * FROM parkinglot\r\n"
					+ "	where  parkPlace LIKE ? \r\n"
					+ "	ORDER BY parkId\r\n"
					+ "	OFFSET ? ROWS\r\n"
					+ "	FETCH first ? ROWS ONLY;";
		}else if(by.equalsIgnoreCase("Area")) {
			sql=" SELECT * FROM parkinglot\r\n"
					+ "	where  parkArea LIKE ? \r\n"
					+ "	ORDER BY parkId\r\n"
					+ "	OFFSET ? ROWS\r\n"
					+ "	FETCH first ? ROWS ONLY;";
		}else {
			sql=" SELECT * FROM parkinglot\r\n"
					+ "	where parkPrice LIKE ? \r\n"
					+ "	ORDER BY parkId\r\n"
					+ "	OFFSET ? ROWS\r\n"
					+ "	FETCH first ? ROWS ONLY;";
		}
		
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){	
			preparedStatement.setString(1, "%" + key + "%");
			preparedStatement.setInt(2, (pageNumber-1) * elementPerPage);
			preparedStatement.setInt(3, elementPerPage);
			ResultSet resultSet = preparedStatement.executeQuery();
			return Mapper.mapToParkLot(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int searchTotalPage(String key, String by) {
		String sql = "";
		if(by.equalsIgnoreCase("Name")) {
			sql = "SELECT COUNT(*) AS COUNT FROM Parkinglot WHERE parkName LIKE ?";
		} else if(by.equalsIgnoreCase("Place")) {
			sql = "SELECT COUNT(*) AS COUNT FROM Parkinglot WHERE parkPlace LIKE ? ";
		} else if(by.equalsIgnoreCase("Area")) {
			sql = "SELECT COUNT(*) AS COUNT FROM Parkinglot WHERE parkArea LIKE ? ";
		}else {
			sql = "SELECT COUNT(*) AS COUNT FROM Parkinglot WHERE parkPrice LIKE ? ";
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
