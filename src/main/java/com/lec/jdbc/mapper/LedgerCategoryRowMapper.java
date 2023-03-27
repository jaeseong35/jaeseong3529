package com.lec.jdbc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.lec.jdbc.vo.LedgerCategoryVO;

public class LedgerCategoryRowMapper implements RowMapper<LedgerCategoryVO> {
	public LedgerCategoryVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		LedgerCategoryVO ledger = new LedgerCategoryVO();
		ledger.setDate(rs.getString("DATE"));
		ledger.setContent(rs.getString("CONTENT"));
		ledger.setAmount(rs.getInt("AMOUNT"));
		ledger.setId(rs.getInt("ID"));
		ledger.setCategory_id(rs.getInt("CATEGORY_ID"));

		return ledger;
	}
}