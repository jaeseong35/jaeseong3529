package main.java.com.lec.jdbc.service;

import java.util.List;

import com.lec.jdbc.vo.LedgerByAmountVO;
import com.lec.jdbc.vo.LedgerCategoryVO;
import com.lec.jdbc.vo.LedgerMonthlyVO;
import com.lec.jdbc.vo.LedgerVO;

public interface LedgerService {
	LedgerVO getLedger(LedgerVO vo);
    List<LedgerByAmountVO> getLedgerList();
    List<LedgerMonthlyVO> getLedgerMonthly();
    int deleteLedger(LedgerVO ledger);
    int updateLedger(LedgerVO ledger);
    LedgerVO insertLedger(LedgerVO ledger);
}