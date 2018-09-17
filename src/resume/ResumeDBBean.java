package resume;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class ResumeDBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	public int rsmWrt(ResumeDataBean rsmDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int rsmMod(ResumeDataBean rsmDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int rsmDel(int rsmId) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public ResumeDataBean rsmGet(int rsmId) { // 임시매개변수. 필요시 변경할것.
		ResumeDataBean rsmDto = new ResumeDataBean();
		return rsmDto; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public List<ResumeDataBean> rsmList() { // 임시매개변수. 필요시 변경할것.
		 List<ResumeDataBean> rsms = new ArrayList<ResumeDataBean>();
		return rsms; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	
}
