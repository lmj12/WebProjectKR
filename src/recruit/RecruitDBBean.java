package recruit;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class RecruitDBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	public int recWrt(RecruitDataBean recruitDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int recMod(RecruitDataBean recruitDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int recDel(int rctId) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public void recStaCng(int rctId) { // 임시매개변수. 필요시 변경할것.
		
	}
	
	public List<RecruitDataBean> recMyList(String jbpId) { // 임시매개변수. 필요시 변경할것.
		List<RecruitDataBean> myRecs = new ArrayList<RecruitDataBean>();
		return myRecs; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public RecruitDataBean recGet(int recId) { // 임시매개변수. 필요시 변경할것.
		RecruitDataBean recDto = new RecruitDataBean();
		return recDto; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public List<RecruitDataBean> recList() { // 임시매개변수. 필요시 변경할것.
		List<RecruitDataBean> Recs = new ArrayList<RecruitDataBean>();
		return Recs; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
}
