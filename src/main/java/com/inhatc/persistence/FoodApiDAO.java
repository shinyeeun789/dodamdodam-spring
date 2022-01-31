package com.inhatc.persistence;

import com.inhatc.domain.FoodVO;

public interface FoodApiDAO {
	
	public int insertApiFoods(FoodVO vo) throws Exception;
	
}
