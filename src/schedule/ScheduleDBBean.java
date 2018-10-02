package schedule;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;


import mybatis.SqlMapClient;

public class ScheduleDBBean { 
	private SqlSession session = SqlMapClient.getSession();
	
	
	public int schWrt(ScheduleDataBean schDto) { // 임시매개변수. 필요시 변경할것.
		session.flushStatements();
		session.clearCache();
		return session.insert("Sch.wrt", schDto);  // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int schMod(ScheduleDataBean schDto) { // 임시매개변수. 필요시 변경할것.
		session.flushStatements();
		session.clearCache();
		return session.update("Sch.mod",schDto); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	
	public int schDel(int schId) { 
		session.flushStatements();
		session.clearCache();
		return session.delete("Sch.del",schId); 
	}
	
	
	public int schGetId(ScheduleDataBean schDto) {
		session.flushStatements();
		session.clearCache();
		return session.selectOne("Sch.getId",schDto);
	}
	
	public ScheduleDataBean schGet(ScheduleDataBean schDto) { 
		session.flushStatements();
		session.clearCache();
		return session.selectOne("Sch.get", schDto);
	}
	
	public ScheduleDataBean schGet(int schId) { //오버로드
		session.flushStatements();
		session.clearCache();
		return session.selectOne("Sch.getById", schId);
	}
	
	
	public ScheduleDataBean schNext(ScheduleDataBean schDto) { // 임시매개변수. 필요시 변경할것.
		session.flushStatements();
		session.clearCache();
		return session.selectOne("Sch.next",schDto); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public ScheduleDataBean schPrev(ScheduleDataBean schDto) { // 임시매개변수. 필요시 변경할것.
		session.flushStatements();
		session.clearCache();
		return session.selectOne("Sch.prev",schDto); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	
	public List<ScheduleDataBean> schCal(Map<String, String> map) { 
		session.flushStatements();
		session.clearCache();
		return session.selectList("Sch.cal", map); 
	}
	
	
}
