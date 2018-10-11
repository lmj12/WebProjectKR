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

	public int recMod(RecruitDataBean recDto) { // 임시매개변수. 필요시 변경할것.
		return session.update("Rec.recMod", recDto); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int recDel(int recId) { // 임시매개변수. 필요시 변경할것.
		return session.delete("Rec.recDel", recId); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	public int recPos(Map<String, Integer> map) {		
		return session.insert("Rec.recPos", map);
	}
	public List<RecruitDataBean> recPosGet(int recId) {
		return session.selectList("Rec.recPosGet", recId);
	}
	public int recGetId(RecruitDataBean recruitDto) {
		session.flushStatements();
		session.clearCache();
		return session.selectOne("Rec.getId",recruitDto );
	}
	public int recStaCng(RecruitDataBean recDto) { // 임시매개변수. 필요시 변경할것.
		return session.update("Rec.recStaCng", recDto);
	}
	public int recStaPro(String jobpId) {
		return session.selectOne("Rec.recStaPro", jobpId);
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

	public int recDelPos(int recId) {
		return session.delete("Rec.recDelPos", recId);		
	}

	
	public int recEndCng(int recStatus) {
		return session.update("Rec.recEndCng", recStatus);		
	}

}
