package recruit;

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
		return session.update("Rec.recMod", recruitDto); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int recDel(int rctId) { // 임시매개변수. 필요시 변경할것.
		return session.delete("Rec.recDel", rctId); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	public int recPos(RecruitDataBean recDto) {		
		return session.insert("Rec.recPos", recDto);
	}
	public RecruitDataBean recPosGet(int recId) {
		return session.selectOne("Rec.recPosGet", recId);
	}
	public void recStaCng(int rctId) { // 임시매개변수. 필요시 변경할것.
		
	}
	
	public List<RecruitDataBean> recMyList(String jobpId) { // 임시매개변수. 필요시 변경할것.
		return session.selectList("Rec.recMyList", jobpId); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public RecruitDataBean recGet(int recId) { // 임시매개변수. 필요시 변경할것.
		return session.selectOne("Rec.recGet", recId); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public List<RecruitDataBean> recList(Map<String, Integer> map) { // 임시매개변수. 필요시 변경할것.		
		return session.selectList("Rec.recList", map); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	public int recCnt() {
		return session.selectOne("Rec.recCnt");				
	}
	public int recMyCnt(String jobpId) {
		return session.selectOne("Rec.recMyCnt", jobpId);
	}
	public int recMax() {
		return session.selectOne("Rec.recMax");
	}
	public void addCount(int recId) {			
		session.update("Rec.addCount", recId);
	}

}
