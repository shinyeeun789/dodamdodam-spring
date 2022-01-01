package com.inhatc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.inhatc.domain.FoodVO;
import com.inhatc.persistence.FoodDAO;

@Service
public class FoodServiceImpl implements FoodService {
	@Inject
	private FoodDAO dao;

	@Override
	public List<FoodVO> searchFood(String food) throws Exception {
		return dao.searchFood(food);
	}

	@Override
	public FoodVO getFoodInfo(int foodID) throws Exception {
		return dao.getFoodInfo(foodID);
	}

	@Override
	public List<FoodVO> foodCategory(String category) throws Exception {
		return dao.foodCategory(category);
	}
	
}
