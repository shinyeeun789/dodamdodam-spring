package com.inhatc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.inhatc.domain.FoodVO;

@Repository
public class FoodDAOImpl implements FoodDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.inhatc.mapper.foodMapper";

	@Override
	public List<FoodVO> searchFood(String food) throws Exception {
		return session.selectList(namespace+".searchFood", food);
	}

	@Override
	public FoodVO getFoodInfo(int foodID) throws Exception {
		return session.selectOne(namespace+".getFoodInfo", foodID);
	}

	@Override
	public List<FoodVO> foodCategory(String category) throws Exception {
		return session.selectList(namespace+".foodCategory", category);
	}
	
}
