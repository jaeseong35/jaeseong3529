package main.java.com.lec.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lec.jdbc.dao.LoginDAO;
import com.lec.jdbc.impl.UserServiceImpl;
import com.lec.jdbc.vo.UserVO;

@Controller
public class LoginController {

	@Autowired
	UserServiceImpl userService;
	
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		return "login/login.jsp";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, LoginDAO loginDAO, HttpSession session) {
		
		UserVO user = loginDAO.getUser(vo.getEmail());
		UserVO user2 = userService.getUser(vo);

		if(user == null) {
			session.setAttribute("isLoginSuccess", false);
			return "login/login.jsp";
		}
		
		if(!user.getPassword().equals(vo.getPassword())) {
			session.setAttribute("matchedPassword", false);
			return "login/login.jsp";
			
		} else {
			session.setAttribute("user", user2);
			session.setAttribute("matchedPassword", true);
		}
		
		   if (user2 != null) {
		         if(user2.getUsername().equalsIgnoreCase("ADMIN")) {
		            session.setAttribute("isAdmin", true);
		         } else {
		            session.setAttribute("isAdmin", false);
		         }         
		         session.setAttribute("user", user2);
		         return "getLedgerList.do";
		      } else
		    	  return "login/login.jsp";
	}


	@RequestMapping(value = "/emailCheck.do" , method = RequestMethod.POST)
	   @ResponseBody
	   public String emailCheck(@RequestParam("email") String email){
	      int cnt = userService.emailCheck(email);
	      if (cnt != 0) {
	         return "fail";
	      } else {
	         return "success";
	      }
	   }
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession sess) {
		sess.invalidate();
		return "index.jsp";
	}
}