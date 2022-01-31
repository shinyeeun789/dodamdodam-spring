package com.inhatc.persistence;

import java.util.List;
import java.util.Map;

import com.inhatc.domain.DietVO;

public interface DietDAO {

	public int insertDiet(DietVO dietVO) throws Exception;
	
	public String getFoodID(String manufacturer, String foodName) throws Exception;
	
	public String getFoodIDWithFoodName(String foodName) throws Exception;
	
	public List<DietVO> getDietList(String userID) throws Exception;
	
	public List<DietVO> getDietListWithMonth(Map<String, String> dietMap) throws Exception; 
	
}
