package team;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class TeamDBBean {
private SqlSession session = SqlMapClient.getSession();
	public int makeTeam(String jbpId) {
		session.flushStatements();
		session.clearCache();
		return session.insert("Team.make",jbpId);
	}
	
	public int getTeamId(String jbpId) {
		session.flushStatements();
		session.clearCache();
		return session.selectOne("Team.getTeamId",jbpId);
	}
	
	public List<TeamDataBean> getTeamIdsk(String jbskId) {
		session.flushStatements();
		session.clearCache();
		return session.selectList("Team.getTeamIdsk",jbskId);
	}
	
	public int getMemCount(int teamId) {
		session.flushStatements();
		session.clearCache();
		return session.selectOne("Team.getMemCount",teamId);
	}
	
	public int teamReq(TeamDataBean teamDto) { // 임시매개변수. 필요시 변경할것.
		session.flushStatements();
		session.clearCache();
		return session.insert("Team.req",teamDto); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int jbskCk(String jbskId) {
		session.flushStatements();
		session.clearCache();
		return session.selectOne("Team.jbskCk",jbskId);
	}
	
	public int teamAssign(TeamDataBean teamDto) { // 임시매개변수. 필요시 변경할것.
		session.flushStatements();
		session.clearCache();
		return session.update("Team.assign", teamDto);
	}
	
	public int teamExit(TeamDataBean teamDto) { // 임시매개변수. 필요시 변경할것.
		session.flushStatements();
		session.clearCache();
		return session.delete("Team.exit",teamDto); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public List <TeamDataBean> reqList(int teamId) { // 임시매개변수. 필요시 변경할것.
		session.flushStatements();
		session.clearCache();
		return session.selectList("Team.reqList", teamId); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public List <TeamDataBean> ckReq(String jbskId) { // 임시매개변수. 필요시 변경할것.
		session.flushStatements();
		session.clearCache();
		return session.selectList("Team.ckReq", jbskId); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public List <TeamDataBean> teamList(int teamId) { // 임시매개변수. 필요시 변경할것.
		session.flushStatements();
		session.clearCache();
		return session.selectList("Team.list", teamId); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public void teamRemoveLeftver(TeamDataBean teamDto) {
		session.flushStatements();
		session.clearCache();
		session.delete("Team.leftver",teamDto); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
}
