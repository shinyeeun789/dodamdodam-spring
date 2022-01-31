package com.inhatc.persistence;

import com.inhatc.domain.UserVO;

public interface UserDAO {
	
	public void join(UserVO userVO) throws Exception;
	
	// 로그인 시도
	public UserVO login(UserVO userVO) throws Exception;
	
	// 사용자 정보 가져오기
	public UserVO getUserInfo(UserVO userVO) throws Exception;
	
	// ID 확인 (회원가입 여부 확인)
	public boolean idCheck(UserVO userVO) throws Exception;
	
	// NAME 확인
	public boolean nameCheck(UserVO userVO) throws Exception;
	
	// 알레르기 정보 가져오기
	public String getAllergy(String userID) throws Exception;
	
	// 알레르기 정보 업데이트하기
	public int updateAllergy(UserVO userVO) throws Exception;
	
	// 이름 정보 업데이트하기
	public int updateUserName(UserVO userVO) throws Exception;
}
