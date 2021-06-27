package com.inhatc.service;

import com.inhatc.domain.UserVO;

public interface UserService {
	public int login(UserVO userVO) throws Exception;
	public String getAllergy(String userID) throws Exception;
}
