package main.java.com.lec.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lec.jdbc.common.SearchVO;
import com.lec.jdbc.dao.LoginDAO;
import com.lec.jdbc.service.UserService;

import com.lec.jdbc.vo.UserVO;

@Controller
@PropertySource("classpath:config/uploadpath.properties")
public class UserController {

	@Autowired
	UserService userService;
	

	
	@Autowired
	Environment environment;
	
	private String uploadFolder = "";
	
    @PostConstruct
    public void getUploadPathProperties() {
	   uploadFolder = environment.getProperty("uploadFolder");
    }
		
	@RequestMapping("getUserList.do")
	public String getUserList(Model model, SearchVO searchVO,HttpSession sess,
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="10") int rowSizePerPage,
			@RequestParam(defaultValue="") String searchCategory,
			@RequestParam(defaultValue="") String searchType,
			@RequestParam(defaultValue="") String searchWord) {
		
		searchVO.setTotalRowCount(userService.getTotalRowCount(searchVO));
		searchVO.setCurPage(curPage);
		searchVO.setRowSizePerPage(rowSizePerPage);
		searchVO.setSearchCategory(searchCategory);
		searchVO.setSearchType(searchType);
		searchVO.setSearchWord(searchWord);
		searchVO.pageSetting();
	
		List<UserVO> userList = userService.getUserList(searchVO);
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("userList", userList);
		return "user/mypage.jsp";
	}
	
	@RequestMapping("*/insertUser.do")
	public String insertUser(UserVO user)  throws IOException{		
		userService.insertUser(user);
		return "redirect:/login.do";
	}	

	
	

	
	
	@RequestMapping(value="/deleteUser.do", method=RequestMethod.GET)
	public String deleteUser(Model model, UserVO user, SearchVO searchVO, @RequestParam String email) {
		user.setEmail(email);
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("user", userService.getUser(user));
		return "user/deleteUser.jsp";
	}
	
	@RequestMapping(value="/deleteUser.do", method=RequestMethod.POST)
	public String deleteUser(UserVO user) {
		userService.deleteUser(user);
		return "getUserList.do";
	}	
	
	

	
	
	    // 동네 설정
	
		@RequestMapping(value="/updateAddr.do", method=RequestMethod.GET)
		public String updateAddr(UserVO user, HttpSession sess) throws IOException {
			return "user/location.jsp";
		}
		
		@RequestMapping(value="/updateAddr.do", method=RequestMethod.POST)
		public String updateAddr(UserVO user, Model model, HttpSession sess) throws IOException {
			  
			// 바뀐 동네로 세션 정보 업데이트
			  sess.setAttribute("user", userService.updateAddr(user));
			  sess.getAttribute("user");
		      sess.setAttribute("user", userService.getUser(user));
		      model.addAttribute(user);
			
			return "getUserList.do";
		}	
		
		
		// 프로필 수정 
		
		@RequestMapping(value="/updatePro.do", method=RequestMethod.GET)
		public String updatePro( UserVO user,  HttpSession sess) throws IOException{
			
			return "user/updateProfile.jsp";
		}
		
		@RequestMapping(value="/updatePro.do", method=RequestMethod.POST)
		public String updatePro(UserVO user, Model model, HttpSession sess) throws IOException {
			
			
			 // 바뀐 정보로 세션 정보 업데이트
		      sess.setAttribute("user", userService.updatePro(user));
		      sess.getAttribute("user");
		      sess.setAttribute("user", userService.getUser(user));
		      model.addAttribute(user);     
		      model.addAttribute("msg","정보가 정상적으로 수정되었습니다.");
			
			return "user/alert.jsp"; 
		}	
	
		
	
    //거래후기	
	
	@RequestMapping(value="/good.do", method=RequestMethod.POST)
	@ResponseBody
	public String ajaxUser(UserVO user) {
		UserVO vo = userService.getUser(user);
		
		System.out.println("1........." + vo.getName());
		
		return vo.toString(); //vo.getName();
	}			
		
		
		
		@RequestMapping("/downloadpro.do")
		public String download(HttpServletRequest req, HttpServletResponse res) throws Exception { 	
			req.setCharacterEncoding("utf-8");
			String fileName = req.getParameter("fn");
			
			String fromPath = uploadFolder + fileName;
			String toPath = uploadFolder + fileName;
		
			byte[] b = new byte[4096];
			File f = new File(toPath);
			FileInputStream fis = new FileInputStream(fromPath);
			
			String sMimeType = req.getSession().getServletContext().getMimeType(fromPath); // mimetype = file type : pdf, exe, txt.... 
			if(sMimeType == null) sMimeType = "application/octet-stream";
			
			String sEncoding = new String(fileName.getBytes("utf-8"), "8859_1");
			String sEncoding1 = URLEncoder.encode(fileName, "utf-8");
			
			res.setContentType(sMimeType);
			res.setHeader("Content-Transfer-Encoding", "binary");
			res.setHeader("Content-Disposition", "attachment; filename = " + sEncoding1);
				
			int numRead;
			ServletOutputStream os = res.getOutputStream();
		
			while((numRead=fis.read(b, 0, b.length)) != -1 ) {
				os.write(b, 0, numRead);
			}
			
			os.flush();
			os.close();
			fis.close();
			
			return "getUserList.do";
		}	
	
	
}