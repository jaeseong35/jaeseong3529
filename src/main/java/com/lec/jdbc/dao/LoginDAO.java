package com.lec.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.lec.db.JDBCUtility;
import com.lec.jdbc.mapper.UserRowMapper;
import com.lec.jdbc.vo.UserVO;

@Repository("loginDAO")
public class LoginDAO {
	
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	private final String USER_GET = "select * from users where email=?";

	public UserVO getUser(String email) {
		UserVO user = null;
		try {
			conn = JDBCUtility.getConnection();
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, email);
			rs = stmt.executeQuery();
			if (rs.next()) {
				user = new UserVO();
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtility.close(conn, stmt, rs);
		}
		return user;
	}
}