package com.lec.jdbc.dao;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.lec.jdbc.mapper.LedgerRowMapper;
import com.lec.jdbc.mapper.CategoryRowMapper;
import com.lec.jdbc.mapper.LedgerCategoryRowMapper;
import com.lec.jdbc.mapper.LedgerMonthlyRowMapper;
import com.lec.jdbc.vo.LedgerVO;
import com.lec.jdbc.vo.CategoryVO;
import com.lec.jdbc.vo.LedgerCategoryVO;
import com.lec.jdbc.vo.LedgerMonthlyVO;

@Repository("ledgerDAO")
@PropertySource("classpath:config/ledgersql.properties")
public class LedgerDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	Environment environment;
	
	private String sql = "";
	private String selectLedgerCateList  = "SELECT L.CONTENT, L.CATEGORY_ID, SUM(L.AMOUNT) AS AMOUNT, L.DATE, C.TYPE, C.NAME, C.ID   FROM LEDGER L   LEFT JOIN CATEGORY C ON L.CATEGORY_ID = C.ID   WHERE C.TYPE = 'EXPENSE'  GROUP BY CATEGORY_ID  ORDER BY AMOUNT";
	private String selectLedgerMonthly   = "SELECT DATE_FORMAT(DATE, '%Y-%M') AS MONTH, SUM(AMOUNT) AS TOTAL_AMOUNT FROM LEDGER LEFT JOIN CATEGORY C ON CATEGORY_ID = C.ID WHERE C.TYPE = 'EXPENSE' GROUP BY MONTH ORDER BY MONTH";
	private String selectLedgerList      = "SELECT * FROM LEDGER JOIN CATEGORY ON LEDGER.CATEGORY_ID = CATEGORY.ID";
	private String insertLedger          = "INSERT INTO LEDGER (USER_ID, CATEGORY_ID, DATE, CONTENT, AMOUNT) VALUES (?, ?, ?, ?, ?)";
	private String selectByLedgerId      = "SELECT * FROM LEDGER WHERE ID = ?";
	private String deleteLedger          = "DELETE FROM LEDGER WHERE ID=?";
	private String updateLedger          = "UPDATE LEDGER SET CATEGORY_ID=?, DATE=?, CONTENT=?, AMOUNT=? WHERE ID=?";
	
	@PostConstruct
	public void getSqlPropeties() {
		selectLedgerCateList = environment.getProperty("selectLedgerCateList");
		selectLedgerMonthly = environment.getProperty("selectLedgerMonthly");
		selectLedgerList = environment.getProperty("selectLedgerList");
		insertLedger = environment.getProperty("insertLedger");
		selectByLedgerId = environment.getProperty("selectByLedgerId");
		deleteLedger = environment.getProperty("deleteLedger");
		updateLedger = environment.getProperty("updateLedger");
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
		
				return ledgerMonthly;
			}
	public List<LedgerCategoryVO> getLedgerCategoryList() {
		sql = selectLedgerList;
		List<LedgerCategoryVO> ledgerCategoryList = jdbcTemplate.query(sql, new LedgerCategoryRowMapper());
		
		// category 정보 가져오기
				for (LedgerCategoryVO ledger : ledgerCategoryList) {
					Integer category_id = ledger.getCategory_id(); // Integer로 변경
					if (category_id != null) {
						CategoryVO category = jdbcTemplate.queryForObject("SELECT * FROM CATEGORY WHERE id=?",
								new Object[] { category_id }, new CategoryRowMapper());
						ledger.setCategory(category);
					}
				}
				return ledgerCategoryList;
			}
	
	
	   public LedgerVO insertLedger(LedgerVO ledger) {
		      jdbcTemplate.update(insertLedger, ledger.getUser_id(), ledger.getCategory_id(), ledger.getDate(), ledger.getContent(), ledger.getAmount());
		      return ledger;
		   }  
	   
		  public LedgerVO getLedger(LedgerVO ledger) {
		      Object[] args = { ledger.getId() };      
		      return (LedgerVO) jdbcTemplate.queryForObject(selectByLedgerId, args, new LedgerRowMapper());
		   }
		  
		  public int deleteLedger(LedgerVO ledger) {
		      
		      System.out.println(ledger.toString());
		      
		      return jdbcTemplate.update(deleteLedger, ledger.getId());
		   }
		  
		  public int updateLedger(LedgerVO ledger) {
		      return jdbcTemplate.update(updateLedger, ledger.getCategory_id(), ledger.getDate(), ledger.getContent(), ledger.getAmount(), ledger.getId());
		   }
}