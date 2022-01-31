package com.inhatc.cs;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.inhatc.domain.FoodVO;
import com.inhatc.service.FoodService;

@Controller
@RequestMapping("/food/*")
public class FoodController {
	private static final Logger logger = LoggerFactory.getLogger(FoodController.class);
	
	@Inject
	private FoodService service;
	
	// 식품 검색 페이지
	@RequestMapping(value="/search.do", method=RequestMethod.GET)
	public void searchGET(String keyword, Model model, HttpSession session) throws Exception {
		logger.info("search GET.........");
		
		List<FoodVO> foodList = service.searchFood(keyword);
		model.addAttribute("foodList", foodList);
	}
	
	// 식품 상세 페이지
	@RequestMapping(value="/foodDetail.do", method=RequestMethod.GET)
	public void foodDetailGET(int foodID, Model model, HttpSession session) throws Exception {
		logger.info("foodDetail GET.........");
		
		FoodVO foodInfo = service.getFoodInfo(foodID);
		model.addAttribute("foodInfo", foodInfo);
		
	}
	
	// 식품 카테고리 페이지
	@RequestMapping(value="/foodCategory.do", method=RequestMethod.GET)
	public void foodCategoryGET(String category, Model model, HttpSession session) throws Exception {
		logger.info("foodCategory GET.........");
		
		List<FoodVO> foodList = service.foodCategory(category);
		model.addAttribute("foodList", foodList);
	}
}
