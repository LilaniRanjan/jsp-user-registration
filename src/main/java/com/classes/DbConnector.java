package com.classes;

import java.sql.*;

public class DbConnector {
	private static String dburl = "jdbc:mysql://localhost:3306/aptactivity01";
	private static String dbuser = "root";
	private static String dbpassword = "";
	private static String driver = "com.mysql.jdbc.Driver";
	
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(driver); //register our driver
			con = DriverManager.getConnection(dburl, dbuser, dbpassword); //create connection
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return con;
	}
}
