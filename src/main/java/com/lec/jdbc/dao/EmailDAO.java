package com.lec.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;

import com.lec.db.JDBCUtility;
import com.lec.jdbc.vo.UserVO;

@Repository("emailDAO")
public class EmailDAO {
	
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	private final String USER_GET = "select * from users where email =?";
	
	
	public int emailCheck (String email) {
		UserVO user = null;
		try {
			conn = JDBCUtility.getConnection();
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, email);
			rs = stmt.executeQuery();
			if(rs.next() || email.equals("")) {
				return 0; 
			} else {
				return 1; }
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtility.close(conn, stmt, rs);
			}
				
 return -1;

	}


	
}
	