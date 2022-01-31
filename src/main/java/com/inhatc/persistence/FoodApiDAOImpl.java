package com.inhatc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.inhatc.domain.FoodVO;

@Repository
public class FoodApiDAOImpl implements FoodApiDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.inhatc.mapper.foodMapper";
	
	@Override
	public int insertApiFoods(FoodVO vo) throws Exception {
		return session.insert(namespace+".insertApiFoods", vo);
	}
	
}
