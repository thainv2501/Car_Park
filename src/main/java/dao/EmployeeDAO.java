package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.jdbc.utils.ConnectionDB;
import com.jdbc.utils.Mapper;

import model.*;

public class EmployeeDAO {
	public List<Employee> getAllEmployee() {
		String getAllEmployee = "select * from employee";
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(getAllEmployee)){
			ResultSet resultSet =  preparedStatement.executeQuery();
			return Mapper.mapToEmployees(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
		public List<Employee> getEmployeesByName(String text) {
			String getEmployeesByName = "select * from employee \r\n"
					+ "where employeeName like '%"+ text + "%' ";
			try(Connection connection = ConnectionDB.getInstance().getConnection();
					PreparedStatement preparedStatement = connection.prepareStatement(getEmployeesByName)){
				ResultSet resultSet =  preparedStatement.executeQuery();
				return Mapper.mapToEmployees(resultSet);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
		
		public void insertEmployee(String account,String department,String address,String dob, String email,String name,String phone,String password,String sex) {
			String insertEmployee = "INSERT INTO [dbo].[employee]\r\n"
					+ "           ([account]\r\n"
					+ "           ,[department]\r\n"
					+ "           ,[employeeAddress]\r\n"
					+ "           ,[employeeBirthdate]\r\n"
					+ "           ,[employeeEmail]\r\n"
					+ "           ,[employeeName]\r\n"
					+ "           ,[employeePhone]\r\n"
					+ "           ,[password]\r\n"
					+ "           ,[sex])\r\n"
					+ "     VALUES\r\n"
					+ "           (?\r\n"
					+ "           ,?\r\n"
					+ "           ,?\r\n"
					+ "           ,?\r\n"
					+ "           ,?\r\n"
					+ "           ,?\r\n"
					+ "           ,?\r\n"
					+ "           ,?\r\n"
					+ "           ,?)";
			try(Connection connection = ConnectionDB.getInstance().getConnection();
					PreparedStatement preparedStatement = connection.prepareStatement(insertEmployee)){
				preparedStatement.setString(1, account);
				preparedStatement.setString(2, department);
				preparedStatement.setString(3, address);
				preparedStatement.setString(4, dob);
				preparedStatement.setString(5, email);
				preparedStatement.setString(6, name);
				preparedStatement.setString(7, phone);
				preparedStatement.setString(8, password);
				preparedStatement.setString(9, sex);
				 preparedStatement.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
	//login employee
	public Employee loginEmployee(String username,String password) {
		String sql="Select * from employee where account = ? and password =?";
		try(Connection connection =ConnectionDB.getInstance().getConnection()) {
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				return new Employee(rs.getInt("employeeId"),rs.getString("account"),rs.getString("department"),
						rs.getString("employeeAddress"),rs.getString("employeeBirthdate"),rs.getString("employeeEmail"),rs.getString("employeeName"),
						rs.getString("employeePhone"),rs.getString("password"),rs.getString("sex"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//login admin
	public Admin loginAdmin(String username,String password) {
		String sql="Select * from admin where account = ? and password =?";
		try(Connection connection =ConnectionDB.getInstance().getConnection()) {
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				return new Admin(rs.getString("account"),rs.getString("password"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		EmployeeDAO employeeDAO = new EmployeeDAO();
		List<Employee> employees = employeeDAO.getAllEmployee();
		for (Employee employee : employees) {
			System.out.println(employee.toString());
		}
	}
}



