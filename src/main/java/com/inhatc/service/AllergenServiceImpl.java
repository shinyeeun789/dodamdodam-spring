package com.inhatc.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.inhatc.domain.FoodVO;
import com.inhatc.persistence.AllergenDAO;

@Service
public class AllergenServiceImpl implements AllergenService {
	
	@Inject
	private AllergenDAO dao;

	@Override
	public List<String> getAllergen(String userID) throws Exception {
		
		return Arrays.asList(dao.getAllergen(userID).split(","));
	}

	@Override
	public List<FoodVO> eatableFood(String allergy_type) throws Exception {
		
		List<String> allergyTypes = new ArrayList<String>();
		allergyTypes = Arrays.asList(allergy_type.split(","));
	
		return dao.eatableFood(allergyTypes);
	}
	
}
