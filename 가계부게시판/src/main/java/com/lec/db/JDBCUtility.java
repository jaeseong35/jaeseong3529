package main.java.com.lec.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCUtility {

	public static Connection getConnection() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/mony", "root", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			// dummy
		}
	}
	
	public static void commit(Connection conn) {
		try { if(conn!=null) conn.commit(); } catch (Exception e) { }		
	}
	
	public static void rollback(Connection conn) {
		try { if(conn!=null) conn.rollback(); } catch (Exception e) { }		
	}
}