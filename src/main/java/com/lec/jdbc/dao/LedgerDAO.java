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
	private String ledgerTotalRowCount = "";
	private String selectMyLedgerList = "";
	private String selectLedgeCateList = "";

//   제목,작성자,카테고리로 검색하기
	private String selectLedgerListByAll = "";
	private String selectLedgerListByIncome = "";
	private String selectLedgerListByExpence = "";

	@PostConstruct
	public void getSqlPropeties() {
		ledgerTotalRowCount = environment.getProperty("ledgerTotalRowCount");
		selectMyLedgerList = environment.getProperty("selectMyLedgerList");
		selectLedgerListByAll = environment.getProperty("selectLedgerListByAll");
		selectLedgerListByIncome = environment.getProperty("selectLedgerListByIncome");
		selectLedgerListByExpence = environment.getProperty("selectLedgerListByExpence");
		selectLedgeCateList = environment.getProperty("selectLedgeCateList");
	}

	public int getTotalRowCount(SearchVO searchVO) {

		if (searchVO.getSearchType() == null || searchVO.getSearchType().isEmpty() || searchVO.getSearchWord() == null
				|| searchVO.getSearchWord().isEmpty()) {
			sql = ledgerTotalRowCount;
			searchVO.setSearchType("all");
		} else {
			if (searchVO.getSearchType().equalsIgnoreCase("alll")) {
			} else if (searchVO.getSearchType().equalsIgnoreCase("nickname")) {
				sql = ledgerTotalRowCount + " and category_id like '%" + searchVO.getSearchWord() + "%'";
			} else if (searchVO.getSearchType().equalsIgnoreCase("Cate2")) {
				sql = ledgerTotalRowCount + " and category_id like '%" + searchVO.getSearchWord() + "%'";
			} 
		}
		return jdbcTemplate.queryForInt(sql);
	}

	public List<LedgerVO> getLedgerList(SearchVO searchVO) {
	    if (searchVO.getSearchType() == null || searchVO.getSearchType().isEmpty()
	            || searchVO.getSearchWord() == null || searchVO.getSearchWord().isEmpty()) {
	        sql = selectLedgeCateList;
	        searchVO.setSearchType("all");
	    } else {
	        if (searchVO.getSearchType().equalsIgnoreCase("all")) {
	            sql = selectLedgeCateList;
	        } else if (searchVO.getSearchType().equalsIgnoreCase("1")) {
	            sql = selectLedgerListByIncome;
	        } else if (searchVO.getSearchType().equalsIgnoreCase("2")) {
	            sql = selectLedgerListByExpence;
	        }
	    }
	    
	    String searchWord = "%" + searchVO.getSearchWord() + "%";
	    Object[] args = { searchWord, searchVO.getFirstRow(), searchVO.getRowSizePerPage() };
	    List<LedgerVO> ledgerList = jdbcTemplate.query(sql, args, new LedgerRowMapper());
	    
	    // category 정보 가져오기
	        for (LedgerVO ledger : ledgerList) {
	            Integer category_id = ledger.getCategory_id(); // Integer로 변경
	            if (category_id != null) {
	                CategoryVO category = jdbcTemplate.queryForObject(
	                        "SELECT * FROM CATEGORY WHERE id=?", new Object[] { category_id },
	                        new CategoryRowMapper());
	                ledger.setCategory(category);
	            }
	        }
	        return ledgerList;
	}
}
