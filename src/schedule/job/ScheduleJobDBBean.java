package schedule.job;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class ScheduleJobDBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	public int schJbWrt(ScheduleJobDBBean schJbDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int schJbMod(ScheduleJobDBBean schJbDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int schJbDel(int schJbId) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public ScheduleJobDBBean schJbGet(int schJbId) { // 임시매개변수. 필요시 변경할것.
		ScheduleJobDBBean schJbDto = new ScheduleJobDBBean();
		return schJbDto; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int schJbApply(String jbskId, String jbskName) { // 임시매개변수. 필요시 변경할것. 여기는 DataBean으로 받는게 좋을지도 모름.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int schJbCncl(String jbskId) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
}
