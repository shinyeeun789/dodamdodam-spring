package com.inhatc.service;

import java.util.List;
import java.util.Map;

import com.inhatc.domain.MedicineVO;
import com.inhatc.domain.OutbreakReportVO;
import com.inhatc.domain.OutbreakVO;
import com.inhatc.domain.OutbreakWithMedicineVO;

public interface OutbreakService {

	public int insertOutbreak(OutbreakVO vo) throws Exception;
	
	public List<OutbreakWithMedicineVO> getOutbreakListWithMonth(String userID, String outbreakMonth) throws Exception;
	
	public int insertMedicine(MedicineVO vo) throws Exception;
	
	public List<OutbreakReportVO> getOutbreakReports(String userID) throws Exception;
	
	public OutbreakReportVO getMaxType(String userID) throws Exception;
	
}
