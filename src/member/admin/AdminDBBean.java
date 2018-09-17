package member.admin;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class AdminDBBean {
private SqlSession session = SqlMapClient.getSession();
	
	public AdminDataBean adminLgn(String iptId, String iptPasswd) { // 임시매개변수. 필요시 변경할것.
		AdminDataBean adminDto = new AdminDataBean();
		return adminDto; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
}
