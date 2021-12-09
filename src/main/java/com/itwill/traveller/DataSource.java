package com.itwill.traveller;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DataSource {

	public Connection getConnection() throws Exception {
		InputStream in = DataSource.class.getResourceAsStream("jdbc.properties"); 
		Properties properties=new Properties();
		properties.load(in);
		
		String driverClass = properties.getProperty("driverClass");
		String url =properties.getProperty("url");;
		String username = properties.getProperty("user");;
		String password =properties.getProperty("password");;
		/*******************************************/
		Class.forName(driverClass);
		Connection con = DriverManager.getConnection(url, username, password);
		return con;
	}
	
}