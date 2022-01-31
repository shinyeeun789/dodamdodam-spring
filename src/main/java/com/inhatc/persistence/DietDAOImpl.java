package com.inhatc.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.inhatc.domain.DietVO;
import com.inhatc.domain.FoodVO;

@Repository
public class DietDAOImpl implements DietDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.inhatc.mapper.dietMapper";

	@Override
	public int insertDiet(DietVO dietVO) throws Exception {
		return session.insert(namespace+".insertDiet", dietVO);
	}

	@Override
	public String getFoodID(String manufacturer, String foodName) throws Exception {
		FoodVO foodVO = new FoodVO();
		foodVO.setManufacturer(manufacturer);
		foodVO.setFoodName(foodName);
		return session.selectOne(namespace+".getFoodID", foodVO);
	}

	@Override
	public String getFoodIDWithFoodName(String foodName) throws Exception {
		return session.selectOne(namespace+".getFoodIDWithFoodName", foodName);
	}

	@Override
	public List<DietVO> getDietList(String userID) throws Exception {
		return session.selectList(namespace+".getDietList", userID);
	}

	@Override
	public List<DietVO> getDietListWithMonth(Map<String, String> dietMap) throws Exception {
		return session.selectList(namespace+".getDietListWithMonth", dietMap);
	}
}
