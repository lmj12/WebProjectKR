package schedule;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;


import mybatis.SqlMapClient;

public class ScheduleDBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	public int schWrt(ScheduleDataBean schDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int schMod(ScheduleDataBean schDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	
	public int schDel(String schid) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	
	public ScheduleDataBean schGet(String schid) { // 임시매개변수. 필요시 변경할것.
		ScheduleDataBean schDto = new ScheduleDataBean();
		return schDto; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	
	public ScheduleDataBean schNext(String schid) { // 임시매개변수. 필요시 변경할것.
		ScheduleDataBean schDto = new ScheduleDataBean();
		return schDto; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public ScheduleDataBean schPrev(String schid) { // 임시매개변수. 필요시 변경할것.
		ScheduleDataBean schDto = new ScheduleDataBean();
		return schDto; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	
	public List<ScheduleDataBean> schCal(Timestamp date) { // 임시매개변수. 필요시 변경할것.
		List<ScheduleDataBean> schs = new ArrayList<ScheduleDataBean>();
		return schs; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	
}
