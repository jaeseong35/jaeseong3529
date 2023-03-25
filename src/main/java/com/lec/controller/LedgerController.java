package com.lec.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.lec.jdbc.service.LedgerService;
import com.lec.jdbc.vo.LedgerMonthlyVO;
import com.lec.jdbc.vo.LedgerVO;


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
       
       return "ledger/getLedgerList.jsp";
   }

}
