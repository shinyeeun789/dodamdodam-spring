package com.inhatc.persistence;

import java.util.List;
import java.util.Map;

import com.inhatc.domain.MedicineVO;
import com.inhatc.domain.OutbreakReportVO;
import com.inhatc.domain.OutbreakVO;
import com.inhatc.domain.OutbreakWithMedicineVO;

public interface OutbreakDAO {
	
	public int insertOutbreak(OutbreakVO vo) throws Exception;
	
	public List<OutbreakWithMedicineVO> getOutbreakListWithMonth(Map<String, String> outbreakMap) throws Exception;
	
	public int insertMedicine(MedicineVO vo) throws Exception;
	
	public List<OutbreakReportVO> getOutbreakReports(String userID) throws Exception;

}
