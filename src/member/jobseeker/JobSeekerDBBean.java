package member.jobseeker;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class JobSeekerDBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	public int jbskReg(JobSeekerDataBean jbskDto) { // 임시매개변수. 필요시 변경할것.
		int rst=0;
		return rst; // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int jbskLgn(String jbskId, String jbskPasswd) { // 임시매개변수. 필요시 변경할것.
		int result = 0;
		
		if(check(jbskId)>0) {
			// 아이디가 있다
			JobSeekerDataBean jbskDto = jbskGet(jbskId);
			if( jbskPasswd.equals( jbskDto.getJbskPasswd() ) ) {
				//비밀번호 같다
				result = 1;
			} else {
				//비밀번호 다르다
				result = -1;
			}				
		} else {
			// 아이디가 없다
			result = 0;				
		}
		return result;
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
