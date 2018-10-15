package reccareer;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class RecCrrDBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	public int recCrrApply(RecCrrDataBean recCrrDto) {
		session.flushStatements();
		session.clearCache();
		return session.insert("RecCrr.apply", recCrrDto); 
	}
	
	public int recCrrCncl(RecCrrDataBean recCrrDto) {
		session.flushStatements();
		session.clearCache();
		return session.delete("RecCrr.cncl", recCrrDto); 
	}
	
	public int recCrrMod(RecCrrDataBean recCrrDto) {
		session.flushStatements();
		session.clearCache();
		return session.update("RecCrr.mod", recCrrDto); 
	}
	
	public int appCk(RecCrrDataBean recCrrDto) {// jbskId와 recId로 찾는 메소드
		session.flushStatements();
		session.clearCache();
		return session.selectOne("RecCrr.appCk", recCrrDto); 
	}
	
	public RecCrrDataBean recCrrGetById(RecCrrDataBean recCrrDto) {
		session.flushStatements();
		session.clearCache();
		return session.selectOne("RecCrr.getById", recCrrDto); 
	}
	
	public RecCrrDataBean recCrrGet(int recCrrId) {
		session.flushStatements();
		session.clearCache();
		return session.selectOne("RecCrr.get", recCrrId); 
	}
	
	public List<RecCrrDataBean> recCrrMyList(String jbskId) {
		session.flushStatements();
		session.clearCache();
		return session.selectList("RecCrr.myList", jbskId); 
	}
	
	public List<RecCrrDataBean> recCrrMyPrevList(String jbskId) {
		session.flushStatements();
		session.clearCache();
		return session.selectList("RecCrr.myPrevList", jbskId); 
	}
	
	public int recCrrCnt(int recId) {
		session.flushStatements();
		session.clearCache();
		return session.selectOne("RecCrr.crrCnt", recId); 
	}
	
	public int recCrrCng(Map<String, Integer> map ) {
		session.flushStatements();
		session.clearCache();
		return session.update("RecCrr.cng", map);
	}

	public List<RecCrrDataBean> recCrrApplyList(int recId) {
		session.flushStatements();
		session.clearCache();
		return session.selectList("RecCrr.applyList", recId); 
	}
	
	public CareerDataBean getCrr(String jbskId) {
		session.flushStatements();
		session.clearCache();
		return session.selectOne("RecCrr.getCrr", jbskId);
	}
	
	public List<CareerDataBean> search(CareerDataBean crrDto){
		session.flushStatements();
		session.clearCache();
		return session.selectList("RecCrr.search", crrDto);
	}
}
