package com.inhatc.cs;

import java.util.List;
import java.util.Map;

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

import com.inhatc.domain.MedicineVO;
import com.inhatc.domain.OutbreakReportVO;
import com.inhatc.domain.OutbreakVO;
import com.inhatc.domain.OutbreakWithMedicineVO;
import com.inhatc.service.OutbreakService;

@Controller
@RequestMapping("/outbreak/*")
public class OutbreakController {
	private static final Logger logger = LoggerFactory.getLogger(OutbreakController.class);
	
	@Inject
	private OutbreakService service;
	
	@RequestMapping(value="/outbreakPlus.do", method=RequestMethod.GET)
	public void outbreakPlusGET(Model model, HttpSession session) throws Exception {
		logger.info("outbreakPlus GET..........");
	}
	
	@RequestMapping(value="/outbreakPlus.do", method=RequestMethod.POST)
	public String outbreakPlusPOST(OutbreakVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("outbreakPlus POST..........");
		
		int cnt = service.insertOutbreak(vo);
		if (cnt == 0) {
			rttr.addFlashAttribute("msg", -1);
		} else {
			rttr.addFlashAttribute("msg", 0);
		}
		return "redirect:/outbreak/outbreakList.do";
	}
	
	@RequestMapping(value="/outbreakList.do", method=RequestMethod.GET)
	public void outbreakListGET(Model model, HttpSession session) throws Exception {
		logger.info("outbreakList GET..........");
	}
	
	@RequestMapping(value="/getOutbreakListWithMonth.do", method=RequestMethod.GET)
	public @ResponseBody List<OutbreakWithMedicineVO> getOutbreakListWithMonth(String userID, String outbreakMonth) throws Exception {
		logger.info("getDietListWithMonth GET...........");
		return service.getOutbreakListWithMonth(userID, outbreakMonth);
	}
	
	@RequestMapping(value="/medicinePlus.do", method=RequestMethod.GET)
	public void medicinePlusGET(Model model, HttpSession session) throws Exception {
		logger.info("outbreakPlus GET..........");
	}
	
	@RequestMapping(value="/medicinePlus.do", method=RequestMethod.POST)
	public String medicinePlusPOST(MedicineVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("outbreakPlus POST..........");
		
		int cnt = service.insertMedicine(vo);
		if (cnt == 0) {
			rttr.addFlashAttribute("msg", -1);
		} else {
			rttr.addFlashAttribute("msg", 0);
		}
		return "redirect:/outbreak/outbreakList.do";
	}
	
	@RequestMapping(value="/outbreakReport.do", method=RequestMethod.GET)
	public void outbreakReportGET(Model model, HttpSession session) throws Exception {
		logger.info("outbreakReport GET.............");
	}
	
	@RequestMapping(value="/outbreakReport.do", method=RequestMethod.POST)
	public @ResponseBody List<OutbreakReportVO> outbreakReportPOST(String userID) throws Exception {
		return service.getOutbreakReports(userID);
	}
	
	@RequestMapping(value="/getMaxType.do", method=RequestMethod.POST)
	public @ResponseBody OutbreakReportVO getMaxTypePOST(String userID) throws Exception {
		return service.getMaxType(userID);
	}
}
