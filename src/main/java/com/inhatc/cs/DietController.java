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

import com.inhatc.domain.DietVO;
import com.inhatc.service.DietService;

@Controller
@RequestMapping("/diet/*")
public class DietController {
	private static final Logger logger = LoggerFactory.getLogger(DietController.class);
	
	@Inject
	private DietService service;
	
	@RequestMapping(value="/dietPlus.do", method=RequestMethod.GET)
	public void dietPlusGET(Model model, HttpSession session) throws Exception {
		logger.info("dietPlus GET..........");
	}
	
	@RequestMapping(value="/dietPlus.do", method=RequestMethod.POST)
	public String dietPlustPOST(DietVO dietVO, String selectFoodList, RedirectAttributes rttr) throws Exception {
		logger.info("dietPlus POST...............");
		
		int cnt = service.insertDiet(dietVO, selectFoodList);
		if (cnt == 0) {
			rttr.addFlashAttribute("msg", -1);
		} else {
			rttr.addFlashAttribute("msg", 0);
		}
		return "redirect:/diet/dietList.do";
	}
	
	@RequestMapping(value="/dietList.do", method=RequestMethod.GET)
	public void dietListGET(String userID, Model model, HttpSession session) throws Exception {
		logger.info("dietList GET...............");
	}
	
	@RequestMapping(value="/getDietListWithMonth.do", method=RequestMethod.GET)
	public @ResponseBody List<DietVO> getDietListWithMonth(String userID, String dietMonth) throws Exception {
		logger.info("getDietListWithMonth GET...........");
		return service.getDietListWithMonth(userID, dietMonth);
	}
}
