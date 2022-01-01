package com.inhatc.persistence;

import java.util.List;

import com.inhatc.domain.FoodVO;

public interface FoodDAO {
	
	public List<FoodVO> searchFood(String food) throws Exception;
	
	public FoodVO getFoodInfo(int foodID) throws Exception;
	
	public List<FoodVO> foodCategory(String category) throws Exception;

}
