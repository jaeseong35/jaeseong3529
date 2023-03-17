package com.lec.jdbc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.lec.jdbc.vo.CategoryVO;

public class CategoryRowMapper implements RowMapper<CategoryVO> {
	public CategoryVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		CategoryVO category = new CategoryVO();
		category.setId(rs.getInt("ID"));
		category.setName(rs.getString("NAME"));
		category.setType(rs.getString("TYPE"));
		category.setUser_id(rs.getInt("USER_ID"));

		return category;
	}
}