package com.inhatc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.inhatc.domain.DietVO;
import com.inhatc.persistence.DietDAO;

@Service
public class DietServiceImpl implements DietService {
	@Inject
	private DietDAO dao;

	@Override
	public int insertDiet(DietVO dietVO, String selectFoods) throws Exception {
		String[] foodList = selectFoods.split(",");
		int cnt = 0;
		
		for (String food : foodList) {
			String[] splitFood = food.split("] ");
			if (splitFood.length == 2) {		// DB에 있는 음식일 경우
				String manufacturer = splitFood[0].substring(1);
				String foodName = splitFood[1];
				dietVO.setFoodID(dao.getFoodID(manufacturer, foodName));
				dietVO.setFoodName(foodName);
			} else {							// DB에 없는 음식이거나 제조사가 없는 음식인 경우
				dietVO.setFoodID(dao.getFoodIDWithFoodName(food));
				dietVO.setFoodName(food);
			}
			cnt += dao.insertDiet(dietVO);
		}
		return cnt;
	}

	@Override
	public List<DietVO> getDietList(String userID) throws Exception {
		return dao.getDietList(userID);
	}

	@Override
	public List<DietVO> getDietListWithMonth(String userID, String dietMonth) throws Exception {
		
		Map<String, String> dietMap = new HashMap<String, String>();
		dietMap.put("userID", userID);
		dietMap.put("startDate", dietMonth.concat("-01"));
		
		return dao.getDietListWithMonth(dietMap);
	}
}
