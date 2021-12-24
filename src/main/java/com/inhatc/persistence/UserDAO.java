package com.inhatc.persistence;

import com.inhatc.domain.UserVO;

public interface UserDAO {
	// 1. 회원가입
	
	// 2. 로그인
	public UserVO login(UserVO userVO) throws Exception;	// 로그인 시도
	
	public boolean idCheck(UserVO userVO) throws Exception;	// ID 확인 (회원가입 여부 확인)
	
	// 3. 로그아웃
	
	
	// 알레르기 정보 가져오기
	public String getAllergy(String userID) throws Exception;
}
