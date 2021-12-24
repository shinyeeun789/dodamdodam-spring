package com.inhatc.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.inhatc.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.inhatc.mapper.userMapper";

	@Override
	public UserVO login(UserVO userVO) throws Exception {
		return session.selectOne(namespace+".login", userVO);
	}

	@Override
	public boolean idCheck(UserVO userVO) throws Exception {
		String userID = session.selectOne(namespace+".idCheck", userVO); 
		
		if (userID == null) {
			return false;
		} else {
			return true;
		}
	}



	@Override
	public String getAllergy(String userID) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
