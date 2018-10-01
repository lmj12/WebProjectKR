package schedule.job;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class ScheduleJobDBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	public int schJbWrt(ScdJbDataBean schJbDto) { // 임시매개변수. 필요시 변경할것.
		session.flushStatements();
		session.clearCache();
		return session.insert("SchJb.wrt", schJbDto); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int schJbMod(ScdJbDataBean schJbDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int schJbDel(int schJbId) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public ScdJbDataBean schJbGet(int schJbId) { // 임시매개변수. 필요시 변경할것.
		session.flushStatements();
		session.clearCache();
		return null; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int schJbApply(Map<String, Object> map) { // 임시매개변수. 필요시 변경할것. 여기는 DataBean으로 받는게 좋을지도 모름.
		session.flushStatements();
		session.clearCache();
		return session.update("SchJb.apply", map); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int schJbCncl(Map<String, Object> map) { // 임시매개변수. 필요시 변경할것.
		session.flushStatements();
		session.clearCache();
		return session.update("SchJb.cncl", map); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public List<ScdJbDataBean> schJbList(int schId){
		session.flushStatements();
		session.clearCache();
		return session.selectList("SchJb.list", schId);
	}
}
