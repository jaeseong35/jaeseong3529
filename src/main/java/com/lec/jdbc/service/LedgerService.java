package com.lec.jdbc.service;

import java.util.List;

import com.lec.jdbc.common.SearchVO;
import com.lec.jdbc.vo.LedgerVO;

public interface LedgerService {
    List<LedgerVO> getLedgerList();
}