package main.java.com.lec.jdbc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.lec.jdbc.vo.LedgerMonthlyVO;

public class LedgerMonthlyRowMapper implements RowMapper<LedgerMonthlyVO> {
	public LedgerMonthlyVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		LedgerMonthlyVO ledger = new LedgerMonthlyVO();		
		ledger.setMonth(rs.getString("MONTH"));
		ledger.setTotal_amount(rs.getInt("TOTAL_AMOUNT"));

		return ledger;
	}
}