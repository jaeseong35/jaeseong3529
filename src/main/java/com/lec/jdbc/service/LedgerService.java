package com.lec.jdbc.service;

import java.util.List;


import com.lec.jdbc.vo.LedgerCategoryVO;
import com.lec.jdbc.vo.LedgerMonthlyVO;
import com.lec.jdbc.vo.LedgerVO;

public interface LedgerService {
	LedgerVO getLedger(LedgerVO vo);
    List<LedgerVO> getLedgerList();
    List<LedgerMonthlyVO> getLedgerMonthly();
    List<LedgerCategoryVO> getLedgerCategoryList();
    int deleteLedger(LedgerVO ledger);
    int updateLedger(LedgerVO ledger);
    LedgerVO insertLedger(LedgerVO ledger);
}