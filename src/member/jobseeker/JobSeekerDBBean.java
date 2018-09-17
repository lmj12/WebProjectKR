package member.jobseeker;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class JobSeekerDBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	public int jbskReg(JobSeekerDataBean jbskDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int jbskLgn(String iptId, String iptPasswd) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public JobSeekerDataBean jbskGet(String jbskId) { // 임시매개변수. 필요시 변경할것.
		JobSeekerDataBean jbskDto = new JobSeekerDataBean();
		return jbskDto; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int jbskMod(JobSeekerDataBean jbskDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int jbskDel(String jbskId) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
}
