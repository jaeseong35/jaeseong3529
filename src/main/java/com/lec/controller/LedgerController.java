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
   public String getLedgerList(Model model) {
       List<LedgerVO> ledgerList = ledgerService.getLedgerList();
       model.addAttribute("ledgerList", ledgerList);
       return "ledger/getLedgerList.jsp";
   }
}