package com.inhatc.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.inhatc.domain.UserVO;
import com.inhatc.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	@Inject
	private UserDAO dao;

	@Override
	public int login(UserVO userVO) throws Exception {
		UserVO userInfo = dao.login(userVO);
		if(userInfo == null)
			return 0;			// 실패
		else
			return 1;			// 성공
	}

	@Override
	public String getAllergy(String userID) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
