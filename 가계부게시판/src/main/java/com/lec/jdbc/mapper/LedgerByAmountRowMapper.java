package main.java.com.lec.jdbc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.lec.jdbc.vo.LedgerByAmountVO;

public class LedgerByAmountRowMapper implements RowMapper<LedgerByAmountVO> {
	public LedgerByAmountVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		LedgerByAmountVO ledger = new LedgerByAmountVO();
	
		ledger.setAmount(rs.getInt("AMOUNT"));
		ledger.setId(rs.getInt("ID"));

		ledger.setCategory_id(rs.getInt("CATEGORY_ID"));

		return ledger;
	}
}