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

}
