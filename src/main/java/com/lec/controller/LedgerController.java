package com.lec.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.lec.jdbc.common.SearchVO;
import com.lec.jdbc.service.LedgerService;
import com.lec.jdbc.service.UserService;
import com.lec.jdbc.vo.LedgerVO;

@Controller
@PropertySource("classpath:config/uploadpath.properties")
public class LedgerController {

   @Autowired
   LedgerService ledgerService;
   
   @Autowired
   UserService userService;
   
   @Autowired
   Environment environment;
   

// LIST컨트롤러
 @RequestMapping("getLedgerList.do")
 public String getLedgerList(Model model, SearchVO searchVO,
       @RequestParam(defaultValue="1") int curPage,
       @RequestParam(defaultValue="10") int rowSizePerPage,
       @RequestParam(defaultValue="") String searchCategory,
       @RequestParam(defaultValue="") String searchType,
       @RequestParam(defaultValue="") String searchWord) {
    
    searchVO.setTotalRowCount(ledgerService.getTotalRowCount(searchVO));
    searchVO.setCurPage(curPage);
    searchVO.setRowSizePerPage(rowSizePerPage);
    searchVO.setSearchCategory(searchCategory);
    searchVO.setSearchType(searchType);
    searchVO.setSearchWord(searchWord);
    searchVO.pageSetting();
 
    List<LedgerVO> ledgerList = ledgerService.getLedgerList(searchVO);
    model.addAttribute("searchVO", searchVO);
    model.addAttribute("ledgerList", ledgerList);      
    return "ledger/getLedgerList.jsp";
 }
     
}