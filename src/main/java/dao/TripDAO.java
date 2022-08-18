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
}
