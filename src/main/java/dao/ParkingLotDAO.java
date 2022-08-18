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
}
