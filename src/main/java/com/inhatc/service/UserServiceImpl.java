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
	public void join(UserVO userVO, String login_type) throws Exception {	
		userVO.setLoginType(login_type);
		dao.join(userVO);
	}

	@Override
	public UserVO login(UserVO userVO) throws Exception {
		return dao.login(userVO);
	}

	@Override
	public int idCheck(UserVO userVO) throws Exception {
		if (dao.idCheck(userVO)) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public int nameCheck(UserVO userVO) throws Exception {
		if (dao.nameCheck(userVO)) {
			return 1;
		} else {
			return 0;			
		}
	}

	@Override
	public String[] getAllergy(String userID) throws Exception {
		String allergyType = dao.getAllergy(userID);
		String[] allergies = null;
		
		if (allergyType != null) {
			allergies = dao.getAllergy(userID).split(",");
		}
		
		return allergies;
	}

	@Override
	public int updateAllergy(UserVO userVO) throws Exception {
		return dao.updateAllergy(userVO);
	}

	@Override
	public int updateUserName(UserVO userVO) throws Exception {
		return dao.updateUserName(userVO);
	}
}
