package com.inhatc.persistence;

import java.util.List;

import com.inhatc.domain.FoodVO;

public interface ManageDAO {
	
	public int insertFood(FoodVO foodVO) throws Exception;
	
	public List<FoodVO> getFoodInfo(FoodVO foodVO) throws Exception;
	
	public int updateRisk(FoodVO foodVO) throws Exception;
}
