package com.lec.jdbc.service;

import java.util.List;

import com.lec.jdbc.common.SearchVO;
import com.lec.jdbc.vo.UserVO;

public interface UserService {

	UserVO getUser(UserVO vo);
	
	int getTotalRowCount(SearchVO searchVO);
	List<UserVO> getUserList(SearchVO searchVO);
	UserVO insertUser(UserVO user);
	
	// 프로필 수정2
	int updatePro(UserVO user);

	int deleteUser(UserVO user);

	UserVO getUser1(UserVO vo);
	//**
	UserVO getUserByNick(UserVO vo);
	
	// 동네 설정
	int updateAddr(UserVO user);
	
	UserVO getUser2(UserVO vo);

}
