package reccareer.estimate;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class EstimateDBBean {
private SqlSession session = SqlMapClient.getSession();
	
	public int estWrt(EstimateDataBean estDto) {
		session.flushStatements();
		session.clearCache();
		return session.insert("Est.wrt", estDto); 
	}
	
	public EstimateDataBean estGet(int estId) { // 임시매개변수. 필요시 변경할것.
		session.flushStatements();
		session.clearCache();
		return session.selectOne("Est.get", estId); 
	}
	public List<EstimateDataBean> estList(int recId) { // TODO: 조인을 4개 거쳐해서 확인이 반드시 필요.
		session.flushStatements();
		session.clearCache();
		return session.selectList("Est.estList", recId); 
	}
	
	public EstimateDataBean estGetById(EstimateDataBean estDto) { // TODO: 조인을 4개 거쳐해서 확인이 반드시 필요.
		session.flushStatements();
		session.clearCache();
		return session.selectOne("Est.getById", estDto); 
	}
	
	public List<EstimateDataBean> estJbskList(String jbskId) { // TODO: 조인을 4개 거쳐해서 확인이 반드시 필요.
		session.flushStatements();
		session.clearCache();
		return session.selectList("Est.jbsklist", jbskId); 
	}
	
	
}
