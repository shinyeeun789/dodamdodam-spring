package com.inhatc.persistence;

import java.util.List;

import com.inhatc.domain.FoodVO;

public interface AllergenDAO {
	
	public String getAllergen(String userID) throws Exception;
	
	public List<FoodVO> eatableFood(List<String> allergyTypes) throws Exception;
	
}
