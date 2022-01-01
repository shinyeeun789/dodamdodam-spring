package com.inhatc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.inhatc.domain.FoodVO;

@Repository
public class ManageDAOImpl implements ManageDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.inhatc.mapper.manageMapper";

	@Override
	public int insertFood(FoodVO foodVO) throws Exception {
		return session.insert(namespace+".insertFood", foodVO);
	}

	@Override
	public List<FoodVO> getFoodInfo(FoodVO foodVO) throws Exception {
		return session.selectList(namespace+".getFoodInfo", foodVO);
	}

	@Override
	public int updateRisk(FoodVO foodVO) throws Exception {
		return session.update(namespace+".updateRisk", foodVO);
	}

}
