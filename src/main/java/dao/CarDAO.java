package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.jdbc.utils.ConnectionDB;

import model.Car;
import model.ParkingLot;
import model.Ticket;
import model.Trip;

public class CarDAO {
	private PreparedStatement ps;
	private ResultSet rs;
	private Connection connection = new ConnectionDB().getConnection();
	
	public Car getOne(Car c) {
        String sql = "select * from car where licensePlate = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, c.getLicensePlate());
            rs = ps.executeQuery();
            while (rs.next()) {
            	ParkingLot p = new ParkingLot();
				p.setId(rs.getInt(5));
				p = new ParkingLotDAO().getOne(p);
                Car car = new Car(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), p);
                return car;
            }
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return null;
    }
	
	public ArrayList<Car> getAll() {
		ArrayList<Car> list = new ArrayList<>();
		try {
			String sql = "select * from Car";
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				ParkingLot p = new ParkingLot();
				p.setId(rs.getInt(5));
				p = new ParkingLotDAO().getOne(p);
                Car car = new Car(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), p);                
				list.add(car);
			}
			return list;
		} catch (SQLException ex) {
			Logger.getLogger(CarDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}
	
	public ArrayList<String> getAllCompany() {
		ArrayList<String> list = new ArrayList<>();
		try {
			String sql = "select distinct company from car";
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {                
				list.add(rs.getString(1));
			}
			return list;
		} catch (SQLException ex) {
			Logger.getLogger(CarDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public ArrayList<Car> getListBySeach(String search) {
		ArrayList<Car> list = new ArrayList<>();
		try {
			String sql = "select * from Car where (carType like '%"+search+"%' or licensePlate like '%"+search+"%' or carColor like '%"+search+"%' or company like '%"+search+"%')";
			ps = connection.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				ParkingLot p = new ParkingLot();
				p.setId(rs.getInt(5));
				p = new ParkingLotDAO().getOne(p);
                Car car = new Car(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), p);                
				list.add(car);
			}
			return list;
		} catch (SQLException ex) {
			Logger.getLogger(CarDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public ArrayList<Car> getAllPagingTicket(int pageIndex, int pageSize) {
		ArrayList<Car> list = new ArrayList<>();
        try {
            String sql = "select * from Car order by licensePlate offset (?-1)*? row fetch next ? row only";
            ps = connection.prepareCall(sql);
            ps.setInt(1, pageIndex);
            ps.setInt(2, pageSize);
            ps.setInt(3, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
            	ParkingLot p = new ParkingLot();
				p.setId(rs.getInt(5));
				p = new ParkingLotDAO().getOne(p);
                Car car = new Car(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), p);                
				list.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
	}

	public ArrayList<Car> getListBySeachAllPaging(String search, int pageCar, int pageSize) {
		ArrayList<Car> list = new ArrayList<>();
		try {
			String sql = "select * from Car where (carType like '%"+search+"%' or licensePlate like '%"+search+"%' or carColor like '%"+search+"%' or company like '%"+search+"%')  order by licensePlate offset (?-1)*? row fetch next ? row only";
			ps = connection.prepareStatement(sql);
			ps.setInt(1, pageCar);
            ps.setInt(2, pageSize);
            ps.setInt(3, pageSize);
			rs = ps.executeQuery();
			while (rs.next()) {
				ParkingLot p = new ParkingLot();
				p.setId(rs.getInt(5));
				p = new ParkingLotDAO().getOne(p);
                Car car = new Car(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), p);                
				list.add(car);
			}
			return list;
		} catch (SQLException ex) {
			Logger.getLogger(CarDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public int add(Car car) {
		int n = 0;
		String sql = "INSERT INTO [dbo].[car]\r\n"
				+ "           ([licensePlate]\r\n"
				+ "           ,[carColor]\r\n"
				+ "           ,[carType]\r\n"
				+ "           ,[company]\r\n"
				+ "           ,[parkId])\r\n"
				+ "     VALUES\r\n"
				+ "           (?, ?, ?, ? ,?)";
		System.out.println(sql);
		try {
			PreparedStatement pre = connection.prepareStatement(sql);
			pre.setString(1, car.getLicensePlate());
			pre.setString(2, car.getColor());
			pre.setString(3, car.getType());
			pre.setString(4, car.getCompany());
			pre.setInt(5, car.getParkingLot().getId());
			n = pre.executeUpdate();
		} catch (SQLException ex) {
			Logger.getLogger(CarDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return n;
	}
}
