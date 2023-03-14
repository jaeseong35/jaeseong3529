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


@Repository("PWDAO")
public class PWDAO {
	

		private Connection conn = null;
		private PreparedStatement stmt = null;
		private ResultSet rs = null;
		private final String USER_GET = "select * from users where email=? and name=?";

		public UserVO getUser1(UserVO vo) {
			UserVO user = null;
			try {
				conn = JDBCUtility.getConnection();
				stmt = conn.prepareStatement(USER_GET);
				stmt.setString(1, vo.getEmail());
				stmt.setString(2, vo.getName());
				rs = stmt.executeQuery();
				if (rs.next()) {
					user = new UserVO();
					user.setEmail(rs.getString("email"));
					user.setName(rs.getString("name"));
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
	
