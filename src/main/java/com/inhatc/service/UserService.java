package com.inhatc.service;

import com.inhatc.domain.UserVO;

public interface UserService {
	
	public void join(UserVO userVO, String login_type) throws Exception;
	
	public UserVO login(UserVO userVO) throws Exception;
	
	public int idCheck(UserVO userVO) throws Exception;
	
	public int nameCheck(UserVO userVO) throws Exception;
	
	public String[] getAllergy(String userID) throws Exception;
	
	public int updateAllergy(UserVO userVO) throws Exception;
	
	public int updateUserName(UserVO userVO) throws Exception;

}
