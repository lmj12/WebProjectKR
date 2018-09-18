package member.jobprov;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlMapClient;

public class JobProvDBBean {
private SqlSession session = SqlMapClient.getSession();
	
	public int jobpReg(JobProvDataBean jbpDto) { // 임시매개변수. 필요시 변경할것.
		return session.insert("Jbp.jobpReg", jbpDto); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int check( String jobpId ) {
		return session.selectOne("Jbp.checkId", jobpId);	
	}
	
	public int jobpLgn(String jobpId, String jobpPasswd) { // 임시매개변수. 필요시 변경할것.
		int result = 0;
		if( check(jobpId) >0 ) {
			// 아이디가 있다
			JobProvDataBean jbtDto = jobpGet(jobpId);
			if( jobpPasswd.equals( jbtDto.getJobpPasswd() ) ) {
				result = 1;
			} else {
				result = -1;
			}				
		} else {
			// 아이디가 없다
			result = 0;				
		}
		return result;
	}
	
	public JobProvDataBean jobpGet(String jbpId) { // 임시매개변수. 필요시 변경할것.
		return session.selectOne("Jbp.jobpGet", jbpId); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int jobpMod(JobProvDataBean jbpDto) { // 임시매개변수. 필요시 변경할것.
		return session.update("Jbp.jobpMod", jbpDto); // 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
	
	public int jobpDel(String jbpId) { // 임시매개변수. 필요시 변경할것.
		return session.delete("Jbp.jobpDel", jbpId);			
		// 에러막기위한 임시 리턴. 필요없으면 지울것.
	}
}
