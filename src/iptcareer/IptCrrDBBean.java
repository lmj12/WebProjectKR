package iptcareer;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class IptCrrDBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	public int iptCheck( String memid ) {
		// kriptcareer 안에 해당 아이디 입력경력사항 리스트가 있는지 확인
		return session.selectOne("IptCrr.iptCheck", memid);
	}
	
	public int iptWrt(IptCrrDataBean iptCrrDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int iptMod(IptCrrDataBean iptCrrDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int iptDel(int iptId) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public IptCrrDataBean iptGet(int iptId) {
		// 리스트에서 한 개 
		IptCrrDataBean iptCrrDto = new IptCrrDataBean();
		return iptCrrDto; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public List<IptCrrDataBean> iptList(String jbskId) {
		List<IptCrrDataBean> iptCrrs = new ArrayList<IptCrrDataBean>();
		// iptCrrHd -> iptCrr.jsp
		
		return iptCrrs;
	}
}
