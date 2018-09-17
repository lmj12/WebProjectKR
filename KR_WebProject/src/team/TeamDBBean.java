package team;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class TeamDBBean {
private SqlSession session = SqlMapClient.getSession();
	
	public int teamReq(TeamDataBean teamDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public void teamAssign(String jbskId) { // 임시매개변수. 필요시 변경할것.

	}
	
	public int teamExit(String jbskId) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public List <TeamDataBean> teamList(String jbpId) { // 임시매개변수. 필요시 변경할것.
		List <TeamDataBean> teamMembers =  new ArrayList<TeamDataBean>();
		return teamMembers; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
}
