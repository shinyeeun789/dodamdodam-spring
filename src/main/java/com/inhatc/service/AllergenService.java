package com.inhatc.service;

import java.util.List;

import com.inhatc.domain.AnalyzeAllergenVO;
import com.inhatc.domain.FoodVO;

public interface AllergenService {
	
	public List<String> getAllergen(String userID) throws Exception;
	
	public List<FoodVO> eatableFood(String allergy_type) throws Exception;
	
	public List<AnalyzeAllergenVO> analyzeAllergen(String userID) throws Exception;

}
