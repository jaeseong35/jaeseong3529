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
import com.lec.jdbc.mapper.LedgerMonthlyRowMapper;
import com.lec.jdbc.mapper.LedgerRowMapper;
import com.lec.jdbc.vo.CategoryVO;
import com.lec.jdbc.vo.LedgerMonthlyVO;
import com.lec.jdbc.vo.LedgerVO;


@Repository("ledgerDAO")
@PropertySource("classpath:config/ledgersql.properties")
public class LedgerDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	Environment environment;
	
	private String sql = "";
	private String selectLedgerCateList = "SELECT l.content, l.category_id, SUM(l.amount) as amount, l.date, c.type, c.name, c.id   FROM ledger l   LEFT JOIN category c ON l.category_id = c.id   WHERE c.type = 'expense'  GROUP BY category_id  ORDER BY amount";
	private String selectLedgerMonthly = "SELECT DATE_FORMAT(date, '%Y-%m') AS month, SUM(amount) AS total_amount FROM ledger LEFT JOIN category c ON category_id = c.id WHERE c.type = 'expense' GROUP BY month ORDER BY month";
	
	@PostConstruct
	public void getSqlPropeties() {
		selectLedgerCateList = environment.getProperty("selectLedgerCateList");
		selectLedgerMonthly = environment.getProperty("selectLedgerMonthly");
	}


	public List<LedgerVO> getLedgerList() {
		sql = selectLedgerCateList;
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
	public List<LedgerMonthlyVO> getLedgerMonthly() {
		sql = selectLedgerMonthly;
		List<LedgerMonthlyVO> ledgerMonthly = jdbcTemplate.query(sql, new LedgerMonthlyRowMapper());
		
		// category 정보 가져오기
				for (LedgerMonthlyVO ledger : ledgerMonthly) {
					Integer category_id = ledger.getCategory_id(); // Integer로 변경
					if (category_id != null) {
						CategoryVO category = jdbcTemplate.queryForObject("SELECT * FROM CATEGORY WHERE id=?",
								new Object[] { category_id }, new CategoryRowMapper());
						ledger.setCategory(category);
					}
				}
				return ledgerMonthly;
			}
}