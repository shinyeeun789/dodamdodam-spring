package com.inhatc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.inhatc.domain.FoodVO;
import com.inhatc.persistence.ManageDAO;

@Service
public class ManageServiceImpl implements ManageService {
	@Inject
	private ManageDAO dao;

	@Override
	public int insertFood(FoodVO foodVO) throws Exception {
		return dao.insertFood(foodVO);
	}

	@Override
	public List<FoodVO> getFoodInfo(FoodVO foodVO) throws Exception {
		return dao.getFoodInfo(foodVO);
	}

	@Override
	public int updateRisk(FoodVO foodVO) throws Exception {
		return dao.updateRisk(foodVO);
	}
}
