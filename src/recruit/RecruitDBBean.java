package recruit;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class RecruitDBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	public int recWrt(RecruitDataBean recruitDto) { // 임시매개변수. 필요시 변경할것.			
		return session.insert("Rec.recWrt", recruitDto); // 에러막기위한 임시 리턴. 필요없으면 지울것.
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
	
	public List<RecruitDataBean> recList(Map<String, Integer> map) { // 임시매개변수. 필요시 변경할것.		
		return session.selectList("Rec.recList", map); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	public int recCnt() {
		return session.selectOne("Rec.recCnt");				
	}
	public void addCount(int recId) {			
		session.update("Rec.addCount", recId);
	}
}
