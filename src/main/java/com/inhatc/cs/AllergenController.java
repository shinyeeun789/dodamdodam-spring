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
import org.springframework.web.bind.annotation.ResponseBody;

import com.inhatc.domain.AnalyzeAllergenVO;
import com.inhatc.domain.FoodVO;
import com.inhatc.domain.UserVO;
import com.inhatc.service.AllergenService;

@Controller
@RequestMapping("/allergen/*")
public class AllergenController {
	private static final Logger logger = LoggerFactory.getLogger(AllergenController.class);
	
	@Inject
	private AllergenService service;
	
	@RequestMapping(value="/eatableFood.do", method=RequestMethod.GET)
	public void eatableFoodGET(Model model, HttpSession session) throws Exception {
		logger.info("eatableFood GET...............");
	}
	
	@RequestMapping(value="/getAllergen.do", method=RequestMethod.POST)
	public @ResponseBody List<String> getAllergenPOST(String userID, Model model, HttpSession session) throws Exception {
		return service.getAllergen(userID);
	}
	
	@RequestMapping(value="/eatableFood.do", method=RequestMethod.POST)
	public @ResponseBody List<FoodVO> eatableFoodPOST(String allergy_type, Model model, HttpSession session) throws Exception {
		return service.eatableFood(allergy_type);
	}
	
	@RequestMapping(value="/analyzeAllergen.do", method=RequestMethod.GET)
	public void analyzeAllergenGET(Model model, HttpSession session) throws Exception {
		logger.info("analyzeAllergen GET..........");
		
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		
		if (userVO != null) {
			List<AnalyzeAllergenVO> allergenList = service.analyzeAllergen(userVO.getUserID());
			model.addAttribute("allergenList", allergenList);
		}
	}
	
}
