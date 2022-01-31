package com.inhatc.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.inhatc.domain.FoodVO;
import com.inhatc.persistence.FoodApiDAO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;

@Service
public class FoodApiServiceImpl implements FoodApiService {

	@Inject
	private FoodApiDAO dao;
	
	@Override
	public void parsingData(String foodInfo) throws Exception {
		
		FoodVO foodVO = new FoodVO();
		
		String[] snacks = {"과자", "과자류", "과자유처리제품", "유처리제품", "캔디류", "아이스밀크", "혼합음료", "다류(액상차)", "두유", "신선편의식품",
				"빙과류", "탄산수", "땅콩 또는 견과류 가공품", "커피", "액상커피", "혼합음료", "액상차", "멸균제품", "초콜릿가공품", "과/채음료", "과 · 채주스", "홍삼음료", "떡류", "탄산음료"};
		String[] processeds = {"즉석섭취식품", "서류가공품", "튀김식품", "분쇄가공육","분쇄가공육제품","수산물가공품", "기타가공품", "곡류가공품"};
		String[] manufacturers = {"경기","경기도","철원","충남","주식회사 ","떡 : ","F1","F2","F2(주)","F2 .","F2.","F3","F-3농업회사법인","F4","수입원)㈜ ","("};
		
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(foodInfo);
		
		JSONArray parse_list = (JSONArray)obj.get("list");
		
		for(int i=0; i<parse_list.size(); i++) {
			JSONObject food = (JSONObject) parse_list.get(i);
			
			// 제조사 뒤에 주소 자르기
			StringTokenizer stn = new StringTokenizer(food.get("manufacture").toString(), "-_:/|, ", true);
			String strManu = stn.nextToken();
			if (Arrays.asList(manufacturers).contains(strManu)) {
				foodVO.setManufacturer(stn.nextToken());
			} else {
				foodVO.setManufacturer(strManu);
			}
			
			String allergy = (String) food.get("allergy");
			String[] splitIngredient = {};
			if (allergy != null) {
				splitIngredient = food.get("allergy").toString().split(",");
			}
			
			foodVO.setFoodName((String) food.get("prdlstNm"));
			foodVO.setIngredient((String) food.get("allergy"));
			
			// 카테고리 분리하기
			String prdkind = (String) food.get("prdkind");
			if (Arrays.asList(snacks).contains(prdkind)) {
				foodVO.setCategory("과자");
			} else if (Arrays.asList(processeds).contains(prdkind)) {
				foodVO.setCategory("가공식품");
			} else if (prdkind.equals("빵류")) {
				foodVO.setCategory("빵");
			} else {
				foodVO.setCategory("기타");
			}
			
			if (splitIngredient.length >= 5) {
				foodVO.setRisk(3);
			} else if (splitIngredient.length >= 3) {
				foodVO.setRisk(2);
			} else if (splitIngredient.length >= 1) {
				foodVO.setRisk(1);
			} else {
				foodVO.setRisk(0);
			}
			
			foodVO.setImage((String) food.get("imgurl1"));
			
			System.out.println(foodVO.getManufacturer() + " - " + foodVO.getFoodName());
			
			dao.insertApiFoods(foodVO);
			
		}
		
	}
	
}
