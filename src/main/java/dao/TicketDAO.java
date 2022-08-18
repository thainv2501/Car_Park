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


public class TicketDAO {
	private PreparedStatement ps;
	private ResultSet rs;
	private static Connection connection = new ConnectionDB().getConnection();
	
	
	public ArrayList<Ticket> getAll() {
		ArrayList<Ticket> list = new ArrayList<>();
		try {
			String sql = "select * from Ticket";
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Car c = new Car();
				c.setLicensePlate(rs.getString(4));
				c = new CarDAO().getOne(c);
				
				Trip t = new Trip();
				t.setId(rs.getInt(5));
				t = new TripDAO().getOne((t));
				
				Ticket a = new Ticket(rs.getInt(1), rs.getString(2), rs.getString(3), c, t);
				list.add(a);
			}
			return list;
		} catch (SQLException ex) {
			Logger.getLogger(TicketDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}
	
	public ArrayList<Ticket> getAllPagingTicket(int pageIndex, int pageSize) {
        ArrayList<Ticket> list = new ArrayList<>();
        try {
            String sql = "select * from ticket order by ticketId offset (?-1)*? row fetch next ? row only";
            ps = connection.prepareCall(sql);
            ps.setInt(1, pageIndex);
            ps.setInt(2, pageSize);
            ps.setInt(3, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
            	Car c = new Car();
				c.setLicensePlate(rs.getString(4));
				c = new CarDAO().getOne(c);
				
				Trip t = new Trip();
				t.setId(rs.getInt(5));
				t = new TripDAO().getOne((t));
				
				Ticket a = new Ticket(rs.getInt(1), rs.getString(2), rs.getString(3), c, t);
				list.add(a);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
	
	public ArrayList<Ticket> getListBySeach(String search) {
		ArrayList<Ticket> list = new ArrayList<>();
		try {
			String sql = "select * from Ticket where (customerName like '%"+search+"%' or licensePlate like '%"+search+"%')";
			ps = connection.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				Car c = new Car();
				c.setLicensePlate(rs.getString(4));
				c = new CarDAO().getOne(c);
				
				Trip t = new Trip();
				t.setId(rs.getInt(5));
				t = new TripDAO().getOne((t));
				
				Ticket a = new Ticket(rs.getInt(1), rs.getString(2), rs.getString(3), c, t);
				list.add(a);
			}
			return list;
		} catch (SQLException ex) {
			Logger.getLogger(TicketDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}
	
	public Ticket getTicketById(int id) {
		Ticket ticket = null;
		String sql = "select * from ticket where ticketId = ?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				Car c = new Car();
				c.setLicensePlate(rs.getString(4));
				c = new CarDAO().getOne(c);
				
				Trip t = new Trip();
				t.setId(rs.getInt(5));
				t = new TripDAO().getOne((t));
				
				ticket = new Ticket(rs.getInt(1), rs.getString(2), rs.getString(3), c, t);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return ticket;
	}

	public ArrayList<Ticket> getListBySeachAllPaging(String search, int pageTicket, int pageSize) {
		ArrayList<Ticket> list = new ArrayList<>();
		try {
			String sql = "select * from Ticket where (customerName like '%"+search+"%' or licensePlate like '%"+search+"%')  order by ticketId offset (?-1)*? row fetch next ? row only";
			ps = connection.prepareStatement(sql);
			ps.setInt(1, pageTicket);
            ps.setInt(2, pageSize);
            ps.setInt(3, pageSize);
			rs = ps.executeQuery();
			while (rs.next()) {
				Car c = new Car();
				c.setLicensePlate(rs.getString(4));
				c = new CarDAO().getOne(c);
				
				Trip t = new Trip();
				t.setId(rs.getInt(5));
				t = new TripDAO().getOne((t));
				
				Ticket a = new Ticket(rs.getInt(1), rs.getString(2), rs.getString(3), c, t);
				list.add(a);
			}
			return list;
		} catch (SQLException ex) {
			Logger.getLogger(TicketDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public static int add(Ticket ticket) {
		int n = 0;
		String sql = "INSERT INTO [dbo].[ticket]\r\n"
				+ "           ([bookingTime]\r\n"
				+ "           ,[customerName]\r\n"
				+ "           ,[licensePlate]\r\n"
				+ "           ,[tripId])\r\n"
				+ "     VALUES\r\n"
				+ "           (?,?,?,?)";
		System.out.println(sql);
		try {
			PreparedStatement pre = connection.prepareStatement(sql);
			pre.setString(1, ticket.getBookingTime());
			pre.setString(2, ticket.getCustomerName());
			pre.setString(3, ticket.getCar().getLicensePlate());
			pre.setInt(4, ticket.getTrip().getId());
			n = pre.executeUpdate();
		} catch (SQLException ex) {
			Logger.getLogger(TicketDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return n;
	}

	public static int delete(int ticketId) {
		int n = 0;
		String sql = "DELETE FROM [dbo].[ticket]\r\n"
				+ "      WHERE ticketId = ?";
		System.out.println(sql);
		try {
			PreparedStatement pre = connection.prepareStatement(sql);
			pre.setInt(1, ticketId);			
			n = pre.executeUpdate();
		} catch (SQLException ex) {
			Logger.getLogger(TicketDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return n;
	}

}
