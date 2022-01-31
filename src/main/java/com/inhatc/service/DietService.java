package com.inhatc.service;

import java.util.List;

import com.inhatc.domain.DietVO;

public interface DietService {

	public int insertDiet(DietVO dietVO, String selectFoods) throws Exception;
	
	public List<DietVO> getDietList(String userID) throws Exception;
	
	public List<DietVO> getDietListWithMonth(String userID, String dietMonth) throws Exception;
	
}
