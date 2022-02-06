package com.inhatc.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.inhatc.domain.AnalyzeAllergenVO;
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

	@Override
	public List<AnalyzeAllergenVO> analyzeAllergen(String userID) throws Exception {
		
		List<AnalyzeAllergenVO> analyzeList = new ArrayList<AnalyzeAllergenVO>();
		analyzeList = dao.analyzeAllergen(userID);
		
		Map<String, Integer> allergenMap = new HashMap<String, Integer>();
		
		for(AnalyzeAllergenVO allergen : analyzeList) {
			ArrayList<String> splitData = new ArrayList<>(Arrays.asList(allergen.getIngredient().split(",")));
		
			for (String str : splitData) {
				if (allergenMap.containsKey(str)) {
					allergenMap.put(str, allergenMap.get(str)+1);
				} else {
					allergenMap.put(str, 1);
				}
			}
		}
		
		Iterator<String> keys = allergenMap.keySet().iterator();
		analyzeList.clear();
		while (keys.hasNext()) {
			AnalyzeAllergenVO vo = new AnalyzeAllergenVO();
			// Ingredient, IngredientCount SET
			vo.setIngredient(keys.next());
			vo.setIngredientCount(allergenMap.get(vo.getIngredient()));
			// MaxCount SET
			vo.setMaxCount(dao.getMaxCount(userID, vo.getIngredient()));
			// percent SET
			vo.setPercent(Math.round((double)vo.getIngredientCount()/vo.getMaxCount()*100));
			if (vo.getPercent() > 60) {
				analyzeList.add(vo);
			}
		}
		
		return analyzeList;
	}
	
}
