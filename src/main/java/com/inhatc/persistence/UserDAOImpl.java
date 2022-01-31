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
	public void join(UserVO userVO) throws Exception {
		session.insert(namespace+".join", userVO);
	}

	@Override
	public UserVO login(UserVO userVO) throws Exception {
		return session.selectOne(namespace+".login", userVO);
	}

	@Override
	public UserVO getUserInfo(UserVO userVO) throws Exception {
		return session.selectOne(namespace+".getUserInfo", userVO);
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
	public boolean nameCheck(UserVO userVO) throws Exception {
		String userName = session.selectOne(namespace+".nameCheck", userVO);
		
		if (userName == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public String getAllergy(String userID) throws Exception {
		
		return session.selectOne(namespace+".getAllergy", userID);
	}

	@Override
	public int updateAllergy(UserVO userVO) throws Exception {

		return session.update(namespace+".updateAllergy", userVO);
	}

	@Override
	public int updateUserName(UserVO userVO) throws Exception {

		return session.update(namespace+".updateUserName", userVO);
	}
}
