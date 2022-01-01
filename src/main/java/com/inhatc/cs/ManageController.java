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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inhatc.domain.FoodVO;
import com.inhatc.service.ManageService;

@Controller
@RequestMapping("/manage/*")
public class ManageController {
	private static final Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	@Inject
	private ManageService service;
	
	@RequestMapping(value="/newFood.do", method=RequestMethod.GET)
	public void newFoodGET(Model model, HttpSession session) {
		logger.info("newFood GET.........");
	}
	
	@RequestMapping(value="/newFood.do", method=RequestMethod.POST)
	public String newFoodPOST(FoodVO foodVO, RedirectAttributes rttr) throws Exception {
		if (service.insertFood(foodVO) == 1) {
			rttr.addFlashAttribute("msg", 1);
		} else {
			rttr.addFlashAttribute("msg", 0);
		}
		return "redirect:/manage/newFood.do";
	}
	
	@RequestMapping(value="/updateRisk.do", method=RequestMethod.GET)
	public void updateRiskGET(Model model, HttpSession session) throws Exception {
		logger.info("updateFood GET.........");
	}
	
	@RequestMapping(value="/updateRisk.do", method=RequestMethod.POST)
	public String updateRiskPOST(FoodVO foodVO, RedirectAttributes rttr) throws Exception {
		if (service.updateRisk(foodVO) == 1) {
			rttr.addFlashAttribute("msg", 1);
		} else {
			rttr.addFlashAttribute("msg", 0);
		}
		
		return "redirect:/manage/updateRisk.do";
	}
	
	// 음식 정보 가져오기
	@RequestMapping(value="/getFoodInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public List<FoodVO> getFoodInfo(FoodVO foodVO, HttpSession session) throws Exception {
		List<FoodVO> foodList = service.getFoodInfo(foodVO);
		return foodList;
	}
}
