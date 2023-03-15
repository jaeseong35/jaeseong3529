package com.lec.jdbc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.lec.jdbc.vo.LedgerVO;

public class LedgerRowMapper implements RowMapper<LedgerVO> {
	public LedgerVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		LedgerVO ledger = new LedgerVO();
		ledger.setDate(rs.getString("DATE"));
		ledger.setContent(rs.getString("CONTENT"));
		ledger.setAmount(rs.getInt("AMOUNT"));
		ledger.setId(rs.getInt("ID"));
		return ledger;
	}
}