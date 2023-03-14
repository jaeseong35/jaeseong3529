package com.lec.jdbc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jdbc.common.SearchVO;
import com.lec.jdbc.dao.LedgerDAO;
import com.lec.jdbc.service.LedgerService;
import com.lec.jdbc.vo.LedgerVO;
import com.lec.jdbc.vo.LedgerVO;

@Service("ledgerService")
public class LedgerServiceImpl implements LedgerService {

	@Autowired
	LedgerDAO ledgerDAO;
	
	
	public int getTotalRowCount(SearchVO searchVO) {
		return ledgerDAO.getTotalRowCount(searchVO);
	}
	
	@Override
	public List<LedgerVO> getLedgerList(SearchVO searchVO) {
		return ledgerDAO.getLedgerList(searchVO);
	}


}