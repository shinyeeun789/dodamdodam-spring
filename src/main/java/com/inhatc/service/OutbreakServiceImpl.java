package com.inhatc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.inhatc.domain.MedicineVO;
import com.inhatc.domain.OutbreakReportVO;
import com.inhatc.domain.OutbreakVO;
import com.inhatc.domain.OutbreakWithMedicineVO;
import com.inhatc.persistence.OutbreakDAO;

@Service
public class OutbreakServiceImpl implements OutbreakService {
	
	@Inject
	private OutbreakDAO dao;

	@Override
	public int insertOutbreak(OutbreakVO vo) throws Exception {
		return dao.insertOutbreak(vo);
	}

	@Override
	public List<OutbreakWithMedicineVO> getOutbreakListWithMonth(String userID, String outbreakMonth) throws Exception {
		Map<String, String> dietMap = new HashMap<String, String>();
		dietMap.put("userID", userID);
		dietMap.put("startDate", outbreakMonth.concat("-01"));
		
		return dao.getOutbreakListWithMonth(dietMap);
	}

	@Override
	public int insertMedicine(MedicineVO vo) throws Exception {
		return dao.insertMedicine(vo);
	}

	@Override
	public List<OutbreakReportVO> getOutbreakReports(String userID) throws Exception {
		
		return dao.getOutbreakReports(userID);
	}
	
}
