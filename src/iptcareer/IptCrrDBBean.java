package iptcareer;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class IptCrrDBBean {
private SqlSession session = SqlMapClient.getSession();
	
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
	
	public IptCrrDataBean iptGet(int iptId) { // 임시매개변수. 필요시 변경할것.
		IptCrrDataBean iptCrrDto = new IptCrrDataBean();
		return iptCrrDto; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public List<IptCrrDataBean> iptList(String jbskId) { // 임시매개변수. 필요시 변경할것.
		List<IptCrrDataBean> iptCrrs = new ArrayList<IptCrrDataBean>();
		return iptCrrs; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
}
