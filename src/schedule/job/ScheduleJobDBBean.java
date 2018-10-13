package schedule.job;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class ScheduleJobDBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	public int schJbWrt(ScdJbDataBean schJbDto) { 
		session.flushStatements();
		session.clearCache();
		return session.insert("SchJb.wrt", schJbDto); 
	}
	
	public int schJbMod(ScdJbDataBean schJbDto) { 
		session.flushStatements();
		session.clearCache();
		return session.update("SchJb.mod",schJbDto); 
	}
	public int schJbDelHall(ScdJbDataBean schJbDto) {
		session.flushStatements();
		session.clearCache();
		return session.delete("SchJb.hallDel",schJbDto);
	}
	
	public int schJbDel(int schJbId) { 
		session.flushStatements();
		session.clearCache();
		return session.delete("SchJb.del",schJbId); 
	}

	public int schJbCk(Map<String, Object> map) {
		session.flushStatements();
		session.clearCache();
		return session.selectOne("SchJb.ck", map); 
	}
	public int schJbApply(Map<String, Object> map) { 
		session.flushStatements();
		session.clearCache();
		return session.update("SchJb.apply", map); 
	}
	
	public int schJbCncl(Map<String, Object> map) {
		session.flushStatements();
		session.clearCache();
		return session.update("SchJb.cncl", map); 
	}
	
	public List<ScdJbDataBean> schJbList(int schId){
		session.flushStatements();
		session.clearCache();
		return session.selectList("SchJb.list", schId);
	}
	
	public List<Integer> schJbRec(int schId){
		session.flushStatements();
		session.clearCache();
		return session.selectList("SchJb.rec", schId);
	}
}
