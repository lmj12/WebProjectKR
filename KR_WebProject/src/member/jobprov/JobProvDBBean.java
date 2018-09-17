package member.jobprov;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class JobProvDBBean {
private SqlSession session = SqlMapClient.getSession();
	
	public int jobpReg(JobProvDataBean jbpDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public JobProvDataBean jobpLgn(String iptId, String iptPasswd) { // 임시매개변수. 필요시 변경할것.
		JobProvDataBean jbpDto = new JobProvDataBean();
		return jbpDto; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public JobProvDataBean jobpGet(String jbpId) { // 임시매개변수. 필요시 변경할것.
		JobProvDataBean jbpDto = new JobProvDataBean();
		return jbpDto; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int jobpMod(JobProvDataBean jbpDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int jobpDel(String jbpId) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
}
