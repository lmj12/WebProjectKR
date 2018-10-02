package iptcareer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class IptCrrDBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	public int iptCheck( String jbskId ) {
		// kriptcareer 안에 해당 아이디 입력경력사항 리스트가 있는지 확인
		return session.selectOne("IptCrr.iptCheck", jbskId);
	}
	
	public int iptWrt(IptCrrDataBean iptCrrDto) { 
		return session.insert("IptCrr.insertIptCrr", iptCrrDto); 
	}
	
	public int iptMod(IptCrrDataBean iptCrrDto) { // 임시
		int rst=0;
		return rst; 
	}
	
	public int iptDel(int iptId) {	// 임시
		int rst=0;
		return rst; 
	}
	
	public IptCrrDataBean iptGet(int iptId) {	// 임시
		// 리스트에서 한 개 
		IptCrrDataBean iptCrrDto = new IptCrrDataBean();
		return iptCrrDto; 
	}
	
	public List<IptCrrDataBean> iptList(String jbskId) {
		// iptCrrHd -> iptCrr.jsp
		return session.selectList("IptCrr.iptList", jbskId);
	}
}
