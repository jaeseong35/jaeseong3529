package com.lec.jdbc.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jdbc.common.SearchVO;
import com.lec.jdbc.dao.EmailDAO;
import com.lec.jdbc.dao.PWDAO;
import com.lec.jdbc.dao.UserDAO;
import com.lec.jdbc.service.UserService;
import com.lec.jdbc.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	
//	public UserServiceImpl() {
//		System.out.println("Service 객체 생성!!!!");
//	}
	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}
	
	@Override
	public int getTotalRowCount(SearchVO searchVO) {
		return userDAO.getTotalRowCount(searchVO);
	}
	
	@Override
	public List<UserVO> getUserList(SearchVO searchVO) {
		return userDAO.getUserList(searchVO);
	}

	@Override
	public UserVO insertUser(UserVO user) {
		return userDAO.insertUser(user);
	}

	@Override
	public int deleteUser(UserVO user) {
		return userDAO.deleteUser(user);
	}

//	// 프로필 수정
//	@Override
//	public int updateUser(UserVO user) {
//		return userDAO.updateUser(user);
//	}
	
	// 프로필 수정
	@Override
	public int updatePro(UserVO user ) {
		return userDAO.updatePro(user);
	}
	
	
	// ------------------------ 비밀번호 찾기 --------------------------
	
	@Autowired
	private PWDAO pwDAO;

	public UserVO getUser1(UserVO vo) {
		return pwDAO.getUser1(vo);
	}

	
	// 다른 유저 보기 
	@Override
	public UserVO getUserByNick(UserVO user) {
		return userDAO.getUserByNick(user)
				;
	}

	
	// ---------------- 이메일 중복 체크 ------------------

	
	@Autowired
	private EmailDAO emailDAO;
	
	
	public int emailCheck(String email) {
	      return emailDAO.emailCheck(email);
	   }
	
	// ----------------- 동네 설정 -----------------------
	
	@Override
	public int updateAddr(UserVO user) {
		return userDAO.updateAddr(user);
		
	}
	
	@Override
	public UserVO getUser2(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.getUser(vo);
	}
	
	
	
	
}