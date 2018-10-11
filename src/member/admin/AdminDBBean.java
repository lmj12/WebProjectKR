package member.admin;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class AdminDBBean {
private SqlSession session = SqlMapClient.getSession();
	
	public AdminDataBean adminLgn(AdminDataBean admDto) { // 임시매개변수. 필요시 변경할것.
		return session.selectOne("Adm.lgn",admDto); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
}
