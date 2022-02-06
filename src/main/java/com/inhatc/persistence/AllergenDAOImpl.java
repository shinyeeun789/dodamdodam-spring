package com.inhatc.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.inhatc.domain.AnalyzeAllergenVO;
import com.inhatc.domain.FoodVO;

@Repository
public class AllergenDAOImpl implements AllergenDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.inhatc.mapper.allergenMapper";
	
	@Override
	public String getAllergen(String userID) throws Exception {
		return session.selectOne(namespace+".getAllergen", userID);
	}

	@Override
	public List<FoodVO> eatableFood(List<String> allergyTypes) throws Exception {
		
		HashMap<String, Object> allergenMap = new HashMap<>();
		allergenMap.put("list", allergyTypes);
		
		return session.selectList(namespace+".eatableFood", allergenMap);
	}

	@Override
	public List<AnalyzeAllergenVO> analyzeAllergen(String userID) throws Exception {
		
		return session.selectList(namespace+".analyzeAllergen", userID);
	}

	@Override
	public int getMaxCount(String userID, String ingredient) throws Exception {
		Map<String, String> whereMap = new HashMap<String, String>();
		whereMap.put("userID", userID);
		whereMap.put("ingredient", ingredient);
		
		return session.selectOne(namespace+".getMaxCount", whereMap);
	}
	
}
