package com.lec.jdbc.dao;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.lec.jdbc.common.SearchVO;
import com.lec.jdbc.mapper.CategoryRowMapper;
import com.lec.jdbc.mapper.LedgerRowMapper;
import com.lec.jdbc.vo.CategoryVO;
import com.lec.jdbc.vo.LedgerVO;


@Repository("ledgerDAO")
@PropertySource("classpath:config/ledgersql.properties")
public class LedgerDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	Environment environment;
	
	private String sql = "";
	private String selectLedgeCateList = "";
	
	@PostConstruct
	public void getSqlPropeties() {
		selectLedgeCateList           = environment.getProperty("selectLedgeCateList");
	
	}


	public List<LedgerVO> getLedgerList() {
		sql = selectLedgeCateList;
		List<LedgerVO> ledgerList = jdbcTemplate.query(sql, new LedgerRowMapper());

		// category 정보 가져오기
		for (LedgerVO ledger : ledgerList) {
			Integer category_id = ledger.getCategory_id(); // Integer로 변경
			if (category_id != null) {
				CategoryVO category = jdbcTemplate.queryForObject("SELECT * FROM CATEGORY WHERE id=?",
						new Object[] { category_id }, new CategoryRowMapper());
				ledger.setCategory(category);
			}
		}
		return ledgerList;
	}
}
