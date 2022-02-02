package com.inhatc.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.inhatc.domain.MedicineVO;
import com.inhatc.domain.OutbreakReportVO;
import com.inhatc.domain.OutbreakVO;
import com.inhatc.domain.OutbreakWithMedicineVO;

@Repository
public class OutbreakDAOImpl implements OutbreakDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.inhatc.mapper.outbreakMapper";

	@Override
	public int insertOutbreak(OutbreakVO vo) throws Exception {
		return session.insert(namespace+".insertOutbreak", vo);
	}

	@Override
	public List<OutbreakWithMedicineVO> getOutbreakListWithMonth(Map<String, String> outbreakMap) throws Exception {
		return session.selectList(namespace+".getOutbreakListWithMonth", outbreakMap);
	}

	@Override
	public int insertMedicine(MedicineVO vo) throws Exception {
		return session.insert(namespace+".insertMedicine", vo);
	}

	@Override
	public List<OutbreakReportVO> getOutbreakReports(String userID) throws Exception {
		return session.selectList(namespace+".getOutbreakReports", userID);
	}

	@Override
	public OutbreakReportVO getMaxType(String userID) throws Exception {
		return session.selectOne(namespace+".getMaxType", userID);
	}

	@Override
	public int getOutbreaksCount(String userID) throws Exception {
		return session.selectOne(namespace+".outbreaksCount", userID);
	}

	@Override
	public OutbreakReportVO getMedicineCount(String userID) throws Exception {
		return session.selectOne(namespace+".medicineCount", userID);
	}
	
}
