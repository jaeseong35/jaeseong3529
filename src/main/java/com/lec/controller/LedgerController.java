package com.lec.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lec.jdbc.common.SearchVO;
import com.lec.jdbc.service.LedgerService;
import com.lec.jdbc.vo.LedgerVO;
import com.lec.jdbc.vo.LedgerCategoryVO;
import com.lec.jdbc.vo.LedgerMonthlyVO;


@Controller
@PropertySource("classpath:config/uploadpath.properties")
public class LedgerController {

   @Autowired
   LedgerService ledgerService;

   
   @Autowired
   Environment environment;
   

   
   @RequestMapping("getLedgerList.do")
   public String getLedgerList(Model model) {
       List<LedgerMonthlyVO> ledgerMonthly = ledgerService.getLedgerMonthly();
       model.addAttribute("ledgerMonthly", ledgerMonthly);
          
       List<LedgerVO> ledgerList = ledgerService.getLedgerList();
       model.addAttribute("ledgerList", ledgerList);
       
       List<LedgerCategoryVO> ledgerCategoryList = ledgerService.getLedgerCategoryList();
       model.addAttribute("ledgerCategoryList", ledgerCategoryList);
       
       
       return "ledger/getLedgerList.jsp";
   }
// insert ledger 컨트롤러
 @RequestMapping("*/insertLedger.do")
 public String insertLedger(LedgerVO ledger){
	 ledgerService.insertLedger(ledger);
    return "redirect:/getLedgerList.do";
 }   
//삭제 
@RequestMapping(value="/deleteLedger.do", method=RequestMethod.GET)
public String deleteLedger(Model model, LedgerVO ledger, @RequestParam int id) {
  ledger.setId(id);
  model.addAttribute("ledger", ledgerService.getLedger(ledger));
  return "ledger/deleteLedger.jsp";
}

@RequestMapping(value="/deleteLedger.do", method=RequestMethod.POST)
public String deleteLedger(LedgerVO ledger) {
  ledgerService.deleteLedger(ledger);
  return "getLedgerList.do";
}   

@RequestMapping(value="/updateLedger.do", method=RequestMethod.GET)
public String updateLedger(Model model, LedgerVO ledger) {
   model.addAttribute("ledger", ledgerService.getLedger(ledger));
   return "ledger/updateLedger.jsp";
}



@RequestMapping(value="/updateLedger.do", method=RequestMethod.POST)
public String updateLedger(LedgerVO ledger) {
   ledgerService.updateLedger(ledger);
   return "getLedgerList.do";   
}   
}
