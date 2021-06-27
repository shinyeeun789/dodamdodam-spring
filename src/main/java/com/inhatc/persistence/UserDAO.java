package com.inhatc.persistence;

import com.inhatc.domain.UserVO;

public interface UserDAO {
	// 회원가입
	// 로그인
	// 로그아웃
	
	// 로그인 시도
	public UserVO login(UserVO userVO) throws Exception;
	// 알레르기 정보 가져오기
	public String getAllergy(String userID) throws Exception;
}
