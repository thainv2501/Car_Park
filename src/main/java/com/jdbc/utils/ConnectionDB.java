package com.jdbc.utils;

import java.io.IOException;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionDB {

	private static ConnectionDB instance;
	private static final String CONNECTION_PROPERTIES = "\\connections.properties";
	private String driver;

	private String connectionString;

	private String username;

	private String password;

	private Connection connection;
	
	public ConnectionDB() {
		loadDataFromproperties();
		setConnection();
	}

	private void setConnection() {
		try {
			Class.forName(this.driver);
			this.connection = DriverManager.getConnection(connectionString, username, password);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	
	public Connection getConnection() {
		return connection;
	}

	private void loadDataFromproperties() {
		try {
			Properties properties = new Properties();
			InputStream inputStream  = ConnectionDB.class.getClassLoader().getResourceAsStream(CONNECTION_PROPERTIES);

			properties.load(inputStream);

			this.driver = properties.get("driver").toString();
			this.connectionString = properties.getProperty("connectionString").toString();
			this.username = properties.getProperty("username").toString();
			this.password = properties.getProperty("password").toString();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void disconnect(Connection connection) {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static ConnectionDB getInstance() {
		try {
			if(instance == null || instance.getConnection().isClosed()) {
				return instance = new ConnectionDB();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return instance;
	}
}
