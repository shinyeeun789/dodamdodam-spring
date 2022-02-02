package com.inhatc.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	
}
