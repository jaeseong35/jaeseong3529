package com.lec.jdbc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jdbc.common.SearchVO;
import com.lec.jdbc.dao.LedgerDAO;
import com.lec.jdbc.service.LedgerService;
import com.lec.jdbc.vo.CategoryVO;
import com.lec.jdbc.vo.LedgerCategoryVO;
import com.lec.jdbc.vo.LedgerMonthlyVO;
import com.lec.jdbc.vo.LedgerVO;
import com.lec.jdbc.vo.UserVO;

@Service("ledgerService")
public class LedgerServiceImpl implements LedgerService {
    
    @Autowired
    private LedgerDAO ledgerDAO;

    @Override
    public List<LedgerVO> getLedgerList() {
        return ledgerDAO.getLedgerList();
    }

	@Override
	public List<LedgerMonthlyVO> getLedgerMonthly() {
		return ledgerDAO.getLedgerMonthly();
	}
	
	@Override
	public List<LedgerCategoryVO> getLedgerCategoryList() {
		return ledgerDAO.getLedgerCategoryList();
	}

	@Override
	public LedgerVO insertLedger(LedgerVO ledger) {
		return ledgerDAO.insertLedger(ledger);
	}

	@Override
	public LedgerVO getLedger(LedgerVO vo) {
		return ledgerDAO.getLedger(vo);
	}

	@Override
	public int deleteLedger(LedgerVO ledger) {
		return ledgerDAO.deleteLedger(ledger);
	}

	@Override
	public int updateLedger(LedgerVO ledger) {
		return ledgerDAO.updateLedger(ledger);
	}
}
