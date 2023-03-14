package com.lec.jdbc.dao;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.lec.jdbc.common.SearchVO;
import com.lec.jdbc.mapper.UserRowMapper;
import com.lec.jdbc.vo.UserVO;

@Repository("userDAO")
@PropertySource("classpath:config/usersql.properties")
public class UserDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	Environment environment;
	
	private String sql = "";
	private String selectByEmail = "";
	private String userTotalRowCount = "";
	private String insertUser = "";
	private String deleteUser = "";
	private String updateUser = "";
	private String selectUserList = "";
	private String selectUserListById = ""; 
	private String selectUserListByName = ""; 
	private String updateAddr = "";
	private String selectByNickname = "";
	
	private String updatePro = "";
	
	@PostConstruct
	public void getSqlPropeties() {
		selectByEmail           = environment.getProperty("selectByEmail");
		userTotalRowCount    = environment.getProperty("userTotalRowCount");
		insertUser           = environment.getProperty("insertUser");
		deleteUser           = environment.getProperty("deleteUser");
		updateUser           = environment.getProperty("updateUser");
		selectUserList       = environment.getProperty("selectUserList");
		selectUserListById   = environment.getProperty("selectUserListById");
		selectUserListByName = environment.getProperty("selectUserListByName");
		updateAddr           = environment.getProperty("updateAddr");
		updatePro            = environment.getProperty("updatePro");
		selectByNickname = environment.getProperty("selectByNickname");
	}

	public UserVO getUser(UserVO user) {
		Object[] args = { user.getEmail() };		
		return (UserVO) jdbcTemplate.queryForObject(selectByEmail, args, new UserRowMapper());
	}
	
 // 닉네임으로 유저 정보 가져오기
	
	public UserVO getUserByNick(UserVO user) {
		// System.out.println(jdbcTemplate.getDataSource().getConnection().toString());
		Object[] args = { user.getUsername() };		
		return (UserVO) jdbcTemplate.queryForObject(selectByNickname, args, new UserRowMapper());
	}
	
	public int getTotalRowCount(SearchVO searchVO) {
		
		sql = userTotalRowCount;
		
		String sw = searchVO.getSearchWord()==null ? "" : searchVO.getSearchWord();
		String st = searchVO.getSearchType();
		sql = sw =="" ? sql : (st.equalsIgnoreCase("id") ? sql + " and id like '%" + sw +"%'" : sql + " and name like '%" + sw + "%'");
		return jdbcTemplate.queryForInt(sql);
	}

	public List<UserVO> getUserList(SearchVO searchVO) {	
		sql = searchVO.getSearchWord()==null ? selectUserListById : 
				(searchVO.getSearchType().equalsIgnoreCase("id") ? selectUserListById : selectUserListByName);
		
		String searchWord = "%" + searchVO.getSearchWord() + "%";			
		Object[] args = {searchWord, searchVO.getFirstRow(), searchVO.getRowSizePerPage()};
		return jdbcTemplate.query(sql, args, new UserRowMapper());
	}
	
	public UserVO insertUser(UserVO user) {
		jdbcTemplate.update(insertUser, user.getEmail(), user.getPassword(), user.getUsername(), user.getName());
		return user;
	}	

	public int deleteUser(UserVO user) {
		return jdbcTemplate.update(deleteUser, user.getEmail());
	}

	
	// 동네 설정
	
	public int updateAddr(UserVO user) {
		return jdbcTemplate.update(updateAddr,  user.getEmail());
	}
	
	// 프로필 수정(파일)
	public int updatePro(UserVO user) {
		return jdbcTemplate.update(updatePro, user.getUsername(), user.getPassword(),  user.getEmail());
		
	}

}