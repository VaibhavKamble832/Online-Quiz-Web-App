package com.dbcon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.DriverPropertyInfo;

public class DBConnect {

	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/quizapp";
			con = DriverManager.getConnection(url, "root", "");
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
}
